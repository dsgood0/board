package com.khrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 없는 command(**.do)를 요청 시 실행될 함수
public class NullHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 에러 발생
		return null;
	}

}
