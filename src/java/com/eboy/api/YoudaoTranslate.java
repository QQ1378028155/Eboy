package com.eboy.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class YoudaoTranslate {

	private static final String URL_STRING = "http://fanyi.youdao.com/openap"
			+ "i.do?keyfrom=EbayProject&key=1038525348&type=data&doctype=text&version=1.0&q=";

//	public static void main(String[] args) throws Exception {
//		YoudaoTranslate ydt = new YoudaoTranslate();
//		String result = ydt.translate("���������");
//		System.out.println(result);
//	}

	public static String execute(String text) throws Exception {
		String textStr = "";
		String result = "";
		HttpURLConnection httpURLConnection = null;
		StringBuilder YoudaoAPIURL = new StringBuilder();
		YoudaoAPIURL.append(URL_STRING)
				.append(URLEncoder.encode(text, "UTF-8"));
		// System.out.println(YoudaoAPIURL.toString());
		try {
			httpURLConnection = (HttpURLConnection) new URL(
					YoudaoAPIURL.toString()).openConnection();
		} catch (IOException e) {
			throw new Exception("����youdaoAPI�쳣:", e);
		}
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					httpURLConnection.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String str;
			while ((str = br.readLine()) != null) {
				sb.append(str);
				sb.append('\n');
			}
			textStr = sb.toString();
			result = textStr.substring(textStr.indexOf("result=") + 7);
		} catch (Exception e) {
			throw new Exception("��ȡ������쳣��", e);
		}
		return result;
	}
}
