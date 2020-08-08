package com.example.blog.praext;

import lombok.Data;

@Data
public class FamilyDoctor extends Doctor {

    boolean wahome;

    public void checkAtHome() {
        System.out.println("check At Home");
    }
}
