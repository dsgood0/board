package com.khrd.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;

public class MemberLogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		// 로그아웃
		HttpSession session = request.getSession();
		session.invalidate(); 
		//session.removeAttribute(arg0); 특정키만 삭제
		return "index.jsp";
	}

}
