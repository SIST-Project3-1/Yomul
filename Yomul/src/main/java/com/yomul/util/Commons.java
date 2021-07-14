package com.yomul.util;

import com.google.gson.Gson;

public class Commons {

	private static Gson gson = new Gson();

	/**
	 * Gson으로 자바 객체를 Json으로 반환
	 * 
	 * @param src
	 * @return
	 */
	public static String parseJson(Object src) {
		return gson.toJson(src);
	}
}
