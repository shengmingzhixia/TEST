package cgy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("cgy.dao")
public class EefinalApplication {
    public static void main(String[] args) {
        SpringApplication.run(EefinalApplication.class, args);
    }
}
