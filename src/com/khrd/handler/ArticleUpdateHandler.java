package com.khrd.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ArticleDAO;
import com.khrd.dto.Article;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class ArticleUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String sNo = request.getParameter("no");
			int no = Integer.parseInt(sNo);
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				ArticleDAO dao = ArticleDAO.getInstance();
				Article article = dao.selectByNo(conn, no);
				request.setAttribute("article", article);
				
				return "/WEB-INF/view/updateForm.jsp";
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			return null;		
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			request.setCharacterEncoding("utf-8");
			
			String sNo = request.getParameter("no");
			int no = Integer.parseInt(sNo);
			String content = request.getParameter("content");
			String title = request.getParameter("title");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				ArticleDAO dao = ArticleDAO.getInstance();
				dao.updateArticle(conn, title, no, content);
				
				System.out.println(request.getContextPath());
				response.sendRedirect(request.getContextPath() + "/article/list.do");
				
				// return request.getContextPath()+"/article/list.do";
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			
		}
		return null;
	} 
}
