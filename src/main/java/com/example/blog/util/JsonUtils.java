package com.example.blog.util;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JsonUtils {

    // 字符串转Json
    public JSONObject strToJson(String str) {
        return JSONObject.parseObject(str);
    }

    // Json转String
    public String jsonToStr(JSONObject json) {
        return json.toString();
    }

}
