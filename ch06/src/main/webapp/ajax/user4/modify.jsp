<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user4</title>
		<!-- 
			날짜 : 2024/02/15
			이름 : 김형민
			내용 : JSP AJAX 실습하기
		-->
	<script>
		window.onload = function(){
			
			// 문서 객체 생성
			
			const formUser = document.querySelector('form');
			const btnSubmit = formUser.querySelector('[name="submit"]');
			
			// 전송 버튼
			btnSubmit.onclick = (e)=>{
				e.preventDefault();
				
				const uid = formUser.uid.value;
				const name = formUser.name.value;
				const gender = formUser.gender.value;
				const age = formUser.age.value;
				const hp = formUser.hp.value;
				const addr = formUser.addr.value;
				
				const jsonData = {
						"uid":uid,
						"name":name,
						"gender":gender,
						"age":age,
						"hp":hp,
						"addr":addr
				};
				console.log("jsonData : " + jsonData);
				
				const strJson = JSON.stringify(jsonData);
				console.log(strJson);
				
				fetch('./proc/putUser4.jsp',{
							method : 'POST',
							headers: {
			 					"Content-Type": "application/json",
			 				},
							body : strJson
				})
					.then(response => response.json())
					.then((data)=>{
						console.log(data);
						
						if(data.result > 0){
					        alert('수정 완료!');
					        location.href = './list.jsp';
					    } else {
					        alert('수정 실패!');
					    }
					})
					.catch((err)=>{
						console.log(err);
					});
			}
			
			//현재 페이지url
			const url = location.href;
			const params = url.split('?')[1];
			const value = params.split('=')[1];
			console.log(value);
			
			fetch('./proc/getUser4.jsp?uid=' + value)
				.then(response => response.json())
				.then(resData =>{
					console.log(resData);
					
					formUser.uid.value = resData.uid;
					formUser.name.value = resData.name;
					formUser.gender.value = resData.gender;
					formUser.age.value = resData.age;
					formUser.hp.value = resData.hp;
					formUser.addr.value = resData.addr;
				})
				.catch((err)=>{
					console.log(err);
				});
		}
	
	</script>
	</head>
	<body>
		<h3>user4 수정</h3>
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
					<td>성별</td>
					<td><input type="text" name="gender"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age"></td>
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