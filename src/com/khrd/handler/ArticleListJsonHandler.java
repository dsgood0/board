package com.khrd.handler;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ArticleDAO;
import com.khrd.dto.Article;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class ArticleListJsonHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ArticleDAO dao = ArticleDAO.getInstance();
			List<Article> list = dao.selectArticleList(conn);
			
			// object -> json string
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
			
			// 브라우저로 값 전달
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(json);
			out.flush(); // 브라우저로 내보냄
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
