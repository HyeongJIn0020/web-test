<%@page import="java.sql.*"%>
<%@page import="test.web.common.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>내용</td>
		<td>위치</td>
		<td>시간</td>
		<td>일자</td>
	</tr>
<%
Connection con = DBcon.getCon();
String sql = "SELECT TI_NUM, TI_TIT, TI_MEMO, TI_LOCA, TI_CRETIM, TI_CREDAT FROM TODO_INFO";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+ rs.getString("TI_NUM") + "</td>");
	out.println("<td><a href='/todo/todo-view.jsp?tiNum=" + rs.getString("TI_NUM") + "'>" + rs.getString("TI_TIT") + "</a></td>");
	out.println("<td>" + rs.getString("TI_MEMO") + "</td>");
	out.println("<td>" + rs.getString("TI_LOCA") + "</td>");
	out.println("<td>" + rs.getString("TI_CRETIM") + "</td>");
	out.println("<td>" + rs.getString("TI_CREDAT") + "</td>");
	out.println("</tr>");
	}
%>	
</table>
<button onclick="location.href='/todo/todo-insert.jsp'">할일 등록하기</button>
</body>
</html>