<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
		</head>
		<body>
		<h3>user4 등록</h3>
		<form action="#"> 
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
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
						<input type="submit" name="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
		<script>
			//사용자 등록
			window.onload = function(){
			const btnSubmit = document.getElementsByName('submit')[0];
			const formUser4 = document.getElementsByTagName('form')[0];
			
			btnSubmit.onclick = (e) =>{
				e.preventDefault();
				
				const uid = formUser4.uid.value;
				const name = formUser4.name.value;
				const gender = formUser4.gender.value;
				const age = formUser4.age.value;
				const hp = formUser4.hp.value;
				const addr = formUser4.addr.value;
				
				//json 생성
				const jsonData = {
						"uid":uid,
						"name":name,
						"gender":gender,
						"age":age,
						"hp":hp,
						"addr":addr
				};
				console.log(jsonData);
				
				// 서버 전송
				fetch('./proc/postUser4.jsp',{
						method : 'POST',
						body : JSON.stringify(jsonData)
				})	
				.then(response => response.json())
				.then((data)=>{
					console.log(data);
					
					if(data.result >0 ){
						alert("등록 성공!");
						
						//목록 이동
						location.href = './list.jsp';
					}else{
						alert("등록 실패!");
					}
				})
				.catch((err)=>{
					console.log(err);
				});
			}
		}
		</script>
	</body>
</html>