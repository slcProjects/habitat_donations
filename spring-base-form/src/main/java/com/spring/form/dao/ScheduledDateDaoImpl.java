package com.spring.form.dao;

import static java.lang.Math.toIntExact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
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

import com.spring.form.model.ScheduledDate;

@Repository
public class ScheduledDateDaoImpl implements ScheduledDateDao {
	
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate)
			throws DataAccessException {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public ScheduledDate findById(Integer id) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT * FROM \"ScheduledDate\" WHERE \"DateID\"=:id ORDER BY \"DateID\" ASC";

		ScheduledDate result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new ScheduledDateMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		/*
		 * User result = namedParameterJdbcTemplate.queryForObject( sql, params, new
		 * BeanPropertyRowMapper<User>());
		 */

		return result;
		
	}

	@Override
	public void save(ScheduledDate date) {
		
		KeyHolder keyHolder = new GeneratedKeyHolder();

		String sql = "INSERT INTO \"ScheduledDate\"(\"DonationID\", \"Date\", \"Meridian\") "
				+ "VALUES (:donationID, :date, CAST(:meridian AS \"DonationMeridian\"))";
				
		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(date), keyHolder);
		date.setId((toIntExact((long) keyHolder.getKeys().get("DateID"))));

	}

	@Override
	public void update(ScheduledDate date) {
		
		String sql = "UPDATE \"ScheduledDate\" SET \"DonationID\"=:donationID, \"Date\"=:date, "
				+ "\"Meridian\"=CAST(:meridian AS \"DonationMeridian\", WHERE \"DateID\"= :dateID";

		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(date));

	}

	@Override
	public void delete(int id) {
		
		String sql = "DELETE FROM \"ScheduledDate\" WHERE \"DonationID\"= :id";
		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource("id", id));

	}
	
	private SqlParameterSource getSqlParameterByModel(ScheduledDate scheduledDate) {

		// Unable to handle List<String> or Array
		// BeanPropertySqlParameterSource

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("dateID", scheduledDate.getId());
		paramSource.addValue("donationID", scheduledDate.getDonation());
		paramSource.addValue("date", scheduledDate.getDate());
		paramSource.addValue("meridian", scheduledDate.getMeridian());

		return paramSource;
		
	}
	
	private static final class ScheduledDateMapper implements RowMapper<ScheduledDate> {

		public ScheduledDate mapRow(ResultSet rs, int rowNum) throws SQLException {
			ScheduledDate date = new ScheduledDate();
			date.setId(rs.getInt("DateID"));
			date.setDonation(rs.getInt("DonationID"));
			date.setDate(rs.getDate("Date"));
			date.setMeridian(rs.getString("Meridian"));

			return date;
			
		}
		
	}

}
