<%@page import="dto.CustomerDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String custId = request.getParameter("custId");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	
	CustomerDTO dto = null;
	// DBCP 를 이용한 
		try{
			// 1단계 - JNDI 서비스 객체 생성
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			// 2단계 - 커넥션 풀에서 커넥션 가져오기
			DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
			Connection conn = ds.getConnection();
			PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `Customer` WHERE `custId`=?");
			psmt.setString(1,custId);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				dto = new CustomerDTO();
				dto.setCustId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAddr(rs.getString(4));
			}
			rs.close();
			psmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer modify</title>
</head>
<body>
	<h3>customer 수정하기</h3>
	<a href="../../2.DBCP.jsp">처음으로</a>
	<a href="./list.jsp">목록보기</a>
	<form action="./modifyProc" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="custId" readonly value="<%= dto.getCustId() %>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= dto.getName() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%= dto.getHp() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%= dto.getAddr() %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="수정하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>