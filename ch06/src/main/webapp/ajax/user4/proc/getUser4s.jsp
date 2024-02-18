<%@page import="dto.User4DTO"%>
<%@page import="dto.User3DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.User1DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
// contentType application/json로 변경
	
	List<User4DTO> user4s = new ArrayList<>();
	try{
		// 1단계 JNDI 서비스 객체 생성
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		// 2단계 커넥션풀 객체 생성
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `User4`");
		
		while(rs.next()){
			User4DTO user = new User4DTO();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setGender(rs.getString(3));
			user.setAge(rs.getInt(4));
			user.setHp(rs.getString(5));
			user.setAddr(rs.getString(6));
			
			user4s.add(user);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user4s);
	out.print(strJson);
	
%>