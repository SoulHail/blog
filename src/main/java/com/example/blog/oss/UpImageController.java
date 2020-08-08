package com.example.blog.oss;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
public class UpImageController {

    @Autowired
    private UpImgService upImgService;

    @RequestMapping(value = "/headImgUpload", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String headImgUpload(HttpServletRequest request, MultipartFile file) {
        JSONObject result = new JSONObject();
        Map<String, Object> value = new HashMap<String, Object>();
        try {
            String url = upImgService.updateHead(file);
            log.debug("图片路径{}", url);
            value.put("data", url);
            value.put("code", 0);
            value.put("msg", "图片上传成功");
        } catch (Exception e) {
            e.printStackTrace();
            value.put("code", 2000);
            value.put("msg", "图片上传成功");
        }
        result.put("result", result);
        log.info("##################result:{}",result);
        return result.toString();
    }

}
