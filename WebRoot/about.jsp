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
<%@page import="com.li.entity.About"%>
<%@page import="com.li.dao.*;"%>

	
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	str = str.replaceAll("'", "&acute;");
	return str;
}
%>
<% 	
	String ID=(String)request.getParameter("id");
	int ID1=Integer.parseInt(ID);
	String TYNAME="";
	if(ID.equals("1")) TYNAME="�߽����������ּ��";
	if(ID.equals("2")) TYNAME="��ϵ����";
	String CONTENT="";
	String SCONTENT="";
	String sql; 
     /***********************/
     java.util.Hashtable hash; //���ڱ���������Hashtable
    if (ID.equals("")){//���idΪ""���򵽴���ҳ
%>
<script>
		alert("�������ݣ�");
		history.back();
		</script>
<%
    }
    else{
        /**
         *���տ��ܵı�����Ϣ,�Կ���Ϊnull���ַ���������
         */

        String submit = request.getParameter("submit");//���水ť��ֵ
       
        if (submit!=null){
%>
<%	 	
        
		CONTENT = new String(request.getParameter("content").getBytes("ISO-8859-1"),"GBK");
		System.out.println(CONTENT);
		CONTENT = CONTENT.replaceAll("'", "&acute;");		
		UserDao md=new UserDao();
		About a=new About();
		md.updateAboutcontent(ID1,CONTENT);
        if (CONTENT!=null){
%>
<script>
				alert("�޸ĳɹ���");
			</script>
<meta http-equiv="refresh"content="0;url=about.jsp?id=<%=ID%>">
<%
        }else{
%>
<script>
				alert("����¼��������,���飡");
				history.back();
				</script>
<%
        }
    }else{
%>
<%

	
        /********��Ҫ�޸ĵĲ���********************/
        //���ò�ѯ����,�õ������
       UserDao md1=new UserDao();
		About a1=new About();
		a1=md1.findAboutById(ID1);
        /****************************************/
       
        //������Ϊ��,�������ҳ
        if (a1.getContent().isEmpty()){
%>
<script>
			alert("��¼�����ڣ�");
			history.back();
			</script>
<%
        }else{//�������Ϊ��
            /********��Ҫ�޸ĵĲ���********************/

   					
			 CONTENT = a1.getContent();
            
			/****************************************/
        }

%>
<html>
<head>
<link rel="stylesheet" href="../themes/default/default.css" />
<link rel="stylesheet" href="../plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor-min.js"></script>
<script charset="utf-8" src="../lang/zh_CN.js"></script>
<script charset="utf-8" src="../plugins/code/prettify.js"></script>
<script charset="utf-8" src="../showEditor.js"></script>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
<META content="MSHTML 6.00.2900.2627" name=GENERATOR>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
</head>
<body>
<FORM name=modify method="post" action="about.jsp?id=<%=ID%>" onSubmit="return errorCheck();" >
<table width=100% border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
<tbody>
  <tr>
    <th align=center  colspan="2" style="height: 23px"><%=TYNAME%></th>
  </tr>
 
  <TR bgcolor="#DEE5FA">
    
    <TD align=left class=txlrow colspan="2"><TEXTAREA name=content id="content1" rows=35 wrap=VIRTUAL cols=140><%=htmlspecialchars(CONTENT)%></TEXTAREA>
    </TD>
  </TR>
  <tr bgcolor="#DEE5FA">
    <td align=left class=txlrow>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="submit" name="submit" value="����">
     </td>
  </tr>
  <tr bgcolor="#DEE5FA">
    <td colspan=2 align=center class=txlrow></td>
  </tr>
  </tbody>
  </table>
</FORM>
</BODY>
</HTML><%} }%>
