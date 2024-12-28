package com.cjc.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EnableTransactionManagement
@SpringBootApplication
public class LMSAPPApplication {

	public static void main(String[] args) {
		System.out.println("This is Spring Boot Crud Application");
		SpringApplication.run(LMSAPPApplication.class, args);
	}

}
