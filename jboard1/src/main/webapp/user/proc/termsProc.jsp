<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String gudals1 = request.getParameter("gudals1");
	String gudals2 = request.getParameter("gudals2");
	
	// 데이터베이스 처리
	
	
	// 세션처리
	try{
		
	
	if(gudals1.equals("on") && gudals2.equals("on")){
		session.setAttribute("agree", true);
		response.sendRedirect("/jboard1/user/register.jsp");
	}else{
		response.sendRedirect("/jboard1/user/terms.jsp?code=300");
	}
	}catch(Exception e){
		
		e.printStackTrace();
		
		response.sendRedirect("/jboard1/user/terms.jsp?code=300");
	}



%>