<%@page import="test.web.common.DBcon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiName = request.getParameter("uiName");

Connection con = DBcon.getCon();
Statement stmt = con.createStatement();
String sql  = "INSERT INTO user_info(UI_NAME, UI_ID, UI_PWD, CREDAT, CRETIM)";
sql += "VALUES('" + uiName + "','" + uiId + "','" + uiPwd + "', DATE_FORMAT(NOW(), '%Y%m%d'),";
sql += "DATE_FORMAT(NOW(), '%H%i%s'))";
int result = stmt.executeUpdate(sql);

if(result ==1){
%>
<script>
<%="아이디 : " + uiId%><br>
<%="비밀번호 : " + uiPwd%><br>
<%="이름 : " + uiName%><br>
</script>
<%
}else{
%>
<script>
	alert('회원가입이 실패하였습니다.');
	location.href='/user/user-insert.jsp';
</script>
<%
}
%>