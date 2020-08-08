package com.example.blog.praext;

import lombok.Data;

@Data
public class Doctor {

    boolean wahospital;

    public void checkAtHospital() {
        System.out.println("check At Hospital");
    }
}
