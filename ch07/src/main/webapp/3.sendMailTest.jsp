<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3.sendMailTest</title>
				<!-- 
			날짜 : 2024/02/20
			이름 : 김형민
			내용 : 자바 메일 전송 실습
			앱 비밀번호 : ttry ugee estk wtwn
		 -->
	</head>
	<body>
		<h3>3. 자바 메일 전송</h3>
		<form action="./proc/sendEmailProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>보내는사람</td>
					<td><input type="text" name="sender"></td>
				</tr>
				<tr>
					<td>받는사람</td>
					<td><input type="text" name="receiver"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" rows="20" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="보내기"></td>
				</tr>
			</table>
		</form>
	</body>
</html>