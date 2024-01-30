<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>resultGet</title>
	</head>
	<body>
		<h3>Get 요청 결과</h3>
			<!--request에서 보내는 데이터를 수신-->
		<%
			String uid = request.getParameter("uid");
			String name = request.getParameter("name");
			String age = request.getParameter("age");
		%>
		
		<p>
			아이디 : <%=uid %><br>
			이름 : <%=name %><br>
			나이 : <%=age %><br>
		</p>
		
		<a href="../1.request.jsp">뒤로가기</a>

	</body>
</html>