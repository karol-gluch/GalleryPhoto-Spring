package pl.stackfans.doshopping;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("pl.stackfans.doshopping.repository")
@EntityScan("pl.stackfans.doshopping.model")
public class DoshoppingApplication {

    public static void main(String[] args) {
        SpringApplication.run(DoshoppingApplication.class, args);
    }

}
