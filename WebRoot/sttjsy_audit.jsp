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
/**********************需要修改的部分********************/
String ID = request.getParameter("id");        //索引
int ID1 = Integer.parseInt(ID);
String tj = request.getParameter("tj"); 
int tj1 = Integer.parseInt(tj);  
 
%>
<%
if(!tj.equals("")){
if(tj.equals("0")){

if (ID.equals("")){//如果id为""导向到错误页
%>
<script>
alert("传数为空!");
history.back();
</script>
<%
    }
    else{
        /********需要修改的部分(修改表名)********************/
        //设置查询条件,得到结果集
         StoreDao md=new StoreDao();
				  md.updateStoretj(ID1,1); 
		  String showPage = request.getParameter("toPage");
		  String sqlWhere = request.getParameter("toWhere");
        /****************************************/
       
		if(tj!=null){
%>
<SCRIPT>alert("推荐置顶成功！");</SCRIPT>
<meta http-equiv="refresh"content="0;url=store.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
<%
 }
}
}else{

if (ID.equals("")){//如果id为""导向到错误页
%>
<script>
alert("传数为空!");
history.back();
</script>
<%
    }
    else{
        /********需要修改的部分(修改表名)********************/
        //设置查询条件,得到结果集
        StoreDao md=new StoreDao();
				  md.updateStoretj(ID1,0); 
		  String showPage = request.getParameter("toPage");
		  String sqlWhere = request.getParameter("toWhere");
        /****************************************/
       
		if(tj!=null){
%>
<SCRIPT>alert("取消推荐置顶！");</SCRIPT>
<meta http-equiv="refresh"content="0;url=store.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
<%
 }
}
}
}
%>
