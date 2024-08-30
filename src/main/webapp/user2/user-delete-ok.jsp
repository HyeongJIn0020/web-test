<%@page import="java.sql.*"%>
<%@page import="test.web.common.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- user-delete-ok.jsp -->
<%
String uiNum = request.getParameter("uiNum");
Connection con = DBcon.getCon();
String sql = "DELETE FROM user_info WHERE UI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, uiNum);

int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('삭제되었습니다.');
	location.href='/user2/user-list.jsp';
</script>
<%
}else{
%>
<script>
	alert('이미 삭제된 유저입니다.');
	location.href='/user2/user-list.jsp';
</script>
<%
}
%>