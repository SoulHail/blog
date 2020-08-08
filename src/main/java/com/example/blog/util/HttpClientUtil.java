package com.example.blog.util;


import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.net.URI;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;


@Slf4j
public class HttpClientUtil {

    private static HttpClientUtil instance;
    protected static Charset charset;

    private HttpClientUtil(){}

    public static HttpClientUtil getInstance() {
        return getInstance(Charset.defaultCharset());
    }

    private static HttpClientUtil getInstance(Charset charset){
        if(instance == null){
            instance = new HttpClientUtil();
        }
        instance.setCharset(charset);
        return instance;
    }

    public void setCharset(Charset charset) {
        this.charset = charset;
    }


    /**
     * get请求
     */
    public static String doGet(String url) throws Exception {
        return doGet(url, null, null);
    }

    public static String doGet(String url, Map<String, String> header) throws Exception {
        return doGet(url, null, header);
    }

    public static String doGet(String url, Map<String, Object> params, Map<String, String> header) throws Exception {
        String body = null;
        try {
            // Get请求
            log.info("protocol: GET");
            HttpGet httpGet = new HttpGet(url.trim());
            // 设置参数
            if (params != null && !params.isEmpty()) {
                String str = EntityUtils.toString(new UrlEncodedFormEntity(map2NameValuePairList(params), charset));
                String uri = httpGet.getURI().toString();
                if(uri.contains("?")){
                    httpGet.setURI(new URI(httpGet.getURI().toString() + "&" + str));
                }else {
                    httpGet.setURI(new URI(httpGet.getURI().toString() + "?" + str));
                }
            }
            log.info("     url: " + httpGet.getURI());
            // 设置Header
            if (header != null && !header.isEmpty()) {
                log.info("   header: " + header);
                for (Iterator<Entry<String, String>> it = header.entrySet().iterator(); it.hasNext();) {
                    Entry<String, String> entry = (Entry<String, String>) it.next();
                    httpGet.setHeader(new BasicHeader(entry.getKey(), entry.getValue()));
                }
            }
            // 发送请求,获取返回数据
            body =  execute(httpGet);
        } catch (Exception e) {
            throw e;
        }
        log.info("  result: " + body);
        return body;
    }

    private static List<NameValuePair> map2NameValuePairList(Map<String, Object> params) {
        if (params != null && !params.isEmpty()) {
            List<NameValuePair> list = new ArrayList<NameValuePair>();
            Iterator<String> it = params.keySet().iterator();
            while (it.hasNext()) {
                String key = it.next();
                if(params.get(key) != null) {
                    String value = String.valueOf(params.get(key));
                    list.add(new BasicNameValuePair(key, value));
                }
            }
            return list;
        }
        return null;
    }


    private static String execute(HttpRequestBase requestBase) throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        String body = null;
        try {
            CloseableHttpResponse response = httpclient.execute(requestBase);
            try {
                HttpEntity entity = response.getEntity();

                if (entity != null) {
                    body = EntityUtils.toString(entity, charset.toString());
                }
                EntityUtils.consume(entity);
            } catch (Exception e) {
                throw e;
            }finally {
                response.close();
            }
        } catch (Exception e) {
            throw e;
        } finally {
            httpclient.close();
        }
        return body;
    }
}

