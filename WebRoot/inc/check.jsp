<%@page language="java" contentType="text/html;charset=gb2312"%>
<%
if(session.getAttribute("id") == null){
%>
	<Script language="javascript">
	<!--
		alert("�Բ���,�����µ�¼��");
		window.parent.location.href = "../login.html";
	//-->
	</script>
<%}%>