package com.spring.form.config;

import java.sql.Driver;
import java.sql.SQLException;

//import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.jdbc.datasource.init.DataSourceInitializer;
//import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
//import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
//import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

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
	public DataSource getDataSource() {
		SimpleDriverDataSource ds = new SimpleDriverDataSource();
		try {
			ds.setDriverClass((Class<Driver>) Class.forName("org.postgresql.Driver"));
			ds.setUrl("jdbc:postgresql://habitatdonations.cfblqfheuvra.us-east-2.rds.amazonaws.com:5432/habitatDonations");
			ds.setUsername("masterDonation");
			ds.setPassword("masterDonation");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
		return ds;
		/*
		 * EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
		 * EmbeddedDatabase db =
		 * builder.setName("testdb").setType(EmbeddedDatabaseType.HSQL).addScript("db/sql/create-db.sql").addScript("db/sql/insert-data.sql").build();
		 * return db;
		 */
	}
	
	@Value("db/sql/create-db.sql")
	private Resource schemaScript;

	@Value("db/sql/insert-data.sql")
	private Resource dataScript;
	
	@Bean
	public DataSourceInitializer dataSourceInitializer() {
	    DataSourceInitializer initializer = new DataSourceInitializer();
	    initializer.setDataSource(dataSource);
	    initializer.setDatabasePopulator(databasePopulator());
	    return initializer;
	}

	private DatabasePopulator databasePopulator() {
	    ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
	    populator.addScript(schemaScript);
	    populator.addScript(dataScript);
	    return populator;
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