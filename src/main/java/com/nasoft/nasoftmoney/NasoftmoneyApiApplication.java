package com.nasoft.nasoftmoney;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.nasoft.nasoftmoney.config.property.NasoftmoneyApiProperty;

@SpringBootApplication
@EnableConfigurationProperties(NasoftmoneyApiProperty.class)//habilita a edicao das propriedades da classe NasoftmoneyApiProperty no arquivo application.properties 
public class NasoftmoneyApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(NasoftmoneyApiApplication.class, args);
	}
}
