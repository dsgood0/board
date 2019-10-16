package com.khrd.handler;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberJsonHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String userId = request.getParameter("id");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member member = dao.selectById(conn, userId);
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("member", member);
				if(member == null) {
					map.put("result", "fail");
				} else {
					map.put("result", "success");
				}
				
				// map -> json string
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println(json);
				out.flush();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			
		}	
		
		return null;
	}

}
