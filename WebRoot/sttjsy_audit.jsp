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
<%@page import="com.li.entity.Store"%>
<%@page import="com.li.dao.*;"%>
<%
/**********************��Ҫ�޸ĵĲ���********************/
String ID = request.getParameter("id");        //����
int ID1 = Integer.parseInt(ID);
String tj = request.getParameter("tj"); 
int tj1 = Integer.parseInt(tj);  
 
%>
<%
if(!tj.equals("")){
if(tj.equals("0")){

if (ID.equals("")){//���idΪ""���򵽴���ҳ
%>
<script>
alert("����Ϊ��!");
history.back();
</script>
<%
    }
    else{
        /********��Ҫ�޸ĵĲ���(�޸ı���)********************/
        //���ò�ѯ����,�õ������
         StoreDao md=new StoreDao();
				  md.updateStoretj(ID1,1); 
		  String showPage = request.getParameter("toPage");
		  String sqlWhere = request.getParameter("toWhere");
        /****************************************/
       
		if(tj!=null){
%>
<SCRIPT>alert("�Ƽ��ö��ɹ���");</SCRIPT>
<meta http-equiv="refresh"content="0;url=store.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
<%
 }
}
}else{

if (ID.equals("")){//���idΪ""���򵽴���ҳ
%>
<script>
alert("����Ϊ��!");
history.back();
</script>
<%
    }
    else{
        /********��Ҫ�޸ĵĲ���(�޸ı���)********************/
        //���ò�ѯ����,�õ������
        StoreDao md=new StoreDao();
				  md.updateStoretj(ID1,0); 
		  String showPage = request.getParameter("toPage");
		  String sqlWhere = request.getParameter("toWhere");
        /****************************************/
       
		if(tj!=null){
%>
<SCRIPT>alert("ȡ���Ƽ��ö���");</SCRIPT>
<meta http-equiv="refresh"content="0;url=store.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
<%
 }
}
}
}
%>
