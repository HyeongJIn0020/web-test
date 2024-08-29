<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/todo/todo-insert-ok.jsp" method="POST">
	제목 : <input type="text" name="tiTit"><br>
	내용 : <textarea name="tiMemo"></textarea><br>
	위치 : <input type="text" name="tiLoca"><br>
	시간 : <input type="text" name="tiTim"><br>
	일자 : <input type="text" name="tiDat"><br>
	<button>할일 등록</button>
</form>
</body>
</html>