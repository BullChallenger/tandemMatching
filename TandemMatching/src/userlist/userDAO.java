package userlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class userDAO {
	
	public int login(String userId, String userPW) {
		
		String SQL = "SELECT userPW FROM userlist WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if (rs.getString(1).equals(userPW)) { // ��й�ȣ�� ��ġ�� ���
					return 1; // �α��� ����
				}
				
				else { // ��й�ȣ�� ��ġ���� ���� ��� 
					return 0; // �α��� ����
				}
			}
			
			return -1; // ���̵� �������� �ʴ� ���
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {if(rs != null) rs.close(); } catch (Exception e) {};
			try {if(pstmt != null) pstmt.close(); } catch (Exception e) {};
			try {if(conn != null) conn.close(); } catch (Exception e) {};
		}
		
		return -2; // �����ͺ��̽� ����
	}
	
	public int join(userDTO user) {

		String SQL = "INSERT INTO userlist VALUES (?, ?, ?, ?, FALSE, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			pstmt.setString(5, user.getUserNationality());
			pstmt.setString(6, user.getUserInstaAccount());
			pstmt.setString(7, user.getUserFbAccount());
			pstmt.setString(8, user.getUserName());
			pstmt.setString(9, user.getUserPhoneNum());
			pstmt.setString(10, user.getUserLanguage());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch (Exception e) {};
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {};
			try {if (conn != null) conn.close();} catch (Exception e) {};
		} 
		return -1; // ȸ������ ���� 
	}
	
	public String getUserEmail(String userId) {
		String SQL = "SELECT userEmail FROM userlist WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch (Exception e) {};
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {};
			try {if (conn != null) conn.close();} catch (Exception e) {};
		}
		
		return null;
	}
	
	public boolean getUserEmailChecked(String userId) { // emailcheck�� �Ǿ����� Ȯ��
		String SQL = "SELECT userEmailChecked FROM userlist WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch (Exception e) {};
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {};
			try {if (conn != null) conn.close();} catch (Exception e) {};
		}
		
		return false;
	}
	
	public boolean setUserEmailChecked(String userId) {
		String SQL = "UPDATE userlist SET userEmailChecked = true WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (pstmt != null) pstmt.close();} catch (Exception e) {};
			try {if (conn != null) conn.close();} catch (Exception e) {};
		}
		
		return false; // �����ͺ��̽� ����
	}

}
