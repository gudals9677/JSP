<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String regip = request.getRemoteAddr();
	
	
	// DBCP 를 이용한 
	try{
		// 1단계 - JNDI 서비스 객체 생성
		//Context initCtx = new InitialContext();
		//Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		Context ctx = (Context)new InitialContext().lookup("java:comp/env");
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/jboard");
		Connection conn = ds.getConnection();
		
		// 3단계 - SQL실행 객체 생성
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);
		psmt.setString(1, uid);
		psmt.setString(2, pass1);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, regip);
		
		// 4단계 - SQL실행
		psmt.executeUpdate();
		// 5단계 - 결과처리(select)
		// 6단계 - 데이터베이스 종료(커넥션 반납)
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/jboard1/user/login.jsp");
	
%>