package com.yomul.api.kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yomul.api.APIKey;

public class KakaoLoginAPI {

	public static String getAccessToken(String code, String redirectURI) {
		KakaoLoginAPITokenVO token = null;
		try {
			URL url = new URL("https://kauth.kakao.com/oauth/token");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 통신 설정
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// 요청 파라미터 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=").append(APIKey.KAKAO_API_REST_KEY);
			sb.append("&redirect_uri=").append(redirectURI);
			sb.append("&code=").append(code);
			bw.write(sb.toString());
			bw.flush();

			// 응답 코드
//			int responseCode = conn.getResponseCode();
//			System.out.println("responseCode: " + responseCode);

			// 반환 받은 JSON 타입 데이터 읽기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";

			StringBuilder result = new StringBuilder();
			while ((line = br.readLine()) != null) {
				result.append(line);
			}
//			System.out.println("accessToken: " + result.toString());

			// GSON 으로 JSON 객체 생성
			Gson gson = new Gson();
			token = gson.fromJson(result.toString(), KakaoLoginAPITokenVO.class);

			br.close();
			bw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return token.getAccess_token();
	}

	public static HashMap<String, Object> getUserInfo(String accessToken) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
//			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
//			System.out.println("response body : " + result);

			JsonObject json = JsonParser.parseString(result).getAsJsonObject();

//			JsonObject properties = json.get("properties").getAsJsonObject();
			JsonObject kakao_account = json.get("kakao_account").getAsJsonObject();

			String id = json.get("id").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("id", id);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}
}
