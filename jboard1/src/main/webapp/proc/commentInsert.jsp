<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String parent = request.getParameter("parent");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String regip = request.getRemoteAddr();
	
	//ArticleDAO dao = ArticleDAO.getInstance();
	
	ArticleDTO comment = new ArticleDTO();
	comment.setParent(parent);
	comment.setContent(content);
	comment.setWriter(writer);
	comment.setRegip(regip);
	
	//dao.insertComment(comment);
	ArticleDAO.getInstance().insertComment(comment);
	
	response.sendRedirect("/jboard1/view.jsp?no="+parent);


%>