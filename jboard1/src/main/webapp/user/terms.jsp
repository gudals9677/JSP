<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="kr.co.jboard1.dto.TermsDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TermsDTO dto = UserDAO.getInstance().selectTerms();
%>
<%@ include file="./_header.jsp" %>
<script>

	window.onload = function(){
		
		const gudals1= document.getElementsByName('gudals1')[0];
		const gudals2= document.getElementsByName('gudals2')[0];
		
		const btnNext = document.getElementsByClassName('btnNext')[0];
		
		btnNext.onclick = ()=>{
			
			if(gudals1.checked && gudals2.checked){
				// 폼 전송
				document.frmTerms.submit();
				
			}else{
				alert('동의체크를 하셔야 합니다.');
				return false;
			}
			
		}
	}

</script>
<main>
    <section class="terms">
    <form action="/jboard1/user/proc/termsProc.jsp" name="frmTerms" method="post">
        <table>
            <caption>사이트 이용약관</caption>
            <tr>
                <td>
                    <textarea readonly><%= dto.getTerms() %></textarea>
                    <p>
                        <label><input type="checkbox" name="gudals1"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        <table>
            <caption>개인정보 취급방침</caption>
            <tr>
                <td>
                    <textarea readonly><%= dto.getPrivacy() %></textarea>
                    <p>
                        <label><input type="checkbox" name="gudals2"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        <table>
            <caption>마켓팅 수신동의(선택)</caption>
            <tr>
                <td>
                    <textarea readonly><%= dto.getSms() %></textarea>
                    <p>
                        <label><input type="checkbox" name="sms" value="Y"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        </form>
        <div>
            <a href="/jboard1/user/login.jsp" class="btnCancel">취소</a>
            <a href="#" class="btnNext">다음</a>
        </div>
    </section>
</main>
<%@ include file="./_footer.jsp" %>
