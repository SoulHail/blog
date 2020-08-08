package com.example.blog.test.excel;


import com.example.blog.entity.MposMemberMccType;
import com.example.blog.service.UserService;
import com.example.blog.vo.LeaveApplyVo;
import com.example.blog.vo.RecordVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@org.springframework.stereotype.Controller
public class Controller {

    @Autowired
    private UserService userService;

    // 上传Excel，保存到本地
    @RequestMapping("/uploadExcel")
    public boolean uploadExcel(@RequestParam MultipartFile file, HttpServletRequest request) throws IOException {

        if (!file.isEmpty()) {
            String filePath = file.getOriginalFilename();
            //windows
            String savePath = request.getSession().getServletContext().getRealPath(filePath);
            log.info("====================savePath:{}", savePath);
            File targetFile = new File(savePath);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            file.transferTo(targetFile);
            return true;
        }
        return false;
    }

    //创建Excel（数据库数据导出Excel）
    @RequestMapping("/createExcel")
    public String createExcel(String userId, HttpServletResponse response) throws IOException {

        List<RecordVo> li = userService.getRecord(userId);
        log.info("===============li:{}", li);
        //创建HSSFWorkbook对象(excel的文档对象)
        XSSFWorkbook wb = new XSSFWorkbook();
        //建立新的sheet对象（excel的表单）
        XSSFSheet sheet = wb.createSheet("用户表");
        //在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
        XSSFRow row1 = sheet.createRow(0);
        //创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
        XSSFCell cell = row1.createCell(0);
        //设置单元格内容
        cell.setCellValue("用户信息一览表");
        //合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));
        //在sheet里创建第二行
        XSSFRow row2 = sheet.createRow(1);
        //创建单元格并设置单元格内容
        row2.createCell(0).setCellValue("时间");
        row2.createCell(1).setCellValue("课数");
        row2.createCell(2).setCellValue("状态");
        for (int i = 1; i <= li.size(); i++) {
            XSSFRow hssfRow = sheet.createRow(i + 1);
            if ("12".equals(li.get(i - 1).getCount())) {
                li.get(i - 1).setCount("上午12节课");
            }
            if ("34".equals(li.get(i - 1).getCount())) {
                li.get(i - 1).setCount("上午34节课");
            }
            if ("56".equals(li.get(i - 1).getCount())) {
                li.get(i - 1).setCount("下午12节课");
            }
            if ("78".equals(li.get(i - 1).getCount())) {
                li.get(i - 1).setCount("下午34节课");
            }
            if ("1".equals(li.get(i - 1).getStatus())) {
                li.get(i - 1).setStatus("事假");
            }
            if ("2".equals(li.get(i - 1).getStatus())) {
                li.get(i - 1).setStatus("旷到");
            }
            hssfRow.createCell(0).setCellValue(li.get(i - 1).getDate());
            hssfRow.createCell(1).setCellValue(li.get(i - 1).getCount());
            hssfRow.createCell(2).setCellValue(li.get(i - 1).getStatus());
        }

        //输出Excel文件
        OutputStream output = response.getOutputStream();
        response.reset();
        // 默认名称
        response.setHeader("Content-disposition", "attachment; filename=details.xlsx");
        response.setContentType("application/msexcel");
        wb.write(output);
        output.close();
        return null;
    }

