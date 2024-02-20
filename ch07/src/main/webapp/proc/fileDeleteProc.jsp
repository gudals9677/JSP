<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String fno = request.getParameter("fno");

// 다운로드 할 파일 정보 조회

try {
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();

	PreparedStatement psmt = conn.prepareStatement("DELETE FROM `FileTest` WHERE `fno`=?");
	psmt.setString(1, fno);
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}
	response.sendRedirect("../2.fileDownloadTest.jsp");
%>