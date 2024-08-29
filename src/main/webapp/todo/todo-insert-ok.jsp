<%@page import="java.sql.*"%>
<%@page import="test.web.common.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String tiTit = request.getParameter("tiTit");
	String tiMemo = request.getParameter("tiMemo");
	String tiLoca = request.getParameter("tiLoca");
	String tiTim = request.getParameter("tiTim");
	String tiDat = request.getParameter("tiDat");
	
	Connection con = DBcon.getCon();
	
	String sql = "INSERT INTO TODO_INFO(TI_TIT, TI_MEMO, TI_LOCA, TI_CRETIM, TI_CREDAT)";
	sql += "VALUES(?, ?, ?, ?, ?)";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, tiTit);
	ps.setString(2, tiMemo);
	ps.setString(3, tiLoca);
	ps.setString(4, tiTim);
	ps.setString(5, tiDat);
	
	int result = ps.executeUpdate();
	
	if(result==1){
%>
<script>
	alert('등록 성공');
	location.href = '/todo/todo-list.jsp';
</script>
<%
	}
%>
</body>
</html>