    public static void main(String[] args) {
        try {
            readExcel();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/xxx")
    public String createExcel(HttpServletResponse response) throws IOException {
        Map<String, String> errorRecord = new HashMap<>();
        errorRecord.put("6行", "商编格式不正确");
        errorRecord.put("7行", "商编格式不正确");
        errorRecord.put("8行", "商编格式不正确");
        errorRecord.put("9行", "商编格式不正确");
        log.info("==========================SIZE:{}", errorRecord.size());
        HSSFWorkbook wb = null;
        try {
            // 第一步，创建一个webbook，对应一个Excel文件
            wb = new HSSFWorkbook();
            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
            HSSFSheet sheet = wb.createSheet("黑白名单信息导入结果");
            // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
            HSSFRow row = sheet.createRow(0);
            // 第四步，创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

            HSSFFont f = wb.createFont();
            f.setFontHeightInPoints((short) 13);// 字号
            f.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);// 加粗
            style.setFont(f);

            // 设置这些样式
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中

            // 背景色
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            style.setFillBackgroundColor(HSSFColor.YELLOW.index);

            // 设置边框
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);

            HSSFCell cell = null;

            // 创建表头
            row.setHeight((short) 400);

            cell = row.createCell(0);
            sheet.setColumnWidth(0, 20 * 256);
            cell.setCellStyle(style);
            cell.setCellValue("行号");

            cell = row.createCell(1);
            sheet.setColumnWidth(1, 20 * 256);
            cell.setCellStyle(style);
            cell.setCellValue("失败原因");

            int rowNo = 1;
            // 第五步，写入实体数据
            for (int i = 0; i < 10; i++) {
                log.info("=============error.size:{}============", errorRecord.size());
                if (errorRecord.get(i + 1 + "行") == null) {
                    log.info("============dsds=============");
                    continue;
                }
                int tempNum = 0;
                row = sheet.createRow(rowNo);
                //行号
                row.createCell(tempNum).setCellValue(i + 1 + "");
                //失败原因
                row.createCell(tempNum + 1).setCellValue(errorRecord.get(i + 1 + "行"));
                rowNo++;
                System.out.println(rowNo);
            }
            //输出Excel文件
            OutputStream output = response.getOutputStream();
            response.reset();
            // 默认名称
            response.setHeader("Content-disposition", "attachment; filename=xxx.xls");
            response.setContentType("application/msexcel");
            wb.write(output);
            output.close();
        } catch (Exception e) {
            log.error("写入Excel文件异常", e);
        } finally {
            log.info("结束写入.");
        }
        return null;
    }

    private static Map<String, String> errorRecord = new HashMap<>();

