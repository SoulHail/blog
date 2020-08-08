package com.example.blog.praext;

import com.example.blog.praext.*;
import lombok.extern.slf4j.Slf4j;

import java.text.SimpleDateFormat;

@Slf4j
public class Test {
    public static void main(String[] args) {

        Doctor doctor = new Doctor();
        doctor.setWahospital(false);
        if (doctor.isWahospital()) {
            System.out.println("在医院呢！！！");
        }
        doctor.checkAtHospital();
        log.info("doctor:{}", doctor);

        FamilyDoctor familyDoctor = new FamilyDoctor();
        familyDoctor.setWahome(false);
        familyDoctor.setWahospital(true);
        if (familyDoctor.isWahome()) {
            System.out.println("家庭医生在家工作");
        }
        if (familyDoctor.isWahospital()) {
            System.out.println("家庭医生在医院工作");
        }
        familyDoctor.checkAtHospital();
        familyDoctor.checkAtHome();
        log.info("familyDoctor:{}", familyDoctor);

        Surgern surgern = new Surgern();
        surgern.setWahospital(true);
        if (surgern.isWahospital()) {
            System.out.println("sugern在医院工作");
        }
        surgern.checkAtHospital();
        surgern.eat();
        surgern.drink();
        log.info("surgern:{}", surgern);

        NewDoctor newDoctor = new NewDoctor();
        newDoctor.setWahospital(true);
        if (newDoctor.isWahospital()) {
            System.out.println("newDoctor在医院工作");
        }
        newDoctor.checkAtHospital();
        log.info("newDoctor:{}", newDoctor);
    }
}
