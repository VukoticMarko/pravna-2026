package ftn.uns.ac.rs.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Entry point for the Pravna Informatika backend Spring Boot application.
 * This class bootstraps the Spring application context and starts the
 * embedded servlet container when run as a standalone Java application.
 */
@SpringBootApplication
public class PravnaApplication {

	/**
	 * Application main method.
	 */
	public static void main(String[] args) {
		SpringApplication.run(PravnaApplication.class, args);
	}
}