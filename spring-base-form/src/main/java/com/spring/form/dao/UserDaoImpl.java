package com.spring.form.dao;

import static java.lang.Math.toIntExact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.spring.form.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) throws DataAccessException {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public User findById(Integer id) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT * FROM \"User\" WHERE \"UserID\"=:id ORDER BY \"UserID\" ASC";

		User result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new UserMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		/*
		 * User result = namedParameterJdbcTemplate.queryForObject( sql, params,
		 * new BeanPropertyRowMapper<User>());
		 */

		return result;

	}

	@Override
	public List<User> findAll() {

		String sql = "SELECT * FROM \"User\" ORDER BY \"UserID\" ASC";
		List<User> result = namedParameterJdbcTemplate.query(sql, new UserMapper());

		return result;

	}
	
	@Override
	public User findByLoginName(String username) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("username", username);

		String sql = "SELECT * FROM \"User\" WHERE \"LoginName\"=:username";

		User result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new UserMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		/*
		 * User result = namedParameterJdbcTemplate.queryForObject( sql, params,
		 * new BeanPropertyRowMapper<User>());
		 */

		return result;

	}
	
	@Override
	public List<User> search(String first, String last, String city, String code, String role) {
		Map<String, Object> params = new HashMap<String, Object>();
		Boolean trim = true;
		
		String sql = "SELECT * FROM \"User\" WHERE ";
		if (!first.equals("")) {
			params.put("first", first);
			sql += "\"FirstName\"=:first AND ";
		}
		if (!last.equals("")) {
			params.put("last", last);
			sql += "\"LastName\"=:last AND ";
		}
		if (!city.equals("")) {
			params.put("city", city);
			sql += "\"City\"=:city AND ";
		}
		if (!code.equals("")) {
			params.put("code", code);
			sql += "\"PostalCode\"=:code AND ";
		}
		if (!role.equals("")) {
			params.put("role", role);
			sql += "\"Role\"=CAST(:role AS \"UserRole\") ";
			trim = false;
		}
		if (trim) {
			sql = sql.substring(0, sql.length() - 4);
		}
		sql += "ORDER BY \"UserID\" ASC";
		List<User> result = namedParameterJdbcTemplate.query(sql, params, new UserMapper());

		return result;
	}

	@Override
	public void save(User user) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		String sql = "INSERT INTO \"User\"(\"LoginName\", \"Password\", \"FirstName\", \"LastName\", \"Email\", \"Phone\", "
				+ "\"Address\", \"City\", \"Province\", \"PostalCode\", \"Role\", \"Notify\") "
				+ "VALUES (:loginName, :password, :firstName, :lastName, :email, :phone, :address, :city, :province, :postalCode, CAST (:role AS \"UserRole\"), :notify)";
		
		namedParameterJdbcTemplate.update(sql, getUserSqlParameterByModel(user), keyHolder);
		user.setId((toIntExact((long) keyHolder.getKeys().get("UserID"))));
		
	}

	@Override
	public void update(User user) {

		String sql = "UPDATE \"User\" SET \"LoginName\"=:loginName, \"Password\"=:password, \"FirstName\"=:firstName, "
				+ "\"LastName\"=:lastName, \"Email\"=:email, \"Phone\"=:phone, \"Address\"=:address, \"City\"=:city, "
				+ "\"Province\"=:province, \"PostalCode\"=:postalCode, \"Role\"=CAST (:role AS \"UserRole\"), \"Notify\"=:notify WHERE \"UserID\"= :userID";
		
		namedParameterJdbcTemplate.update(sql, getUserSqlParameterByModel(user));

	}

	@Override
	public void delete(Integer id) {

		String sql = "DELETE FROM \"User\" WHERE \"UserID\"= :id";
		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource("id", id));

	}

	private SqlParameterSource getUserSqlParameterByModel(User user) {

		// Unable to handle List<String> or Array
		// BeanPropertySqlParameterSource

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("userID", user.getId());
		paramSource.addValue("loginName", user.getLoginName());
		paramSource.addValue("password", user.getPassword());
		paramSource.addValue("firstName", user.getFirstName());
		paramSource.addValue("lastName", user.getLastName());
		paramSource.addValue("email", user.getEmail());
		paramSource.addValue("phone", user.getPhone());
		paramSource.addValue("address", user.getAddress());
		paramSource.addValue("city", user.getCity());
		paramSource.addValue("province", user.getProvince());
		paramSource.addValue("postalCode", user.getPostalCode());
		paramSource.addValue("role", user.getRole());
		paramSource.addValue("notify", user.isNotify());
		
		return paramSource;
	}

	private static final class UserMapper implements RowMapper<User> {

		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setId(rs.getInt("UserID"));
			user.setLoginName(rs.getString("LoginName"));
			user.setPassword(rs.getString("Password"));
			user.setFirstName(rs.getString("FirstName"));
			user.setLastName(rs.getString("LastName"));
			user.setEmail(rs.getString("Email"));
			user.setPhone(rs.getString("Phone"));
			user.setAddress(rs.getString("Address"));
			user.setCity(rs.getString("City"));
			user.setProvince(rs.getString("Province"));
			user.setPostalCode(rs.getString("PostalCode"));
			user.setRole(rs.getString("Role"));
			user.setNotify(rs.getBoolean("Notify"));
			
			return user;
		}
	}

	/*private static List<String> convertDelimitedStringToList(String delimitedString) {

		List<String> result = new ArrayList<String>();

		if (!StringUtils.isEmpty(delimitedString)) {
			result = Arrays.asList(StringUtils.delimitedListToStringArray(delimitedString, ","));
		}
		return result;

	}

	private String convertListToDelimitedString(List<String> list) {

		String result = "";
		if (list != null) {
			result = StringUtils.arrayToCommaDelimitedString(list.toArray());
		}
		return result;

	}*/

}