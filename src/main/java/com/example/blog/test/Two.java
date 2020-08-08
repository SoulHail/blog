package com.example.blog.test;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


@Slf4j
@SuppressWarnings("all")
public class Two {
    public static void main(String[] args) {
        //System.out.println(Integer.MAX_VALUE);
        JSONObject object = new JSONObject();
        object.put("01","压缩");
        object.put("02","盲僧");
        object.put("03","阿卡丽");
        object.put("04","小炮");
        object.put("05","VN");
        object.put("06","卡莎");

        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet xs = wb.createSheet();
        XSSFRow row = xs.createRow(0);
        XSSFCell cell = row.createCell(0);
        cell.setCellValue("擅长英雄表");
        xs.addMergedRegion(new CellRangeAddress(0,0,0,2));
        XSSFRow row1 = xs.createRow(1);
        row1.createCell(0).setCellValue((String) object.get("01"));
        row1.createCell(1).setCellValue((String) object.get("02"));
        row1.createCell(2).setCellValue((String) object.get("03"));
        XSSFRow row2 = xs.createRow(2);
        row2.createCell(0).setCellValue((String) object.get("04"));
        row2.createCell(1).setCellValue((String) object.get("05"));
        row2.createCell(2).setCellValue((String) object.get("06"));

        XSSFRow row3 = xs.createRow(3);
        row3.createCell(0).setCellValue((String) object.get("01"));
        row3.createCell(1).setCellValue((String) object.get("01"));
        row3.createCell(2).setCellValue((String) object.get("01"));

        // TODO 创建Excel表格

    }

    private void getExcel(){
        /*JSONObject object = new JSONObject();
        List<Man> list = new ArrayList<>();
        String a = String.valueOf(object);*/
    }
}
