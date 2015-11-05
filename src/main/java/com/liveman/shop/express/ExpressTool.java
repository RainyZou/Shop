package com.liveman.shop.express;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
* @Title: ExpressTool.java
* @Package com.liveman.shop.express
* @Description: 快递工具
* @author sunny
* @date 2015年11月3日
* @version V1.0
 */
public class ExpressTool {
	private static final String UID = "47100";
	private static final String KEY = "008cdc3760964df9bd87bf905a6e0dac";
	
	public static Express checkExpress(String order,ExpressEnum express){
		if(order==null || order.equals("")){
			return null;
		}
		String url = "http://www.kuaidiapi.cn/rest/?uid="+UID+"&key="+KEY+"&order="+order+"&id="+express.toString().toLowerCase();
		InputStream inputStream = null;
        InputStreamReader inputStreamReader = null;
        BufferedReader reader = null;
        StringBuffer resultBuffer = new StringBuffer();
        String tempLine = null;
		try {
			URL localURL = new URL(url);
	        URLConnection connection = localURL.openConnection();
	        HttpURLConnection httpURLConnection = (HttpURLConnection)connection;
	        httpURLConnection.setRequestProperty("Accept-Charset", "UTF-8");
	        httpURLConnection.setRequestProperty("contentType", "UTF-8");
	        httpURLConnection.setRequestProperty("Content-type", "text/html");
	        if (httpURLConnection.getResponseCode() >= 300) {
	            throw new Exception("HTTP Request is not success, Response code is " + httpURLConnection.getResponseCode());
	        }
	        try {
	            inputStream = httpURLConnection.getInputStream();
	            inputStreamReader = new InputStreamReader(inputStream,"UTF-8");
	            reader = new BufferedReader(inputStreamReader);
	            while ((tempLine = reader.readLine()) != null) {
	                resultBuffer.append(tempLine);
	            }
	        } finally {
	            if (reader != null) {
	                reader.close();
	            }
	            if (inputStreamReader != null) {
	                inputStreamReader.close();
	            }
	            if (inputStream != null) {
	                inputStream.close();
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        
        return jsonTo(resultBuffer.toString());
	}
	
	private static Express jsonTo(String jsons){
		System.err.println(jsons);
		if(jsons == null || "".equals(jsons.trim())){
			return null;
		}
		ObjectMapper mapper = new ObjectMapper(); 
		Express express = new Express();
		 try {
			 express = mapper.readValue(jsons,Express.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return express;
	}
	
	
	
	
	public static void main(String[] args) throws Exception {
		System.out.println(ExpressTool.checkExpress("1901315209781", ExpressEnum.YUNDA));
	}
}
