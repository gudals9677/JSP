<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("utf-8");

	// 데이터 수신
	String uid   = request.getParameter("uid");
	String name  = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp    = request.getParameter("hp");
	String age   = request.getParameter("age");
	
	// 데이터베이스 작업
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "gudals";
	String pass = "1234";
	
	
	try{
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);	
		
		// 3단계 - SQL 실행 객체 생성
		String sql = "INSERT INTO `User1` VALUES(?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,uid);
		psmt.setString(2,name);
		psmt.setString(3,birth);
		psmt.setString(4,hp);
		psmt.setString(5,age);
		
		// 4단계 - SQL 실행
		psmt.executeUpdate();
		
		// 5단계 - 결과 처리(SELECT)
	
		// 6단계 - 데이터베이스 종료
		conn.close();
		psmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록 이동
	response.sendRedirect("./list.jsp");
	
	
%>