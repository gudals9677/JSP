<%@page import="dto.ProductDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String prodNo = request.getParameter("prodNo");
	String prodName = request.getParameter("prodName");
	String stock = request.getParameter("stock");
	String price = request.getParameter("price");
	String company = request.getParameter("company");
	
	ProductDTO dto = null;
	// DBCP 를 이용한 
			try{
				// 1단계 - JNDI 서비스 객체 생성
				Context initCtx = new InitialContext();
				Context ctx = (Context) initCtx.lookup("java:comp/env");
				
				// 2단계 - 커넥션 풀에서 커넥션 가져오기
				DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
				Connection conn = ds.getConnection();
				
				String sql = "SELECT * FROM `Product` WHERE `prodNo`=?";
				PreparedStatement psmt = conn.prepareStatement(sql);
				psmt.setString(1,prodNo);
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()){
					dto = new ProductDTO();
					dto.setProdNo(rs.getInt(1));
					dto.setProdName(rs.getString(2));
					dto.setStock(rs.getInt(3));
					dto.setPrice(rs.getInt(4));
					dto.setCompany(rs.getString(5));
					
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
<title>product : modify</title>
</head>
<body>
	<h3>product 수정하기</h3>
	<a href="../../2.DBCP.jsp">처음으로</a>
	<a href="./list.jsp">목록보기</a>
	<form action="./modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type = "number" name="prodNo" readonly value="<%=dto.getProdNo()%>"></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type = "text" name="prodName" value="<%=dto.getProdName()%>">></td>
			</tr>
			<tr>
				<td>재고량</td>
				<td><input type = "number" name="stock" value="<%=dto.getStock()%>">></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type = "number" name="price" value="<%=dto.getPrice()%>">></td>
			</tr>
			<tr>
				<td>회사</td>
				<td><input type = "text" name="company" value="<%=dto.getCompany()%>">></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="수정하기"></td>
			</tr>	
		</table>
	</form>
</body>
</html>