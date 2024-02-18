<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user3</title>
		<!-- 
			날짜 : 2024/02/15
			이름 : 김형민
			내용 : JSP AJAX 실습하기
		-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script>
			window.onload = function(){
				
				const formUser = document.getElementsByTagName('form')[0];
				const btnSubmit = formUser.submit;
				
				btnSubmit.onclick = (e) =>{
					e.preventDefault();
					
					const uid = formUser.uid.value;
					const name = formUser.name.value;
					const birth = formUser.birth.value;
					const hp = formUser.hp.value;
					const addr = formUser.addr.value;
					
					const jsonData = {
							"uid":uid,
							"name":name,
							"birth":birth,
							"hp":hp,
							"addr":addr
					};
					
					$.ajax({
						method : 'POST',
						url : './proc/putUser3.jsp',
						data : jsonData,
						success : function(data){
							console.log(data);
							
							if(data.result > 0){
								alert('수정완료');
								location.href = './list.jsp';
							}
						}
					});
				}
				//현재 페이지 url
				const url = location.href;
				const params = url.split('?')[1];
				const value = params.split('=')[1];
				console.log(value);
				
				//서버요청
				const xhr = new XMLHttpRequest();
				xhr.open('GET','./proc/getUser3.jsp?uid='+value);
				xhr.send();
				
				//응답처리
				xhr.onreadystatechange = function(){
					
					//응답완료
					if(xhr.readyState == XMLHttpRequest.DONE){
						
						//요청성공
						if(xhr.status == 200){
							const resData = JSON.parse(xhr.responseText);
							
							console.log(resData);
							
							formUser.uid.value = resData.uid;
							formUser.name.value = resData.name;
							formUser.birth.value = resData.birth;
							formUser.hp.value = resData.hp;
							formUser.addr.value = resData.addr;
						}else{
							//요청 실패
						}
					}
				}
			}
		</script>
	</head>
	<body>
		<h3>user3 수정</h3>
		<a href="./list.jsp">목록이동</a>
		<form action="#"> 
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" name="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>