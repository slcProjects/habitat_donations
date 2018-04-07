package com.spring.form.web;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.ServletRequestDataBinder;

import com.spring.form.model.Attachment;
import com.spring.form.model.Donation;
import com.spring.form.model.Login;
import com.spring.form.model.Search;
import com.spring.form.model.Status;
import com.spring.form.model.User;
import com.spring.form.service.AttachmentService;
import com.spring.form.service.DonationService;
import com.spring.form.service.UserService;
import com.spring.form.validator.DonationFormValidator;
import com.spring.form.validator.LoginFormValidator;
import com.spring.form.validator.SearchFormValidator;
import com.spring.form.validator.StatusValidator;
import com.spring.form.validator.UserFormValidator;

//http://www.tikalk.com/redirectattributes-new-feature-spring-mvc-31/
//https://en.wikipedia.org/wiki/Post/Redirect/Get
//http://www.oschina.net/translate/spring-mvc-flash-attribute-example
@Controller
@Scope("session")
public class UserController {

	private final Logger logger = LoggerFactory.getLogger(UserController.class);
	private String currentRole = "";
	private int currentId = 0;
	private SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE MMMM dd, yyyy");
	private String months[] = { "January", "February", "March", "April", "May", "June", "July", "August", "September",
			"October", "November", "December" };
	GregorianCalendar today = null;
	int month = 0, year = 0;
	private static final String STATUSFORM_PATTERN = "^statusForm\\d+$";
	List<Attachment> images = null;

	@Autowired
	LoginFormValidator loginFormValidator;

	@Autowired
	UserFormValidator userFormValidator;

	@Autowired
	SearchFormValidator searchFormValidator;

	@Autowired
	DonationFormValidator donationFormValidator;

	@Autowired
	StatusValidator statusValidator;

	@InitBinder("loginForm")
	protected void initLoginBinder(WebDataBinder binder) {
		binder.addValidators(loginFormValidator);
	}

	@InitBinder("userForm")
	protected void initUserBinder(WebDataBinder binder) {
		binder.addValidators(userFormValidator);
	}

	@InitBinder("searchForm")
	protected void initSearchBinder(WebDataBinder binder) {
		binder.addValidators(searchFormValidator);
	}

	@InitBinder("donationForm")
	protected void initDonationBinder(WebDataBinder binder) {
		binder.addValidators(donationFormValidator);
	}

