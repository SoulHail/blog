package com.example.blog.test;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;
import java.util.List;

@Slf4j
public class Iii {
    public static void main(String[] args) {
        /*String a = "[{\"code\":\"happy_sts\",\"data\":[{\"name\":\"开通中\",\"val\":\"00\"}],\"name\":\"欢乐送状态\",\"rangeType\":\"2\",\"tableFieldName\":\"happy_sts\"}]";
        String result = JSONArray.parseArray(a).get(0).toString();
        String name = JSONObject.parseObject(result).get("name").toString();
        System.out.println(name);
        String dataTemp = JSONObject.parseObject(result).get("data").toString();
        String data = JSONArray.parseArray(dataTemp).get(0).toString();
        String value = JSONObject.parseObject(data).get("name").toString();
        System.out.println(value);*/


        //String a = "[{\"code\":\"gndr\",\"data\":[{\"name\":\"男\",\"val\":\"01\"}],\"name\":\"性别\",\"rangeType\":\"2\",\"tableFieldName\":\"gndr\"},{\"code\":\"mbl_phn_oprtn_sys\",\"data\":[{\"name\":\"安卓\",\"val\":\"android\"}],\"name\":\"操作系统\",\"rangeType\":\"2\",\"tableFieldName\":\"mbl_phn_oprtn_sys\"},{\"code\":\"dly_tx_up_dlvry_re\",\"data\":[{\"name\":\"黑龙江省\",\"val\":\"黑龙江省\"}],\"name\":\"最常交易上送地区\",\"rangeType\":\"2\",\"tableFieldName\":\"dly_tx_up_dlvry_re\"},{\"code\":\"dly_land_region\",\"data\":[{\"name\":\"黑龙江省\",\"val\":\"黑龙江省\"}],\"name\":\"最常登陆地区\",\"rangeType\":\"2\",\"tableFieldName\":\"dly_land_region\"}]";
        String a = "[{\"code\":\"last_30_amt\",\"data\":[{\"groupId\":\"group1\",\"max\":\"10000\",\"min\":\"10\"}],\"name\":\"近30天内累积交易金额\",\"rangeType\":\"3\",\"tableFieldName\":\"last_30_amt\"},{\"code\":\"discnt_rate\",\"data\":[{\"name\":\"否\",\"val\":\"N\"}],\"name\":\"优惠费率\",\"rangeType\":\"2\",\"tableFieldName\":\"discnt_rate\"},{\"code\":\"tx_way_prfrnc\",\"data\":[{\"name\":\"刷卡\",\"val\":\"刷卡\"},{\"name\":\"手机闪付\",\"val\":\"手机闪付\"}],\"name\":\"交易方式偏好\",\"rangeType\":\"2\",\"tableFieldName\":\"tx_way_prfrnc\"},{\"code\":\"curr_vip_user\",\"data\":[{\"name\":\"否\",\"val\":\"N\"}],\"name\":\"当前VIP用户\",\"rangeType\":\"2\",\"tableFieldName\":\"curr_vip_user\"},{\"code\":\"last_30_cnt\",\"data\":[{\"groupId\":\"group1\",\"max\":\"15\",\"min\":\"1\"}],\"name\":\"近30天内累积交易笔数\",\"rangeType\":\"3\",\"tableFieldName\":\"last_30_cnt\"}]";
        Integer size = Integer.valueOf(StringUtils.countMatches(a, "name"));
        if (size == 0) {
            log.info("========为空=======");
        }
        size = size / 2;
        String value = "";
        for (int i = 0; i < size; i++) {
            String result = JSONArray.parseArray(a).get(i).toString();
            String name = JSONObject.parseObject(result).get("name").toString();
            System.out.println(name);
            String dataTemp = JSONObject.parseObject(result).get("data").toString();
            String data = JSONArray.parseArray(dataTemp).get(0).toString();
            try {
                value = JSONObject.parseObject(data).get("name").toString();
                if (StringUtils.isBlank(value)) {
                    log.info("==================没有该属性");
                }
            }catch (Exception e) {
                value = JSONObject.parseObject(data).get("max").toString();
            }
            log.info("========条件：{}====value:{}=======", name, value);
        }

    }

    private static void aaa(String a) {
        List<String> list = Arrays.asList(a.split(","));
        System.out.println(list);
    }

}
