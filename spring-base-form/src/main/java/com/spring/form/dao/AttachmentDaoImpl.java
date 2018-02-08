package com.spring.form.dao;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

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

import com.spring.form.model.Attachment;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate)
			throws DataAccessException {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public Attachment findById(Integer id) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT * FROM Attachment WHERE AttachmentID=:id";

		Attachment result = null;
		try {
			result = namedParameterJdbcTemplate.queryForObject(sql, params, new AttachmentMapper());
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
	public List<Attachment> findAll() {

		String sql = "SELECT * FROM Attachment";
		List<Attachment> result = namedParameterJdbcTemplate.query(sql, new AttachmentMapper());

		return result;

	}

	@Override
	public List<Attachment> findByDonation(Integer id) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);

		String sql = "SELECT * FROM Attachment WHERE DonationID=:id";

		List<Attachment> resultList = new ArrayList<Attachment>();
		try {
			resultList = namedParameterJdbcTemplate.query(sql, params, new AttachmentMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		/*
		 * Donation result = namedParameterJdbcTemplate.queryForObject( sql, params, new
		 * BeanPropertyRowMapper<Attachment>());
		 */

		return resultList;

	}

	@Override
	public void save(Attachment attachment) {

		KeyHolder keyHolder = new GeneratedKeyHolder();

		String sql = "INSERT INTO Attachment(DonationID, Image) VALUES (:donation, :image)";

		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(attachment), keyHolder);

		attachment.setId(keyHolder.getKey().intValue());

	}

	@Override
	public void update(Attachment attachment) {

		String sql = "UPDATE Attachment SET DonationID=:donation, Image=:image WHERE AttachmentID=:id";

		namedParameterJdbcTemplate.update(sql, getSqlParameterByModel(attachment));

	}

	@Override
	public void delete(Integer id) {

		String sql = "DELETE FROM Attachment WHERE AttachmentID= :id";
		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource("id", id));

	}

	private SqlParameterSource getSqlParameterByModel(Attachment attachment) {

		// Unable to handle List<String> or Array
		// BeanPropertySqlParameterSource

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("id", attachment.getId());
		paramSource.addValue("donation", attachment.getDonation());
		paramSource.addValue("image", attachment.getImage());

		return paramSource;

	}

	private static final class AttachmentMapper implements RowMapper<Attachment> {

		@Override
		public Attachment mapRow(ResultSet rs, int rowNum) throws SQLException {
			Attachment attachment = new Attachment();
			attachment.setId(rs.getInt("AttachmentID"));
			attachment.setDonation(rs.getInt("DonationID"));
			attachment.setImage(rs.getBlob("Image"));

			try {
				InputStream is = attachment.getImage().getBinaryStream();
				BufferedImage myImage;
				myImage = ImageIO.read(is);
				if (myImage == null) {
					attachment.setBytes(null);
				} else {
					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					ImageIO.write(myImage, "png", baos);
					baos.flush();
					byte[] bytes = baos.toByteArray();
					attachment.setBytes(bytes);
					baos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

			return attachment;
		}

	}

}