	@InitBinder(STATUSFORM_PATTERN)
	protected void initStatusBinder(WebDataBinder binder) {
		binder.addValidators(statusValidator);
	}

	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
		// Convert multipart object to byte[]
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}

	private UserService userService;
	private DonationService donationService;
	private AttachmentService attachmentService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setDonationService(DonationService donationService) {
		this.donationService = donationService;
	}

	@Autowired
	public void setAttachmentService(AttachmentService attachmentService) {
		this.attachmentService = attachmentService;
	}

	// log in redirect or dashboard redirect
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {

		logger.debug("index()");
		if (!currentRole.equals("") && currentId != 0) {
			return "redirect:/dashboard";
		} else {
			return "redirect:/main";
		}

	}

	// log in page or dashboard redirect
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {

		logger.debug("main()");

		if (!currentRole.equals("") && currentId != 0) {
			return "redirect:/dashboard";
		} else {
			Login login = new Login();
			login.setUsernameError("");
			login.setPasswordError("");
			model.addAttribute("loginForm", login);
			return "login/loginform";
		}

	}

	// checks username and password
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("loginForm") @Validated Login login, BindingResult result, Model model,
			final RedirectAttributes redirectAttributes) {

		logger.debug("login()");

		if (result.hasErrors()) {
			return "login/loginform";
		} else {
			String username = login.getUsername();
			String password = login.getPassword();
			User user = userService.findByLoginName(username);

			if (user == null || !user.getPassword().equals(password)) {
				redirectAttributes.addFlashAttribute("css", "danger");
				redirectAttributes.addFlashAttribute("msg", "The username or password is incorrect.");
				return "redirect:/main";
			} else {
				currentRole = user.getRole();
				currentId = user.getId();
				redirectAttributes.addFlashAttribute("css", "success");
				redirectAttributes.addFlashAttribute("msg", currentRole + " logged in successfully!");
				if (currentRole.equals("Donor")) {
					redirectAttributes.addFlashAttribute("role", currentRole);
				}
				return "redirect:/dashboard";
			}
		}

	}

	// log out
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("logout()");
		currentRole = "";
		currentId = 0;
		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "Logged out successfully!");
		return "redirect:/main";

	}

	// dashboards
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboards(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("dashboard()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else {
			today = new GregorianCalendar();
			model.addAttribute("userId", currentId);
			if (currentRole.equals("Staff")) {
				month = today.get(Calendar.MONTH);
				year = today.get(Calendar.YEAR);
				model.addAttribute("day", today.get(Calendar.DAY_OF_MONTH));
				model.addAttribute("month", month);
				model.addAttribute("year", year);
				return "dashboard/staff";
			} else {
				return "dashboard/donor";
			}
		}

	}

	// list page
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String showAllUsers(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("showAllUsers()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			model.addAttribute("users", userService.findAll());
			return "users/list";
		}

	}

	// save or update user
	@RequestMapping(value = "/users", method = RequestMethod.POST)
	public String saveOrUpdateUser(@ModelAttribute("userForm") @Validated User user, BindingResult result, Model model,
			final RedirectAttributes redirectAttributes) {

		logger.debug("saveOrUpdateUser() : {}", user);

		if (result.hasErrors()) {
			populateProvinces(model);
			model.addAttribute("role", currentRole);
			return "users/userform";
		} else {

			redirectAttributes.addFlashAttribute("css", "success");
			if (user.isNew()) {
				redirectAttributes.addFlashAttribute("msg", "User added successfully!");
			} else {
				redirectAttributes.addFlashAttribute("msg", "User updated successfully!");
			}

			userService.saveOrUpdate(user);

			// POST/REDIRECT/GET
			if (currentRole.equals("Staff")) {
				return "redirect:/users";
			} else {
				currentRole = user.getRole();
				currentId = user.getId();
				return "redirect:/dashboard";
			}

			// POST/FORWARD/GET
			// return "user/list";

		}

	}

	// show add user form
	@RequestMapping(value = "/users/add", method = RequestMethod.GET)
	public String showAddUserForm(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("showAddUserForm()");

		User user = new User();
		user.setProvince("ON");

		model.addAttribute("userForm", user);
		model.addAttribute("role", currentRole);

		populateProvinces(model);

		return "users/userform";

	}

	// show register user form
	@RequestMapping(value = "/users/register", method = RequestMethod.GET)
	public String showRegisterUserForm(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("showRegisterUserForm()");

		User user = new User();
		user.setProvince("ON");
		user.setRole("Donor");

		model.addAttribute("userForm", user);

		populateProvinces(model);

		return "users/userform";

	}

	// show update form
	@RequestMapping(value = "/users/{id}/update", method = RequestMethod.GET)
	public String showUpdateUserForm(@PathVariable("id") int id, Model model,
			final RedirectAttributes redirectAttributes) {

		logger.debug("showUpdateUserForm() : {}", id);

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else {
			User user = userService.findById(id);
			model.addAttribute("userForm", user);
			model.addAttribute("role", currentRole);

			populateProvinces(model);

			return "users/userform";
		}

	}

	// delete user
	@RequestMapping(value = "/users/{id}/delete", method = RequestMethod.GET)
	public String deleteUser(@PathVariable("id") int id, final RedirectAttributes redirectAttributes) {

		logger.debug("deleteUser() : {}", id);

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			userService.delete(id);

			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg", "User is deleted!");

			return "redirect:/users";
		}

	}

	// show user
	@RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
	public String showUser(@PathVariable("id") int id, Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("showUser() id: {}", id);

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else {
			User user = userService.findById(id);
			if (user == null) {
				model.addAttribute("css", "danger");
				model.addAttribute("msg", "User not found");
			}
			model.addAttribute("user", user);
			model.addAttribute("role", currentRole);

			return "users/show";
		}

	}

	// user search form
	@RequestMapping(value = "/users/searchform", method = RequestMethod.GET)
	public String searchForm(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("searchForm()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			model.addAttribute("searchForm", new Search());
			populateMonths(model);
			return "users/searchform";
		}

	}

	// user search result
	@RequestMapping(value = "/users/searchresult", method = RequestMethod.POST)
	public String searchUser(@ModelAttribute("searchForm") @Validated Search search, BindingResult result, Model model,
			final RedirectAttributes redirectAttributes) {

		logger.debug("searchUser() search : {}", search);

		if (result.hasErrors()) {
			populateMonths(model);
			return "users/searchform";
		} else {

			String first = search.getFirstName();
			String last = search.getLastName();
			String city = search.getCity();
			String code = search.getPostalCode();
			String role = search.getRole();
			if (role == null) {
				role = "";
			}
			String startMonth = search.getStartMonth();
			String endMonth = search.getEndMonth();
			String startYear = search.getStartYear();
			String endYear = search.getEndYear();
			List<User> users = userService.search(first, last, city, code, role, startMonth, endMonth, startYear,
					endYear);
			if (users == null) {
				model.addAttribute("css", "danger");
				model.addAttribute("msg", "User not found");
			}
			model.addAttribute("users", users);

			return "users/searchresult";

		}

	}

	// donation list page
	@RequestMapping(value = "/donations", method = RequestMethod.GET)
	public String showAllDonations(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("showAllDonations()");
		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			List<Donation> dons = donationService.findAll();
			int previousId = 0;
			int decrease = 0;
			List<Integer> indexes = new ArrayList<>();
			for (int ctr = 0; ctr < dons.size(); ctr++) {
				if (previousId != dons.get(ctr).getId()) {
					previousId = dons.get(ctr).getId();
					decrease = 1;
				} else if (previousId == dons.get(ctr).getId()) {
					dons.get(ctr - decrease).getScheduledDate().add(dons.get(ctr).getScheduledDate().get(0));
					dons.get(ctr - decrease).getMeridian().add(dons.get(ctr).getMeridian().get(0));
					indexes.add(ctr);
					decrease++;
				}
			}
			for (int ctr = indexes.size() - 1; ctr >= 0; ctr--) {
				int index = indexes.get(ctr);
			    dons.remove(index);
			}
			model.addAttribute("donations", dons);
			return "donations/list";
		}

	}

	// donation list page for user
	@RequestMapping(value = "/donationsforuser", method = RequestMethod.GET)
	public String showAllDonationsForUser(Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("showAllDonationsForUser()");
		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else {
			model.addAttribute("role", currentRole);
			
			List<Donation> dons = donationService.findByUserId(currentId);
			int previousId = 0;
			int decrease = 0;
			if (dons.size() > 1) {
				List<Integer> indexes = new ArrayList<>();
				for (int ctr = 0; ctr < dons.size(); ctr++) {
					if (previousId != dons.get(ctr).getId()) {
						previousId = dons.get(ctr).getId();
						decrease = 1;
					} else if (previousId == dons.get(ctr).getId()) {
						dons.get(ctr - decrease).getScheduledDate().add(dons.get(ctr).getScheduledDate().get(0));
						dons.get(ctr - decrease).getMeridian().add(dons.get(ctr).getMeridian().get(0));
						indexes.add(ctr);
						decrease++;
					}
				}
				for (int ctr = indexes.size() - 1; ctr >= 0; ctr--) {
					int index = indexes.get(ctr);
					dons.remove(index);
				}
			}
			
			model.addAttribute("donations", dons);
			
			return "donations/listforuser";
		}

	}

	// save or update donation
	@RequestMapping(value = "/donations", method = RequestMethod.POST)
	public String saveOrUpdateDonation(@ModelAttribute("donationForm") @Validated Donation donation,
			BindingResult result, Model model, final RedirectAttributes redirectAttributes,
			HttpServletResponse response, HttpServletRequest request) {

		logger.debug("saveOrUpdateDonation() : {}", donation);
		
		String checkedAm[] = request.getParameterValues("am");
		String checkedPm[] = request.getParameterValues("pm");
		donation.setDateError("");

		if (result.hasErrors() || checkedAm == null && checkedPm == null) {
			
			if (checkedAm == null && checkedPm == null) {
				donation.setDateError("gfield_error");
				model.addAttribute("dateError", true);
			}
			year = today.get(Calendar.YEAR);
			month = today.get(Calendar.MONTH);
			int day = today.get(Calendar.DATE);
			
			GregorianCalendar first = new GregorianCalendar(year, month, 1);
			int daysInMonth = first.getActualMaximum(Calendar.DAY_OF_MONTH);
			int firstOfMonth = first.get(Calendar.DAY_OF_WEEK);

			GregorianCalendar last = new GregorianCalendar(year, month, daysInMonth);
			int weeksInMonth = last.get(Calendar.WEEK_OF_MONTH);

			model.addAttribute("monthName", months[month]);
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			model.addAttribute("day", day);
			model.addAttribute("daysInMonth", daysInMonth);
			model.addAttribute("first", firstOfMonth);
			model.addAttribute("weeksInMonth", weeksInMonth);
			
			if (!donation.isNew()) {
				images = attachmentService.findByDonation(donation.getId());
				Boolean noImage = false;
				List<Integer> imageIds = new ArrayList<>();
				for (int ctr = 0; ctr < images.size(); ctr++) {
					Attachment attach = images.get(ctr);
					if (attach.getImage() != null) {
						imageIds.add(attach.getId());
					}
				}
				if (imageIds.size() == 0) {
					noImage = true;
				} else {
					model.addAttribute("imageIds", imageIds);
				}
				model.addAttribute("noImage", noImage);
			} else {
				model.addAttribute("noImage", true);
			}
			
			populateProvinces(model);
			populateDonationTypes(model);
			populateDonationStatuses(model);
			model.addAttribute("role", currentRole);
			return "donations/donateform";
		} else {
			
			if (checkedAm != null) {
				for (int ctr = 0; ctr < checkedAm.length; ctr++) {
					GregorianCalendar calendar = new GregorianCalendar(year, month, Integer.parseInt(checkedAm[ctr]));
					donation.getScheduledDate().add(calendar.getTime());
					donation.getMeridian().add("AM");
				}
			}
			
			if (checkedPm != null) {
				for (int ctr = 0; ctr < checkedPm.length; ctr++) {
					GregorianCalendar calendar = new GregorianCalendar(year, month, Integer.parseInt(checkedPm[ctr]));
					donation.getScheduledDate().add(calendar.getTime());
					donation.getMeridian().add("PM");
				}
			}

			donation.setTacking(new Timestamp(new java.util.Date().getTime()));
			if (donation.getStatus().equals("RECEIVED") || donation.getStatus().equals("PICKUP COMPLETE")) {
				donation.setCompletedDate(new Timestamp(new java.util.Date().getTime()));
			} else {
				donation.setCompletedDate(null);
			}
			donationService.saveOrUpdate(donation);

			redirectAttributes.addFlashAttribute("css", "success");
			if (donation.isNew()) {
				donation.setNumImages(0);
				redirectAttributes.addFlashAttribute("msg", "Donation ID " + donation.getId() + " added successfully!");
			} else {
				redirectAttributes.addFlashAttribute("msg", "Donation updated successfully!");
			}

			int numImages = donation.getNumImages();
			
			int id = donation.getId();
			if (!donation.getFile1().getContentType().contains("application/octet-stream")
					|| donation.getFile1() != null) {
				try {
					InputStream input = donation.getFile1().getInputStream();
					ImageIO.read(input).toString();
					saveAttachment(donation.getFile1(), id);
					numImages++;
					redirectAttributes.addFlashAttribute("file1", "File 1: Image uploaded");
				} catch (Exception e) {
					redirectAttributes.addFlashAttribute("file1", "File 1: Upload failed");
				}
			}
			if (!donation.getFile2().getContentType().contains("application/octet-stream")
					|| donation.getFile2() != null) {
				try {
					InputStream input = donation.getFile2().getInputStream();
					ImageIO.read(input).toString();
					saveAttachment(donation.getFile2(), id);
					numImages++;
					redirectAttributes.addFlashAttribute("file2", "File 2: Image uploaded");
				} catch (Exception e) {
					redirectAttributes.addFlashAttribute("file2", "File 2: Upload failed");
				}
			}
			if (!donation.getFile3().getContentType().contains("application/octet-stream")
					|| donation.getFile3() != null) {
				try {
					InputStream input = donation.getFile3().getInputStream();
					ImageIO.read(input).toString();
					saveAttachment(donation.getFile3(), id);
					numImages++;
					redirectAttributes.addFlashAttribute("file3", "File 3: Image uploaded");
				} catch (Exception e) {
					redirectAttributes.addFlashAttribute("file3", "File 3: Upload failed");
				}
			}
			if (!donation.getFile4().getContentType().contains("application/octet-stream")
					|| donation.getFile4() != null) {
				try {
					InputStream input = donation.getFile4().getInputStream();
					ImageIO.read(input).toString();
					saveAttachment(donation.getFile4(), id);
					numImages++;
					redirectAttributes.addFlashAttribute("file4", "File 4: Image uploaded");
				} catch (Exception e) {
					redirectAttributes.addFlashAttribute("file4", "File 4: Upload failed");
				}
			}

			donation.setNumImages(numImages);
			donationService.saveOrUpdate(donation);
			redirectAttributes.addFlashAttribute("role", currentRole);

			// POST/REDIRECT/GET
			return "redirect:/confirmation/" + donation.getId();

			// POST/FORWARD/GET
			// return "confirmation/confirm";

		}

	}

	// show add donation form
	@RequestMapping(value = "/donations/{id}/add", method = RequestMethod.GET)
	public String showAddDonationForm(Model model, @PathVariable("id") int id,
			final RedirectAttributes redirectAttributes) {

		logger.debug("showAddDonationForm()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else {
			Donation donation = new Donation();
			User donor = userService.findById(id);

			// set default value
			donation.setDonor(donor.getId());
			donation.setAddress(donor.getAddress());
			donation.setCity(donor.getCity());
			donation.setProvince(donor.getProvince());
			donation.setPostalCode(donor.getPostalCode());
			donation.setStatus("AWAITING APPROVAL");
			donation.setNumImages(0);
			
			year = today.get(Calendar.YEAR);
			month = today.get(Calendar.MONTH);
			int day = today.get(Calendar.DATE);
			
			GregorianCalendar first = new GregorianCalendar(year, month, 1);
			int daysInMonth = first.getActualMaximum(Calendar.DAY_OF_MONTH);
			int firstOfMonth = first.get(Calendar.DAY_OF_WEEK);

			GregorianCalendar last = new GregorianCalendar(year, month, daysInMonth);
			int weeksInMonth = last.get(Calendar.WEEK_OF_MONTH);

			model.addAttribute("monthName", months[month]);
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			model.addAttribute("day", day);
			model.addAttribute("daysInMonth", daysInMonth);
			model.addAttribute("first", firstOfMonth);
			model.addAttribute("weeksInMonth", weeksInMonth);

			model.addAttribute("donationForm", donation);
			model.addAttribute("noImage", true);
			model.addAttribute("role", currentRole);

			populateProvinces(model);
			populateDonationTypes(model);
			populateDonationStatuses(model);

			return "donations/donateform";
		}

	}

	// show update form
	@RequestMapping(value = "/donations/{id}/update", method = RequestMethod.GET)
	public String showUpdateDonationForm(@PathVariable("id") int id, Model model,
			final RedirectAttributes redirectAttributes) {

		logger.debug("showUpdateDonationForm() : {}", id);

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			List<Donation> dons = donationService.findById(id);
			int decrease = 1;
			for (int ctr = 0; ctr < dons.size(); ctr++) {
				if (ctr != 0) {
					dons.get(ctr - decrease).getScheduledDate().add(dons.get(ctr).getScheduledDate().get(0));
					dons.get(ctr - decrease).getMeridian().add(dons.get(ctr).getMeridian().get(0));
					decrease++;
				}
			}
			for (int ctr = dons.size() - 1; ctr >= 1; ctr--) {
				dons.remove(ctr);
			}
			Donation donation = dons.get(0);
			images = attachmentService.findByDonation(id);
			model.addAttribute("donationForm", donation);

			Boolean noImage = false;
			List<Integer> imageIds = new ArrayList<>();
			for (int ctr = 0; ctr < images.size(); ctr++) {
				Attachment attach = images.get(ctr);
				if (attach.getImage() != null) {
					imageIds.add(attach.getId());
				}
			}
			if (imageIds.size() == 0) {
				noImage = true;
			} else {
				model.addAttribute("imageIds", imageIds);
			}
			model.addAttribute("noImage", noImage);
			model.addAttribute("role", currentRole);
			
			year = today.get(Calendar.YEAR);
			month = today.get(Calendar.MONTH);
			int day = today.get(Calendar.DATE);
			
			GregorianCalendar first = new GregorianCalendar(year, month, 1);
			int daysInMonth = first.getActualMaximum(Calendar.DAY_OF_MONTH);
			int firstOfMonth = first.get(Calendar.DAY_OF_WEEK);

			GregorianCalendar last = new GregorianCalendar(year, month, daysInMonth);
			int weeksInMonth = last.get(Calendar.WEEK_OF_MONTH);

			model.addAttribute("monthName", months[month]);
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			model.addAttribute("day", day);
			model.addAttribute("daysInMonth", daysInMonth);
			model.addAttribute("first", firstOfMonth);
			model.addAttribute("weeksInMonth", weeksInMonth);

			populateProvinces(model);
			populateDonationTypes(model);
			populateDonationStatuses(model);

			return "donations/donateform";
		}

	}

	// delete donation
	@RequestMapping(value = "/donations/{id}/delete", method = RequestMethod.GET)
	public String deleteDonation(@PathVariable("id") int id, final RedirectAttributes redirectAttributes) {

		logger.debug("deleteDonation() : {}", id);

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			List<Attachment> images = attachmentService.findByDonation(id);

			for (int ctr = 0; ctr < images.size(); ctr++) {
				attachmentService.delete(images.get(ctr).getId());
			}

			donationService.delete(id);

			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg", "Donation is deleted!");

			return "redirect:/donations";
		}

	}

	// show donation
	@RequestMapping(value = "/donations/{id}", method = RequestMethod.GET)
	public String showDonation(@PathVariable("id") int id, Model model, HttpServletResponse response,
			HttpServletRequest request, final RedirectAttributes redirectAttributes) {

		logger.debug("showDonation() donation id: {}", id);

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else {
			List<Donation> dons = donationService.findById(id);
			int decrease = 1;
			if (dons.size() > 1) {
				for (int ctr = 0; ctr < dons.size(); ctr++) {
					if (ctr != 0) {
						dons.get(ctr - decrease).getScheduledDate().add(dons.get(ctr).getScheduledDate().get(0));
						dons.get(ctr - decrease).getMeridian().add(dons.get(ctr).getMeridian().get(0));
						decrease++;
					}
				}
				for (int ctr = dons.size() - 1; ctr >= 1; ctr--) {
					dons.remove(ctr);
				}
			}
			
			Donation donation = dons.get(0);
			List<Attachment> images = attachmentService.findByDonation(id);

			if (donation == null) {
				model.addAttribute("css", "danger");
				model.addAttribute("msg", "Donation not found");
			}
			model.addAttribute("donation", donation);

			GregorianCalendar calendar = new GregorianCalendar();
			calendar.setTime(donation.getScheduledDate().get(0));
			month = calendar.get(Calendar.MONTH);
			year = calendar.get(Calendar.YEAR);

			Boolean noImage = false;
			List<Integer> imageIds = new ArrayList<>();
			for (int ctr = 0; ctr < images.size(); ctr++) {
				Attachment attach = images.get(ctr);
				if (attach.getImage() != null) {
					imageIds.add(attach.getId());
				}
			}
			if (imageIds.size() == 0) {
				noImage = true;
			} else {
				model.addAttribute("imageIds", imageIds);
			}
			model.addAttribute("noImage", noImage);
			model.addAttribute("role", currentRole);
			model.addAttribute("month", month);
			model.addAttribute("year", year);

			return "donations/show";
		}

	}

	// donation confirm page
	@RequestMapping(value = "/confirmation/{id}", method = RequestMethod.GET)
	public String donationConfirm(@PathVariable("id") int id, Model model,
			final RedirectAttributes redirectAttributes) {

		logger.debug("donationConfirm() id : {}", id);

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else {
			model.addAttribute("donId", id);
			model.addAttribute("msg", "Donation ID " + id + " added successfully!");
			return "confirmation/confirm";
		}

	}

	// day schedule page
	@RequestMapping(value = "/schedule/{month}/{day}/{year}", method = RequestMethod.GET)
	public String donationSchedule(@PathVariable("month") int month, @PathVariable("day") int day,
			@PathVariable("year") int year, Model model, HttpServletResponse response, HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {

		logger.debug("donationSchedule()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			return getSchedule(model, month, day, year) + "schedule";
		}

	}

	// printer friendly day schedule page
	@RequestMapping(value = "/schedule/print/{month}/{day}/{year}", method = RequestMethod.GET)
	public String printFriendlySchedule(@PathVariable("month") int month, @PathVariable("day") int day,
			@PathVariable("year") int year, Model model, HttpServletResponse response, HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {

		logger.debug("printFriendlySchedule()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			return getSchedule(model, month, day, year) + "printschedule";
		}

	}

	// process day schedule
	private String getSchedule(Model model, int month, int day, int year) {

		GregorianCalendar date = new GregorianCalendar(year, month, day);

		List<Donation> dons = donationService.findByScheduledDate(date.getTime());
		int previousId = 0;
		int decrease = 0;
		if (dons.size() > 1) {
			List<Integer> indexes = new ArrayList<>();
			for (int ctr = 0; ctr < dons.size(); ctr++) {
				if (previousId != dons.get(ctr).getId()) {
					previousId = dons.get(ctr).getId();
					decrease = 1;
				} else if (previousId == dons.get(ctr).getId()) {
					dons.get(ctr - decrease).getScheduledDate().add(dons.get(ctr).getScheduledDate().get(0));
					dons.get(ctr - decrease).getMeridian().add(dons.get(ctr).getMeridian().get(0));
					indexes.add(ctr);
					decrease++;
				}
			}
			for (int ctr = indexes.size() - 1; ctr >= 0; ctr--) {
				int index = indexes.get(ctr);
				dons.remove(index);
			}
		}
		Status status;

		for (int ctr = 0; ctr < dons.size(); ctr++) {
			status = new Status();
			status.setId(dons.get(ctr).getId());
			status.setStatus(dons.get(ctr).getStatus());
			status.setDay(day);
			status.setMonth(month);
			status.setYear(year);
			status.setType("day");
			model.addAttribute("statusForm" + dons.get(ctr).getId(), status);
		}

		model.addAttribute("date", dayFormat.format(date.getTime()));
		model.addAttribute("donations", dons);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("year", year);

		populateDonationStatuses(model);

		return "calendar/";
	}

	// donation calendar
	@RequestMapping(value = "/calendar/{month}/{year}/{sequence}", method = RequestMethod.GET)
	public String calendar(@PathVariable("month") int month, @PathVariable("year") int year,
			@PathVariable("sequence") String sequence, Model model, final RedirectAttributes redirectAttributes) {

		logger.debug("calendar()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			if (!sequence.equals("recent")) {
				if (sequence.equals("last")) {
					if (month == 0) {
						month = 11;
						year--;
					} else {
						month--;
					}
				} else if (sequence.equals("next")) {
					if (month == 11) {
						month = 0;
						year++;
					} else {
						month++;
					}
				} else {
					year = today.get(Calendar.YEAR);
					month = today.get(Calendar.MONTH);
				}
			}

			if (today.get(Calendar.YEAR) == year && today.get(Calendar.MONTH) == month) {
				int day = today.get(Calendar.DATE);
				model.addAttribute("day", day);
			}

			GregorianCalendar first = new GregorianCalendar(year, month, 1);
			int daysInMonth = first.getActualMaximum(Calendar.DAY_OF_MONTH);
			int firstOfMonth = first.get(Calendar.DAY_OF_WEEK);

			GregorianCalendar last = new GregorianCalendar(year, month, daysInMonth);
			int weeksInMonth = last.get(Calendar.WEEK_OF_MONTH);

			List<Donation> donations = donationService.findByScheduledMonth(month + 1, year);
			for (int ctr = 0; ctr < donations.size(); ctr++) {
				User user = userService.findById(donations.get(ctr).getDonor());
				donations.get(ctr).setDonorName(user.getFirstName() + " " + user.getLastName());
			}

			model.addAttribute("monthName", months[month]);
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			model.addAttribute("daysInMonth", daysInMonth);
			model.addAttribute("first", firstOfMonth);
			model.addAttribute("weeksInMonth", weeksInMonth);
			model.addAttribute("donations", donations);

			this.month = month;
			this.year = year;

			return "calendar/calendar";
		}

	}

	// week schedule page
	@RequestMapping(value = "/calendar/weekof/{day}/{month}/{year}", method = RequestMethod.GET)
	private String scheduleWeek(@PathVariable("day") int day, @PathVariable("month") int month,
			@PathVariable("year") int year, Model model, HttpServletResponse response, HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {

		logger.debug("scheduleWeek()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			return getWeekSchedule(model, day, month, year) + "weekschedule";
		}

	}

	// printer friendly week schedule page
	@RequestMapping(value = "/weekof/print/{day}/{month}/{year}", method = RequestMethod.GET)
	private String scheduleWeekPrint(@PathVariable("day") int day, @PathVariable("month") int month,
			@PathVariable("year") int year, Model model, HttpServletResponse response, HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {

		logger.debug("scheduleWeek()");

		if (currentRole.equals("") || currentId == 0) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You must log in to access the website.");
			return "redirect:/main";
		} else if (!currentRole.equals("Staff")) {
			redirectAttributes.addFlashAttribute("css", "danger");
			redirectAttributes.addFlashAttribute("msg", "You do not have permission to access this page.");
			return "redirect:/dashboard";
		} else {
			return getWeekSchedule(model, day, month, year) + "printweekschedule";
		}

	}

	// process week schedule
	private String getWeekSchedule(Model model, int day, int month, int year) {

		logger.debug("getWeekSchedule()");

		GregorianCalendar firstOfWeek = new GregorianCalendar(year, month, day);
		int lastDayOfWeek = day;
		switch (firstOfWeek.get(Calendar.DAY_OF_WEEK)) {
		case 1:
			lastDayOfWeek += 6;
			break;
		case 2:
			lastDayOfWeek += 5;
			break;
		case 3:
			lastDayOfWeek += 4;
			break;
		case 4:
			lastDayOfWeek += 3;
			break;
		case 5:
			lastDayOfWeek += 2;
			break;
		case 6:
			lastDayOfWeek += 1;
		}

		List<Donation> dons = donationService.findByScheduledWeekOfMonth(day, lastDayOfWeek, month + 1, year);
		int previousId = 0;
		int decrease = 0;
		if (dons.size() > 1) {
			List<Integer> indexes = new ArrayList<>();
			for (int ctr = 0; ctr < dons.size(); ctr++) {
				if (previousId != dons.get(ctr).getId()) {
					previousId = dons.get(ctr).getId();
					decrease = 1;
				} else if (previousId == dons.get(ctr).getId()) {
					dons.get(ctr - decrease).getScheduledDate().add(dons.get(ctr).getScheduledDate().get(0));
					dons.get(ctr - decrease).getMeridian().add(dons.get(ctr).getMeridian().get(0));
					indexes.add(ctr);
					decrease++;
				}
			}
			for (int ctr = indexes.size() - 1; ctr >= 0; ctr--) {
				int index = indexes.get(ctr);
				dons.remove(index);
			}
		}
		
		Status status;
		for (int ctr = 0; ctr < dons.size(); ctr++) {
			status = new Status();
			status.setId(dons.get(ctr).getId());
			status.setStatus(dons.get(ctr).getStatus());
			status.setDay(day);
			status.setMonth(month);
			status.setYear(year);
			status.setType("week");
			model.addAttribute("statusForm" + dons.get(ctr).getId(), status);
		}

		model.addAttribute("week", months[month] + " " + day + " - " + lastDayOfWeek + ", " + year);
		model.addAttribute("day", day);
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		model.addAttribute("donations", dons);

		populateDonationStatuses(model);

		return "calendar/";

	}

	// update donation status
	@RequestMapping(value = "/statusupdate", method = RequestMethod.POST)
	public String updateStatus(@ModelAttribute(STATUSFORM_PATTERN) @Validated Status status, BindingResult result, Model model,
			final RedirectAttributes redirectAttributes, HttpServletResponse response, HttpServletRequest request) {

		logger.debug("updateStatus() status : {}", status);
		
		populateDonationStatuses(model);

		if (result.hasErrors()) {
			model.addAttribute("error", status.getId());
			if (status.getType().equals("week")) {
				return getWeekSchedule(model, status.getDay(), status.getMonth(), status.getYear()) + "weekschedule";
			} else {
				return getSchedule(model, status.getMonth(), status.getDay(), status.getYear()) + "schedule";
			}
		} else {

			donationService.updateStatus(status.getId(), status.getStatus());

			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg", "Status updated successfully!");

			if (status.getType().equals("week")) {
				return getWeekSchedule(model, status.getDay(), status.getMonth(), status.getYear()) + "weekschedule";
			} else {
				return getSchedule(model, status.getMonth(), status.getDay(), status.getYear()) + "schedule";
			}

		}

	}

	// display image
	@RequestMapping(value = "/images/{id}", method = RequestMethod.GET)
	private void displayImages(@PathVariable("id") int id, Model model, HttpServletResponse response,
			HttpServletRequest request) {

		logger.debug("displayImages() image id: {}", id);

		try {
			Attachment attach = attachmentService.findById(id);
			byte[] image = attach.getBytes();
			if (image != null) {
				response.reset();
				response.setContentType("image/png");
				response.setContentLength(image.length);
				response.getOutputStream().write(image);
				response.getOutputStream().close();
			}
		} catch (IOException e) {
			logger.debug("displayImages() IO Exception : {}", e.getCause());
		}

	}

	// save attachment
	public void saveAttachment(MultipartFile file, int id) {

		logger.debug("saveAttachment() file : {}", file);

		Attachment attach = new Attachment();
		attach.setFile(file);
		attach.setDonation(id);
		attachmentService.saveOrUpdate(attach);

	}

	// delete attachment
	@RequestMapping(value = "/images/{id}/delete", method = RequestMethod.POST)
	public String deleteAttachment(@PathVariable("id") int id, final RedirectAttributes redirectAttributes) {

		logger.debug("deleteAttachment() : {}", id);

		int donId = attachmentService.findById(id).getDonation();
		attachmentService.delete(id);
		List<Donation> dons = donationService.findById(id);
		int decrease = 1;
		if (dons.size() > 1) {
			for (int ctr = 0; ctr < dons.size(); ctr++) {
				dons.get(ctr - decrease).getScheduledDate().add(dons.get(ctr).getScheduledDate().get(0));
				dons.get(ctr - decrease).getMeridian().add(dons.get(ctr).getMeridian().get(0));
				decrease++;
			}
			for (int ctr = dons.size() - 1; ctr >= 1; ctr--) {
				dons.remove(ctr);
			}
		}
		Donation donation = dons.get(0);
		donation.decreaseNumImages(1);
		donationService.saveOrUpdate(donation);

		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "Image is deleted!");

		return "redirect:/donations/" + donId + "/update";

	}

	private void populateProvinces(Model model) {

		Map<String, String> province = new LinkedHashMap<String, String>();
		province.put("AB", "Alberta");
		province.put("BC", "British Columbia");
		province.put("MB", "Manitoba");
		province.put("NB", "New Brunswick");
		province.put("NL", "Newfoundland & Labrador");
		province.put("NS", "Nova Scotia");
		province.put("ON", "Ontario");
		province.put("PE", "Prince Edward Island");
		province.put("QE", "Quebec");
		province.put("SA", "Saskatchewan");
		province.put("NT", "Northwest Territories");
		province.put("NU", "Nunavut");
		province.put("YU", "Yukon");
		model.addAttribute("provinceList", province);

	}

	private void populateDonationTypes(Model model) {

		Map<String, String> types = new LinkedHashMap<String, String>();
		types.put("DROPOFF", "DROPOFF");
		types.put("PICKUP", "PICKUP");
		model.addAttribute("typeList", types);

	}

	private void populateDonationStatuses(Model model) {

		Map<String, String> statuses = new LinkedHashMap<String, String>();
		statuses.put("AWAITING APPROVAL", "AWAITING APPROVAL");
		statuses.put("AWAITING PICKUP", "AWAITING PICKUP");
		statuses.put("PICKUP COMPLETE", "PICKUP COMPLETE");
		statuses.put("RESCHEDULED", "RESCHEDULED");
		statuses.put("RECEIVED", "RECEIVED");
		model.addAttribute("statusList", statuses);

	}

	private void populateMonths(Model model) {
		Map<String, String> months = new LinkedHashMap<String, String>();
		months.put("1", "January");
		months.put("2", "February");
		months.put("3", "March");
		months.put("4", "April");
		months.put("5", "May");
		months.put("6", "June");
		months.put("7", "July");
		months.put("8", "August");
		months.put("9", "September");
		months.put("10", "October");
		months.put("11", "November");
		months.put("12", "December");
		model.addAttribute("months", months);
	}

	@ExceptionHandler(EmptyResultDataAccessException.class)
	public ModelAndView handleEmptyData(HttpServletRequest req, Exception ex) {

		logger.debug("handleEmptyData()");
		logger.error("Request: {}, error ", req.getRequestURL(), ex);

		ModelAndView model = new ModelAndView();
		model.setViewName("user/show");
		model.addObject("msg", "user not found");

		return model;

	}

}