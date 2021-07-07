package com.yomul.api.kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yomul.api.APIKey;

public class KakaoLoginAPI {

	public String getAccessToken(String code) {
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
			sb.append("&client_id=").append(APIKey.KAKAO_API_KEY);
			sb.append("&redirect_uri=").append(APIKey.KAKAO_REDIRECT_URI);
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
//			System.out.println("response body: " + result.toString());

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
}
