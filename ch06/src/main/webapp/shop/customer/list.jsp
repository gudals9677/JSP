
<%@page import="dto.CustomerDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<CustomerDTO> customers = new ArrayList<>();

//DBCP 를 이용한 
	try{
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM `Customer";
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			CustomerDTO dto = new CustomerDTO();
			dto.setCustId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAddr(rs.getString(4));
			
			customers.add(dto);
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
		<title>Customer::list</title>
	</head>
	<body>
		<h3>Customer 목록</h3>
		
		<a href="../../2.DBCP.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
			<% for(CustomerDTO dto : customers){ %>
			<tr>
				<td><%= dto.getCustId() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getHp() %></td>
				<td><%= dto.getAddr() %></td>
				<td>
					<a href="./modify.jsp?custId=<%=dto.getCustId()%>">수정</a>
					<a href="./delete.jsp?custId=<%=dto.getCustId()%>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>