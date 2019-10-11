package com.khrd.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ArticleDAO;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Article;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class ArticleInsertHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/view/articleInsertForm.jsp";
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			request.setCharacterEncoding("utf-8");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				ArticleDAO dao = ArticleDAO.getInstance();
				HttpSession session = request.getSession();
				String writer_id = (String) session.getAttribute("Auth");
				
				MemberDAO mDao = MemberDAO.getInstance();
				Member member = mDao.selectById(conn, writer_id);
								
				Article article = new Article(0, writer_id, member.getName(), title, null, null, 0, content);
				dao.insertArticle(conn, article);
				dao.insertContent(conn, content);
				conn.commit(); // DB 테이블의 값을 변경하라
				
				// 서버단 안(자바)에서 "/"가 프로젝트 이름을 대신함.
				response.sendRedirect(request.getContextPath() + "/article/list.do");
				
				return null; // forward로 보내기 때문에 sendRedirect 해야함
				
			} catch(Exception e) {
				e.printStackTrace();
				conn.rollback(); // DB 원상복귀하라
			} finally {
				JDBCUtil.close(conn);
			}		
			
			return "/WEB-INF/view/articleInsertResult.jsp";
		}
		return null;
	}

}
