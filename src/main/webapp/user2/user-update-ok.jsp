<%@page import="java.sql.*"%>
<%@page import="test.web.common.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- user-update-ok.jsp -->
<%
request.setCharacterEncoding("UTF-8");
String uiNum = request.getParameter("uiNum");
String uiName = request.getParameter("uiName");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiGender = request.getParameter("uiGender");
String uiBirth = request.getParameter("uiBirth");
uiBirth = uiBirth.replace("-", "");
String[] uiHobbies = request.getParameterValues("uiHobby");
String uiHobby = "";
for(int i=0; i<uiHobbies.length; i++){
	uiHobby += uiHobbies[i] + ",";
}
uiHobby = uiHobby.substring(0, uiHobby.length()-1);
String uiDesc = request.getParameter("uiDesc");

String sql ="UPDATE user_info\r\n"
		+ "SET UI_NAME=?,\r\n"
		+ "UI_ID=?,\r\n"
		+ "UI_GENDER=?,\r\n"
		+ "UI_BIRTH=?,\r\n"
		+ "UI_HOBBY=?,\r\n"
		+ "UI_DESC=?\r\n";
if(!(uiPwd==null || uiPwd.equals(""))){
	sql += ",UI_PWD=?\r\n";
}
sql += "WHERE UI_NUM=?";
Connection con = DBcon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, uiName);
ps.setString(2, uiId);
ps.setString(3, uiGender);
ps.setString(4, uiBirth);
ps.setString(5, uiHobby);
ps.setString(6, uiDesc);
if(!(uiPwd==null || uiPwd.equals(""))){
	ps.setString(7, uiPwd);
	ps.setString(8, uiNum);
}else{
	ps.setString(7, uiNum);	
}
int result = ps.executeUpdate();
if(result==1){
%>
<script>
	alert('수정되었습니다.');
	location.href='/user2/user-view.jsp?uiNum=<%=uiNum%>';
</script>
<%
}
%>