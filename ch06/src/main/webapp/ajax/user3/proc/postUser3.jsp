<%@page import="dto.User3DTO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="dto.User1DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// request Body JSON 문자열 스트림 처리(reader는 문자열 스트림)
	request.setCharacterEncoding("utf-8");
	
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	String line;
	while((line = reader.readLine()) != null){
		
		requestBody.append(line);
	}
	reader.close();

	//System.out.println(requestBody.toString());
	
	//JSON 파싱(문자열을 객체로 만듬)
	Gson gson = new Gson();
	User3DTO user3 = gson.fromJson(requestBody.toString(), User3DTO.class);
	
	System.out.println(user3);
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("INSERT INTO `User3` VALUES(?,?,?,?,?)");
	psmt.setString(1,user3.getUid());
	psmt.setString(2,user3.getName());
	psmt.setString(3,user3.getBirth());
	psmt.setString(4,user3.getHp());
	psmt.setString(5,user3.getAddr());
	
	int result = psmt.executeUpdate();
	System.out.println("result : " + result);
	
	psmt.close();
	conn.close();
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());
%>