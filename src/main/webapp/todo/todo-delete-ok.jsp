<%@page import="test.web.common.DBcon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String tiNum = request.getParameter("tiNum");
Connection con = DBcon.getCon();
String sql = "DELETE FROM TODO_INFO WHERE TI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,tiNum);

int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('삭제 완료');
	location.href = '/todo/todo-list.jsp';
</script>
<%
}
%>