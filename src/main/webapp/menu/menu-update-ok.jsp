<%@page import="test.web.common.DBcon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String miNum = request.getParameter("miNum");
	String miName = request.getParameter("miName");
	String miPrice = request.getParameter("miPrice");
	String miDesc = request.getParameter("miDesc");
	
	Connection con = DBcon.getCon();
	
	String sql = "UPDATE MENU_INFO\n"
			+"SET MI_NAME=?,\n"
			+"MI_PRICE=?,\n"
			+"MI_DESC=?\n"
			+"WHERE MI_NUM=?";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, miName);
	ps.setString(2, miPrice);
	ps.setString(3, miDesc);
	ps.setString(4, miNum);
	
	int result = ps.executeUpdate();
	
	if(result==1){
%>
<script>
	alert('수정 성공!');
	location.href='/menu/menu-list.jsp';
</script>
<%
	}
%>