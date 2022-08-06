package com.ctf.report;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@RefreshScope
@ComponentScan(basePackages = {"com.ctf.report","org.jeecg.modules.jmreport"})
public class CtfReportApplication {

	public static void main(String[] args) {
		SpringApplication.run(CtfReportApplication.class, args);
	}

}
