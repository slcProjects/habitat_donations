package com.spring.form.dao;

import static java.lang.Math.toIntExact;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialException;

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

import com.spring.form.model.Analytic;
import com.spring.form.model.Donation;
import com.spring.form.model.ScheduledDate;
import com.spring.form.service.ScheduledDateService;

@Repository
public class DonationDaoImpl implements DonationDao {
	
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	ScheduledDateService scheduledDateService;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate)
			throws DataAccessException {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<Donation> findById(Integer id) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT \"Donation\".*, \"ScheduledDate\".\"Date\", \"ScheduledDate\".\"Meridian\" FROM \"Donation\" "
				+ "INNER JOIN \"ScheduledDate\" ON \"Donation\".\"DonationID\"=\"ScheduledDate\".\"DonationID\" "
				+ "WHERE \"Donation\".\"DonationID\"=:id ORDER BY \"Donation\".\"DonationID\" ASC";

		List<Donation> result = null;
		try {
			result = namedParameterJdbcTemplate.query(sql, params, new DonationMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		/*
		 * Donation result = namedParameterJdbcTemplate.queryForObject( sql, params, new
		 * BeanPropertyRowMapper<Donation>());
		 */

		return result;

	}

	@Override
	public List<Donation> findAll() {

		String sql = "SELECT \"Donation\".*, \"ScheduledDate\".\"Date\", \"ScheduledDate\".\"Meridian\" FROM \"Donation\" "
				+ "INNER JOIN \"ScheduledDate\" ON \"Donation\".\"DonationID\"=\"ScheduledDate\".\"DonationID\" "
				+ "ORDER BY \"Donation\".\"DonationID\" ASC";
		List<Donation> result = namedParameterJdbcTemplate.query(sql, new DonationMapper());

		return result;

	}
	
	@Override
	public List<Donation> findByUserId(Integer id) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT \"Donation\".*, \"ScheduledDate\".\"Date\", \"ScheduledDate\".\"Meridian\" FROM \"Donation\" "
				+ "INNER JOIN \"ScheduledDate\" ON \"Donation\".\"DonationID\"=\"ScheduledDate\".\"DonationID\" "
				+ "WHERE \"DonorID\"=:id ORDER BY \"Donation\".\"DonationID\" ASC";
		List<Donation> result = namedParameterJdbcTemplate.query(sql, params, new DonationMapper());

		return result;

	}
	
	@Override
	public List<Donation> findByScheduledDate(java.util.Date date) {
		
		List<Donation> result = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("date", date);
		String sql = "SELECT \"Donation\".*, \"ScheduledDate\".\"Date\", \"ScheduledDate\".\"Meridian\" FROM \"Donation\" "
				+ "INNER JOIN \"ScheduledDate\" ON \"Donation\".\"DonationID\"=\"ScheduledDate\".\"DonationID\" "
				+ "WHERE \"ScheduledDate\".\"Date\"=:date "
				+ "ORDER BY \"ScheduledDate\".\"Date\" ASC, \"ScheduledDate\".\"Meridian\" ASC, \"Donation\".\"DonationID\" ASC";
		result = namedParameterJdbcTemplate.query(sql, params, new DonationMapper());
		
		return result;

	}
	
	@Override
	public List<Donation> findByScheduledMonth(Integer month, Integer year) {
		
		List<Donation> result = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("month", month);
		params.put("year", year);
		
		String sql = "SELECT \"Donation\".*, \"ScheduledDate\".\"Date\", \"ScheduledDate\".\"Meridian\" FROM \"Donation\" "  
				+ "INNER JOIN \"ScheduledDate\" ON \"Donation\".\"DonationID\"=\"ScheduledDate\".\"DonationID\" "
				+ "WHERE Extract(month from \"ScheduledDate\".\"Date\")=:month "
				+ "AND Extract(year from \"ScheduledDate\".\"Date\")=:year "
				+ "ORDER BY \"ScheduledDate\".\"Date\" ASC, \"ScheduledDate\".\"Meridian\" ASC, \"Donation\".\"DonationID\" ASC";
		
		try {
			result = namedParameterJdbcTemplate.query(sql, params, new DonationMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}
		
		return result;

	}
	
	@Override
	public List<Donation> findByScheduledWeekOfMonth(Integer firstDay, Integer lastDay, Integer month, Integer year) {
		
		List<Donation> result = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("firstDay", firstDay);
		params.put("lastDay", lastDay);
		params.put("month", month);
		params.put("year", year);
		
		String sql = "SELECT \"Donation\".*, \"ScheduledDate\".\"Date\", \"ScheduledDate\".\"Meridian\" FROM \"Donation\" "  
				+ "INNER JOIN \"ScheduledDate\" ON \"Donation\".\"DonationID\"=\"ScheduledDate\".\"DonationID\" "
				+ "WHERE Extract(month from \"ScheduledDate\".\"Date\")=:month AND Extract(year from \"ScheduledDate\".\"Date\")=:year "
				+ "AND Extract(day from \"ScheduledDate\".\"Date\")>=:firstDay AND Extract(day from \"ScheduledDate\".\"Date\")<=:lastDay "
				+ "ORDER BY \"ScheduledDate\".\"Date\" ASC, \"ScheduledDate\".\"Meridian\" ASC, \"Donation\".\"DonationID\" ASC";
		
		try {
			result = namedParameterJdbcTemplate.query(sql, params, new DonationMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}
		
		return result;

	}
	
	@Override
	public List<Analytic> findMeridianCount() {
		
		List<Analytic> result = null;
		
		String sql = "SELECT \"Meridian\", COUNT(*) AS \"Count\" FROM \"ScheduledDate\" GROUP BY \"Meridian\"";
		
		try {
			result = namedParameterJdbcTemplate.query(sql, new AnalyticMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}
		
		return result;

	}
	
	@Override
	public List<Analytic> findPostalCodeCount() {
		
		List<Analytic> result = null;
		
		String sql = "SELECT \"PostalCode\", COUNT(*) AS \"Count\" FROM \"Donation\" GROUP BY \"PostalCode\"";
		
		try {
			result = namedParameterJdbcTemplate.query(sql, new AnalyticMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}
		
		return result;

	}
	
	@Override
	public List<Analytic> findTypeCount() {
		
		List<Analytic> result = null;
		
		String sql = "SELECT \"Type\", COUNT(*) AS \"Count\" FROM \"Donation\" GROUP BY \"Type\"";
		
		try {
			result = namedParameterJdbcTemplate.query(sql, new AnalyticMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}
		
		return result;

	}

	@Override
	public void save(Donation donation) {
		/*
		 * byte[] picBytes; SerialBlob sBlob; try { picBytes =
		 * donation.getFile().getBytes(); sBlob = new SerialBlob(picBytes);
		 * 
		 * } catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (SerialException e) { // TODO Auto-generated
		 * catch block e.printStackTrace(); } catch (SQLException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */

		KeyHolder keyHolder = new GeneratedKeyHolder();

		String sql = "INSERT INTO \"Donation\"(\"DonorID\", \"Description\", \"Value\", \"CompletedDate\", \"Address\", "
				+ "\"City\", \"Province\", \"PostalCode\", \"DropFee\", \"ReceiverID\", \"Tacking\", \"Receipts\", \"Reserved\", \"NumImages\", \"Type\", \"Status\") "
				+ "VALUES (:donor, :description, :value, :completedDate, :address, :city, :province, :postalCode, :dropFee, "
				+ ":receiver, :tacking, :receipts, :reserved, :numImages, CAST(:type AS \"DonationType\"), CAST(:status AS \"DonationStatus\"))";
				
		try {
			namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(donation), keyHolder);
		} catch (DataAccessException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		donation.setId((toIntExact((long) keyHolder.getKeys().get("DonationID"))));
		
		for (int ctr = 0; ctr < donation.getScheduledDate().size(); ctr++) {
			ScheduledDate date = new ScheduledDate();
			date.setDonation(donation.getId());
			date.setDate(donation.getScheduledDate().get(ctr));
			date.setMeridian(donation.getMeridian().get(ctr));
			scheduledDateService.saveOrUpdate(date);
		}

	}

	@Override
	public void update(Donation donation) {
		/*
		 * try { File uploadFile = donation.getFile().getBytes(); } catch (IOException
		 * e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 */

		String sql = "UPDATE \"Donation\" SET \"DonorID\"=:donor, \"Description\"=:description, \"Value\"=:value, "
				+ "\"CompletedDate\"=:completedDate, \"Address\"=:address, \"City\"=:city, "
				+ "\"Province\"=:province, \"PostalCode\"=:postalCode, \"DropFee\"=:dropFee, "
				+ "\"ReceiverID\"=:receiver, \"Tacking\"=:tacking, \"Receipts\"=:receipts, \"Reserved\"=:reserved \"NumImages\"=:numImages, "
				+ "\"Type\"=CAST(:type AS \"DonationType\"), \"Status\"=CAST(:status AS \"DonationStatus\") WHERE \"DonationID\"=:id";

		try {
			namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(donation));
		} catch (DataAccessException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@Override
	public void reserve(Integer id) {
		
		String sql = "UPDATE \"Donation\" SET \"Reserved\"=true WHERE \"DonationID\"=:id";
		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource("id", id));

	}

	@Override
	public void delete(Integer id) {
		
		scheduledDateService.delete(id);

		String sql = "DELETE FROM \"Donation\" WHERE \"DonationID\"= :id";
		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource("id", id));

	}
	
	@Override
	public void updateStatus(Integer id, String status) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("id", id);
		params.put("status", status);
		
		if (status.equals("RECEIVED") || status.equals("PICKUP COMPLETE")) {
			params.put("completed", new Timestamp(new java.util.Date().getTime()));
		} else {
			params.put("completed", null);
		}
		
		String sql = "UPDATE \"Donation\" SET \"CompletedDate\"=CAST(:completed AS \"timestamp\"), \"Status\"=CAST(:status AS \"DonationStatus\") WHERE \"DonationID\"=:id";
		
		namedParameterJdbcTemplate.update(sql, params);
		
	}

	private SqlParameterSource getSqlParameterByModel(Donation donation)
			throws IOException, SerialException, SQLException {

		// Unable to handle List<String> or Array
		// BeanPropertySqlParameterSource

		/*
		 * byte[] bytes; Blob blob; bytes = donation.getFile().getBytes(); blob = new
		 * SerialBlob(bytes);
		 */

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("id", donation.getId());
		paramSource.addValue("donor", donation.getDonor());
		paramSource.addValue("description", donation.getDescription());
		paramSource.addValue("value", donation.getValue());
		paramSource.addValue("completedDate", donation.getCompletedDate());
		paramSource.addValue("address", donation.getAddress());
		paramSource.addValue("city", donation.getCity());
		paramSource.addValue("province", donation.getProvince());
		paramSource.addValue("postalCode", donation.getPostalCode());
		paramSource.addValue("dropFee", donation.getDropFee());
		paramSource.addValue("receiver", donation.getReceiver());
		paramSource.addValue("tacking", donation.getTacking());
		paramSource.addValue("receipts", donation.isReceipts());
		paramSource.addValue("numImages", donation.getNumImages());
		paramSource.addValue("type", donation.getType());
		paramSource.addValue("status", donation.getStatus());
		paramSource.addValue("reserved", donation.isReserved());
		
		return paramSource;
	}

	private static final class DonationMapper implements RowMapper<Donation> {

		public Donation mapRow(ResultSet rs, int rowNum) throws SQLException {
			Donation donation = new Donation();
			donation.setId(rs.getInt("DonationID"));
			donation.setDonor(rs.getInt("DonorID"));
			donation.setDescription(rs.getString("Description"));
			donation.setValue(rs.getDouble("Value"));
			donation.getScheduledDate().add(rs.getDate("Date"));
			donation.getMeridian().add(rs.getString("Meridian"));
			donation.setCompletedDate(rs.getTimestamp("CompletedDate"));
			donation.setAddress(rs.getString("Address"));
			donation.setCity(rs.getString("City"));
			donation.setProvince(rs.getString("Province"));
			donation.setPostalCode(rs.getString("PostalCode"));
			donation.setDropFee(rs.getDouble("DropFee"));
			donation.setReceiver(rs.getInt("ReceiverID"));
			donation.setTacking(rs.getTimestamp("Tacking"));
			donation.setReceipts(rs.getBoolean("Receipts"));
			donation.setNumImages(rs.getInt("NumImages"));
			donation.setType(rs.getString("Type"));
			donation.setStatus(rs.getString("Status"));
			donation.setReserved(rs.getBoolean("Reserved"));

			return donation;
		}
	}
	
	private static final class AnalyticMapper implements RowMapper<Analytic> {

		public Analytic mapRow(ResultSet rs, int rowNum) throws SQLException {
			Analytic analytic = new Analytic();
			ResultSetMetaData rsmd = rs.getMetaData();
			if (rsmd.getColumnName(1).equals("Type")) {
				analytic.setValue(rs.getString("Type"));
			} else if (rsmd.getColumnName(1).equals("PostalCode")) {
				analytic.setValue(rs.getString("PostalCode"));
			} else {
				analytic.setValue(rs.getString("Meridian"));
			}
			analytic.setCount(rs.getInt("Count"));

			return analytic;
		}
	}

}
