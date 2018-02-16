package com.spring.form.config;

import java.sql.Driver;

//import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

@Configuration
public class SpringDBConfig {

	@Autowired
	DataSource dataSource;
	
	/*
	 * @Bean public JdbcTemplate getJdbcTemplate() { return new
	 * JdbcTemplate(dataSource); }
	 */

	@Bean
	public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
		return new NamedParameterJdbcTemplate(dataSource);
	}

	@Bean
	@SuppressWarnings("unchecked")
	public DataSource getDataSource() throws Exception {
		
		SimpleDriverDataSource ds = new SimpleDriverDataSource();
		ds.setDriverClass((Class<Driver>) Class.forName("org.postgresql.Driver"));
		ds.setUrl("jdbc:postgresql://habitatdonations.cfblqfheuvra.us-east-2.rds.amazonaws.com:5432/habitatDonations");
		ds.setUsername("masterDonation");
		ds.setPassword("masterdonation");
		return ds;
		
	}
	
	// needs import
	/*
	 * @PostConstruct public void startDBManager() {
	 * 
	 * // hsqldb // DatabaseManagerSwing.main(new String[] { "--url", //
	 * "jdbc:hsqldb:mem:testdb", "--user", "sa", "--password", "" });
	 * 
	 * }
	 */

}