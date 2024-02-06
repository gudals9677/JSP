<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 현재 세션 해제
	session.invalidate();
	

	response.sendRedirect("/jboard1/user/login.jsp?code=101");

%>