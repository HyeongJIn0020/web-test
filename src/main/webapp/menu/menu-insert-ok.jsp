<%@page import="test.web.common.DBcon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- menu-insert-ok.jsp -->

<%
	request.setCharacterEncoding("UTF-8");
	String miName = request.getParameter("miName");
	String miPrice = request.getParameter("miPrice");
	String miDesc = request.getParameter("miDesc");
	
	Connection con = DBcon.getCon();
	
	String sql = "INSERT INTO MENU_INFO(MI_NAME, MI_PRICE, MI_DESC)";
	sql += "VALUES(?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, miName);
	ps.setString(2, miPrice);
	ps.setString(3, miDesc);
	
	int result = ps.executeUpdate();
	
	if(result==1){
%>
<script>
	alert('저장 성공!');
	location.href='/menu/menu-list.jsp';
</script>
<%
	}
%>