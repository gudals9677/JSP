
<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserDTO user = UserDAO.getInstance().selectUserForLogin(uid, pass);

	//회원 여부에 따라 세션처리
	if(user != null){
		// 회원이 맞을경우
		// 회원정보를 세션을 통해 저장
		session.setAttribute("sessUser", user);
		
		// 글 목록 이동
		response.sendRedirect("/jboard1/list.jsp");
	}else{
		// 회원이 아닐경우 -> 로그인 이동
		response.sendRedirect("/jboard1/user/login.jsp?code=100");
	}
%>