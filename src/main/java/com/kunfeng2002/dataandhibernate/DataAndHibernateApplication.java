package com.kunfeng2002.dataandhibernate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class DataAndHibernateApplication {

    public static void main(String[] args) {
        SpringApplication.run(DataAndHibernateApplication.class, args);
    }
}
