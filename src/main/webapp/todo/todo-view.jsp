<%@page import="test.web.common.DBcon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String tiNum = request.getParameter("tiNum");

Connection con = DBcon.getCon();
String sql = "SELECT TI_NUM, TI_TIT, TI_MEMO, TI_LOCA, TI_CRETIM, TI_CREDAT FROM TODO_INFO WHERE TI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, tiNum);
ResultSet rs = ps.executeQuery();

if(rs.next()){
%>
<form action="/todo/todo-update-ok.jsp" method="POST" id=frm>
	번호 : <%=rs.getString("TI_NUM") %><br>
	제목 : <input type="text" name="tiTit" value="<%=rs.getString("TI_TIT")%>"><br>
	내용 : <textarea name="tiMemo"><%=rs.getString("TI_MEMO")%></textarea><br>
	위치 : <input type="text" name="tiLoca" value="<%=rs.getString("TI_LOCA")%>"><br>
	시간 : <input type="text" name="tiTim" value="<%=rs.getString("TI_CRETIM")%>"><br>
	일자 : <input type="text" name="tiDat" value="<%=rs.getString("TI_CREDAT")%>"><br>
	<button>메뉴 수정</button>
	<button type="button" onclick="changeAction(1)">메뉴 삭제</button>
</form>
<script>
function changeAction(){
	const frm = document.querySelector('#frm');
	frm.action = '/todo/todo-delete-ok.jsp';
	frm.submit();
}
</script>
<%
}else{
%>
이미 삭제된 데이터입니다.
<a href="/todo/todo-list.jsp">할 일 목록</a>
<%
}
%>
</body>
</html>