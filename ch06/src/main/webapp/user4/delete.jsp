<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "gudals";
	String pass = "1234";
		
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(host,user,pass);
	PreparedStatement psmt = conn.prepareStatement("DELETE FROM `User4` WHERE `uid`=?");
	psmt.setString(1, uid);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("./list.jsp");
%>
