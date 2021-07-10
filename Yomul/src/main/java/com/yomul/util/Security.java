package com.yomul.util;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

public class Security {

	// 10 바이트 의 랜덤 데이터를 생성하는 메소드
	public static String getRandomString() {
		return getSalt(10);
	}

	// 32바이트의 랜덤 데이터를 생성하는 메소드
	public static String getSalt() {
		String result = null;
		try {
			byte[] bytes = new byte[32];
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			random.nextBytes(bytes);
			result = new String(Base64.getEncoder().encode(bytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 특정 바이트 크기의 랜덤 데이터를 생성하는 메소드
	public static String getSalt(int size) {
		String result = null;
		try {
			byte[] bytes = new byte[size];
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			random.nextBytes(bytes);
			result = new String(Base64.getEncoder().encode(bytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 비밀번호를 SALT와 결합시킨 후 해싱한 값을 반환하는 메소드
	public static String pwHashing(String pw, String salt) {
		String result = null;
		pw = pw + salt;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] bytes = digest.digest(pw.getBytes("UTF-8"));
			result = new String(Base64.getEncoder().encode(bytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] args) {
		String tmp = "1234";
		String salt = getSalt();
		String pw = pwHashing(tmp, salt);

		System.out.println("pw: " + tmp);
		System.out.println("salt: " + salt);
		System.out.println("hashed pw: " + pw);
	}
}
