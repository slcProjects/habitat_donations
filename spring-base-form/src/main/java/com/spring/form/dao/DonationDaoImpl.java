package com.spring.form.dao;

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

import com.spring.form.model.Donation;
import com.spring.form.web.UserController;

@Repository
public class DonationDaoImpl implements DonationDao {
	
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) throws DataAccessException {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public Donation findById(Integer id) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT * FROM Donation WHERE DonationID=:id";

		Donation result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new DonationMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		/*
		 * Donation result = namedParameterJdbcTemplate.queryForObject( sql, params,
		 * new BeanPropertyRowMapper<Donation>());
		 */

		return result;
		
	}

	@Override
	public List<Donation> findAll() {
		
		String sql = "SELECT * FROM Donation";
		List<Donation> result = namedParameterJdbcTemplate.query(sql, new DonationMapper());

		return result;
		
	}

	@Override
	public void save(Donation donation) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		String sql = "INSERT INTO User(DonorID, Description, Value, ScheduledDate, CompletedDate, DropFee, ReceiverID, Tacking) "
				+ "VALUES (:donor, :description, :value, :scheduledDate, :completedDate, :dropFee, :receiver, :tacking)";
		
		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(donation), keyHolder);
		donation.setId(keyHolder.getKey().intValue());
		
	}

	@Override
	public void update(Donation donation) {
		
		String sql = "UPDATE Donation SET DonorID=:donor, Description=:description, Value=:value, "
				+ "ScheduledDate=:scheduledDate, CompletedDate=:completedDate, DropFee=:dropFee, "
				+ "Receiver=:receiver, Tacking=:tacking WHERE DonationID=:id";
		
		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(donation));
		
	}

	@Override
	public void delete(Integer id) {
		
		String sql = "DELETE FROM Donation WHERE DonationID= :id";
		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource("id", id));
		
	}
	
	private SqlParameterSource getSqlParameterByModel(Donation donation) {

		// Unable to handle List<String> or Array
		// BeanPropertySqlParameterSource

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("id", donation.getId());
		paramSource.addValue("donor", donation.getDonor());
		paramSource.addValue("description", donation.getDescription());
		paramSource.addValue("value", donation.getValue());
		paramSource.addValue("scheduledDate", donation.getScheduledDate());
		paramSource.addValue("completedDate", donation.getCompletedDate());
		paramSource.addValue("dropFee", donation.getDropFee());
		paramSource.addValue("receiver", donation.getReceiver());
		paramSource.addValue("tacking", donation.getTacking());
		
		return paramSource;
	}

	private static final class DonationMapper implements RowMapper<Donation> {

		public Donation mapRow(ResultSet rs, int rowNum) throws SQLException {
			Donation donation = new Donation();
			donation.setId(rs.getInt("DonationID"));
			donation.setDonor(rs.getInt("DonorID"));
			donation.setDescription(rs.getString("Description"));
			donation.setValue(rs.getDouble("Value"));
			donation.setScheduledDate(rs.getDate("ScheduledDate"));
			donation.setCompletedDate(rs.getDate("CompletedDate"));
			donation.setDropFee(rs.getDouble("DropFee"));
			donation.setReceiver(rs.getInt("ReceiverID"));
			donation.setTacking(rs.getDate("Tacking"));
			
			return donation;
		}
	}

}
