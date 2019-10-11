package com.khrd.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberChangePasswordHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/changePwdForm.jsp";	
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("Auth");
			String dbpassword = request.getParameter("pw");
			String password = request.getParameter("password");	
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();				
				Member m = dao.selectById(conn, id);
				
				if(m.getPassword().equals(dbpassword) == false) {
					int result = -1;
					request.setAttribute("result", result);
					return "/WEB-INF/view/changePwdForm.jsp";
				} else if(m.getPassword().equals(dbpassword) == true) {
					dao.updatePassword(conn, id, password);
					return "/WEB-INF/view/changePwdSuccess.jsp";
				}			
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}
}
