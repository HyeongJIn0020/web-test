<%@page import="test.web.common.DBcon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String tiNum = request.getParameter("tiNum");
	String tiTit = request.getParameter("tiTit");
	String tiMemo = request.getParameter("tiMemo");
	String tiLoca = request.getParameter("tiLoca");
	String tiTim = request.getParameter("tiTim");
	String tiDat = request.getParameter("tiDat");
	
	Connection con = DBcon.getCon();
	
	String sql = "UPDATE TODO_INFO\n"
			+"SET TI_TIT=?,\n"
			+"TI_MEMO=?,\n"
			+"TI_LOCA=?,\n"
			+"TI_CRETIM=?,\n"
			+"TI_CREDAT=?\n"
			+"WHERE TI_NUM=?";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, tiTit);
	ps.setString(2, tiMemo);
	ps.setString(3, tiLoca);
	ps.setString(4, tiTim);
	ps.setString(5, tiDat);
	ps.setString(6, tiNum);
	
	int result = ps.executeUpdate();
	
	if(result==1){
%>
<script>
	alert('수정 성공!');
	location.href='/todo/todo-list.jsp';
</script>
<%
	}
%>