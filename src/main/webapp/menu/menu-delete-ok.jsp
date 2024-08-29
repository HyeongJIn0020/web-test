<%@page import="test.web.common.DBcon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- menu-delete-ok.jsp -->
<%
String miNum = request.getParameter("miNum");
Connection con = DBcon.getCon();
String sql = "DELETE FROM MENU_INFO WHERE MI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,miNum); /* 지정한 인덱스의 파라미터 값을 miNum이라 지정 */

int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('메뉴 삭제 완료');
	location.href = '/menu/menu-list.jsp';
</script>
<%
}
%>