<%@page language="java" contentType="text/html;charset=gbk"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.springframework.stereotype.Controller"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="org.springframework.web.bind.annotation.PathVariable"%>
<%@page import="org.springframework.web.bind.annotation.RequestMapping"%>
<%@page import="org.springframework.web.bind.annotation.RequestMethod"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.List"%>
<%@page import="com.li.entity.User"%>
<%@page import="com.li.dao.*;"%>

<%
    /**
     *���տ��ܵı�����Ϣ,�Կ���Ϊnull���ַ���������
     */
				String submit = request.getParameter("submit");//���水ť��ֵ
				if (submit!=null){
				String id=(String)session.getAttribute("id");
				String oldpassword = request.getParameter("oldpassword");
				String password =request.getParameter("password");
				 UserDao md=new UserDao();  
	              User m=new User();
	              m=md.findUserById(1);
	              System.out.println(oldpassword);
	              System.out.println(m.getPassword());   
				if (!oldpassword.equals(m.getPassword())){
%>
				<SCRIPT language=javascript>
				alert("ԭ���벻��!������!");
				history.back();
				</SCRIPT>
<% }else{
				md.updateUser(1,password);
				if (m!=null){
%>
				<script>
				alert("�����޸ĳɹ���");
				</script>
				<meta http-equiv="refresh"content="0;url=huanying.jsp">
<%
				}
				else{
%>
				<script>
				alert("����ԭ��,�����޸�ʧ��!");
				history.back();
				</script>
<%
				}
			}
		}else{
%>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
<META content="MSHTML 6.00.2900.2627" name=GENERATOR>
</head>
<body>
<FORM name=form1 action=passwordmodify.jsp  method=post>
  <table width="100%" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=2 style="height: 23px">�޸�����</th>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td colspan="2" align="center" class=txlrow>&nbsp;</td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">ԭ���룺</td>
        <td align=left class=txlrow><INPUT maxLength=100 name=oldpassword type=password></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">�����룺</td>
        <td align=left class=txlrow><INPUT maxLength=50 name=password type=password></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">&nbsp;</td>
        <td align=left class=txlrow>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" name="submit" value="����">
          &nbsp;&nbsp;
          <input type="reset" name="reset" value="����" ></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td colspan=2 align=center class=txlrow></td>
      </tr>
    </tbody>
  </table>
</form>
</BODY>
</HTML><%}%>
