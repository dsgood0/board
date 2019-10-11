package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.khrd.dto.Member;
import com.khrd.jdbc.JDBCUtil;

public class MemberDAO {
	
	private static final MemberDAO dao = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return dao;
	}
	
	private MemberDAO() {
		
	}
	
	public int insert(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into member values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberid());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setTimestamp(4, new Timestamp(member.getRegdate().getTime())); // 밀리세컨드를 가져와서 타임스탬프에 넣음
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}
	
	public Member selectIdAndPw(Connection conn, String id, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where memberid = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member member = new Member(rs.getString("memberid"), rs.getString("name"),
											rs.getString("password"), rs.getTimestamp("regdate"));
				return member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}	
		
		return null;
	}
	
	public ArrayList<Member> select(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Member> list = new ArrayList<>();
			
			while(rs.next()) {
				Member m = new Member(rs.getString("memberid"), rs.getString("name"),
						rs.getString("password"), rs.getTimestamp("regdate"));
				list.add(m);
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
	
	public int updatePassword(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update member set password = ? where memberid= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;		
	}
	
	public Member selectById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where memberid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member member = new Member(rs.getString("memberid"), rs.getString("name"),
											rs.getString("password"), rs.getTimestamp("regdate"));
				return member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}	
		
		return null;
	}
	
}
