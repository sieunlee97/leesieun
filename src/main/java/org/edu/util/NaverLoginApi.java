package org.edu.util;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20{
	
	@Override
	public String getAccessTokenEndpoint() {
		// OAuth2.0 인증 체크하는 네이버 REST-API 주소(아래) : 네이버가 만들어주는 것을 개발자가 가져다가 사용
		// 로그인해도 되는 사람인지 확인(관리자인지 일반사용자인지는 확인 X)
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// 네이버 권한 체크하는 REST-API 주소(아래)
		return "https://nid.naver.com/oauth2.0/authorize";
	}
	
	// 싱글톤 인스턴스 객체를 생성하기 위해서 인스턴스 홀더 만든다.
	private static class InstanceHolder {
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}
	// 싱글톤으로 인스턴스 객체 생성하는 방식 : 클래스 실행을 1번만 하기 위해서
	public static NaverLoginApi instance() {
		return  InstanceHolder.INSTANCE;
	}
}
