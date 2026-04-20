package app;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * Servlet initializer for deploying the Pravna Informatika backend
 * as a traditional WAR file to an external servlet container.
 * 
 * This class customizes the {@link SpringApplicationBuilder} used when the
 * application is started by the servlet container (e.g. Tomcat) instead of
 * being run as a standalone JAR.
 */
public class ServletInitializer extends SpringBootServletInitializer {

	/**
	 * Configures the {@link SpringApplicationBuilder} with the primary
	 * Spring Boot application source.
	 */
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(PravnaApplication.class);
	}
}