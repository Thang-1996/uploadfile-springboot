package com.example.demouploadfile;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

@SpringBootApplication
public class DemouploadfileApplication {

    public static void main(String[] args) {
        new File(UploadingController.uploadingDir).mkdir();
        SpringApplication.run(DemouploadfileApplication.class, args);
    }

}
