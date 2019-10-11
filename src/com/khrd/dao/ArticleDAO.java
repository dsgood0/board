package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.khrd.dto.Article;
import com.khrd.jdbc.JDBCUtil;

public class ArticleDAO {

	private static final ArticleDAO dao = new ArticleDAO();
	
	public static ArticleDAO getInstance() {
		return dao;
	}
	
	private ArticleDAO() {
		
	}
	
	public int insertArticle(Connection conn, Article article) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into article values (null, ?, ?, ?, now(), now(), 0);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter_id());
			pstmt.setString(2, article.getWriter_name());
			pstmt.setString(3, article.getTitle());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int insertContent(Connection conn, String content) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into article_content values(last_insert_id(), ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public ArrayList<Article> selectArticleList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from article order by article_no desc;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Article> list = new ArrayList<>();
			
			while(rs.next()) {
				Article article = new Article(rs.getInt("article_no"), rs.getString("writer_id"), rs.getString("writer_name"),
												rs.getString("title"), rs.getTimestamp("regdate"), rs.getTimestamp("moddate"),
												rs.getInt("read_cnt"), null);
				list.add(article);
			}
			return list;
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		
		return null;
	}
	
	public Article selectByNo(Connection conn, int article_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from article a left join article_content c on a.article_no = c.article_no where a.article_no = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Article article = new Article(rs.getInt("article_no"), rs.getString("writer_id"), rs.getString("writer_name"), rs.getString("title"), 
						rs.getTimestamp("regdate"), rs.getTimestamp("moddate"), rs.getInt("read_cnt"), rs.getString("content"));
				return article;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return null;
	}
	
	public int updateArticle(Connection conn, String title, int article_no, String content) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update article a left join article_content c on a.article_no = c.article_no set a.title = ?, c.content = ? where a.article_no = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, article_no);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public int deleteArticle(Connection conn, int article_no) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from article where article_no = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article_no);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}	
		
		return -1;
	}
	
	public int deleteArticleContent(Connection conn, int article_no) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from article_content where article_no = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article_no);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}	
		
		return -1;
	}
}

