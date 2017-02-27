<%@page language="java" contentType="text/html;charset=gb2312"%>
<%
if(session.getAttribute("id") == null){
%>
	<Script language="javascript">
	<!--
		alert("对不起,请重新登录！");
		window.parent.location.href = "../login.html";
	//-->
	</script>
<%}%>