package com.JavaProje.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
@SpringBootApplication
@EntityScan(basePackages = {"com.JavaProje"})
@ComponentScan(basePackages = {"com.JavaProje"})
@EnableJpaRepositories(basePackages = {"com.JavaProje"})
public class RehberAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(RehberAppApplication.class, args);
	}

}