    // 读取Excel里面的内容,以集合的方式返回
    public static void readExcel() throws Exception {
        String fileName = "C:\\Users\\code_bear\\Desktop\\optional.xlsx";
        InputStream is = new FileInputStream(new File(fileName));
        Workbook hssfWorkbook = null;
        if (fileName.endsWith("xlsx")) {
            hssfWorkbook = new XSSFWorkbook(is);//Excel 2007
        } else if (fileName.endsWith("xls")) {
            hssfWorkbook = new HSSFWorkbook(is);//Excel 2003

        }
        //RecordVo recordVo = null;
        //List<RecordVo> list = new ArrayList<RecordVo>();
        List<String> in = new ArrayList<>();
        // 循环工作表Sheet
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            Sheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行Row
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                Row hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow == null) {
                    errorRecord.put(rowNum + "", "行为空");
                    log.info("==========第：{}行为空==========", rowNum);
                }
                /*if (hssfRow != null) {
                    recordVo = new RecordVo();
                    Cell date = hssfRow.getCell(0);
                    Cell count = hssfRow.getCell(1);
                    Cell status = hssfRow.getCell(2);
                    //这里是自己的逻辑
                    recordVo.setDate(date.toString());
                    recordVo.setCount(count.toString());
                    recordVo.setStatus(status.toString());
                    list.add(recordVo);
                }*/
                String inMno = "";
                Cell cell = hssfRow.getCell(0);
                if (cell != null) {
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    inMno = cell.getStringCellValue().trim();
                    if (StringUtils.isNotBlank(inMno)) {
                        String patternString = "^[7][0][0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]";
                        Pattern pattern = Pattern.compile(patternString);
                        Matcher m = pattern.matcher(inMno);
                        if (!m.matches()) {
                            errorRecord.put(rowNum + "", "行，商编格式不正确");
                            log.info("第：{}行,商编格式不正确", rowNum);
                            continue;
                        }
                        in.add(inMno);
                    }
                }
            }
        }
        log.info("===============in:{}", in);
        log.info("===========in.size:{}", in.size());
        log.info("===========errorRecord:{}", errorRecord);
        if (errorRecord.size() > 0) {
            exportExcel(errorRecord);
        }
    }

    private static void exportExcel(Map<String, String> map) {
        HttpServletResponse response = null;
        HSSFWorkbook wb = null;
        try {
            // 第一步，创建一个webbook，对应一个Excel文件
            wb = new HSSFWorkbook();
            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
            HSSFSheet sheet = wb.createSheet("黑白名单信息导入结果");
            // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
            HSSFRow row = sheet.createRow(0);
            // 第四步，创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

            HSSFFont f = wb.createFont();
            f.setFontHeightInPoints((short) 13);// 字号
            f.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);// 加粗
            style.setFont(f);

            // 设置这些样式
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中

            // 背景色
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            style.setFillBackgroundColor(HSSFColor.YELLOW.index);

            // 设置边框
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);

            HSSFCell cell = null;

            // 创建表头
            row.setHeight((short) 400);

            cell = row.createCell(0);
            sheet.setColumnWidth(0, 20 * 256);
            cell.setCellStyle(style);
            cell.setCellValue("行号");

            cell = row.createCell(1);
            sheet.setColumnWidth(1, 20 * 256);
            cell.setCellStyle(style);
            cell.setCellValue("失败原因");

            int rowNo = 1;
            // 第五步，写入实体数据
            for (int i = 0; i < map.size(); i++) {
                if (map.get(i + 1 + "") == null) {
                    continue;
                }
                int tempNum = 0;
                row = sheet.createRow(rowNo);
                //行号
                row.createCell(tempNum).setCellValue(i + 1 + "");
                //失败原因
                row.createCell(tempNum + 1).setCellValue(map.get(i + 1 + ""));
                rowNo++;
            }
            //输出Excel文件
            OutputStream output = response.getOutputStream();
            response.reset();
            // 默认名称
            response.setHeader("Content-disposition", "attachment; filename=xxx.xlsx");
            response.setContentType("application/msexcel");
            wb.write(output);
            output.close();
        } catch (Exception e) {
            log.error("写入Excel文件异常", e);
        } finally {
            log.info("结束写入.");
        }
    }

    @RequestMapping("/mpos")
    public String mpos(HttpServletRequest request, HttpSession session) {
        log.info("=============进入主页面===================");
        MposMemberMccType m1 = MposMemberMccType.builder().codeName("啦啦啦").code("111").build();
        MposMemberMccType m2 = MposMemberMccType.builder().codeName("哈哈哈").code("222").build();
        MposMemberMccType m3 = MposMemberMccType.builder().codeName("嘻嘻嘻").code("333").build();
        MposMemberMccType m4 = MposMemberMccType.builder().codeName("呵呵呵").code("444").build();
        MposMemberMccType m5 = MposMemberMccType.builder().codeName("略略略").code("555").build();
        log.info("=============1111111===================");
        List<MposMemberMccType> list = new ArrayList<>();
        list.add(m1);
        list.add(m2);
        list.add(m3);
        list.add(m4);
        list.add(m5);
        log.info("=============22222222===================");
        session.setAttribute("list", list);
        String url = "http://www.sxpmpos.com/plusImages/test/admin/344aa557-1ce2-4153-a54c-54d816363086_car.jpg";
        session.setAttribute("url", url);//wo xiang mai ge fang
        log.info("===========list:{}=============", list);
        String code = request.getParameter("code");
        String mcc = request.getParameter("mcc");
        log.info("==============进入LIST页面code:{},mcc:{}===============", code, mcc);
        return "/memberAttentList";
    }

    @RequestMapping("add")
    public String add() {
        log.info("==============进入添加页面===============");
        return "/memberAttentAdd";
    }

    @PostMapping("/addSave")
    public String addSave(HttpServletRequest request) {
        String sort = request.getParameter("sort");
        String codeName = request.getParameter("codeName");
        String code = request.getParameter("code");
        String mcc = request.getParameter("mcc");
        String[] str = mcc.split(",");
        log.info("==============进入添加页面sort:{},codeName:{},code:{},mcc:{}===============", sort, codeName, code, mcc);
        log.info("==============进入添加页面str===属性个数：{}============", str.length);
        for (String a : str) {
            log.info("===========:{}", a);
        }
        return "/memberAttentAdd";
    }

    @RequestMapping("update")
    public String update() {
        log.info("==============进入修改页面===============");
        return "/memberAttentUpdate";
    }

    @RequestMapping("aaa")
    public void aaa() {
        List<LeaveApplyVo> list = userService.getApplyRecord("2015263040001");
        log.info("======list:{}=====", list);
        for (LeaveApplyVo l : list) {
            l.setReason("啦啦啦");
        }
        log.info("=============list:{}==============", list);
        /*List<MposMemberMccType> list = memberAttentionMapper.selectType(mposMemberMccType);
        for (MposMemberMccType m : list) {
            String mcc = String.join(",", memberAttentionMapper.selectMccByType(m.getCode()));
            m.setMcc(mcc);
        }
        return list;
        List<LeaveApplyVo> getApplyRecord(String userId);*/
        /*src jiu xing le wo cao san fen san fen yi shang de ai wo qu */
    }

}
