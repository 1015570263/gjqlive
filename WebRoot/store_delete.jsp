<%@page language="java" contentType="text/html;charset=gb2312"%>
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
<%@page import="com.li.dao.*"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<html>
<%
        String PID = request.getParameter("PID");
        int ID1 = Integer.parseInt(PID);
		String toWhere=request.getParameter("toWhere");
		String toPage=request.getParameter("toPage");
        if(PID.equals("")){//id为空
%>
<SCRIPT>
alert("传数为空！");
history.back();
</SCRIPT>


<%
        }//id为空
        else{//id不为空
            /*********需要替换***********/
           StoreDao md1=new StoreDao(); 
           md1.removeStore(ID1);
%>
<SCRIPT>alert("删除成功！");</SCRIPT>
<meta http-equiv="refresh" content="0;url=store.jsp?toPage=<%=toPage%>&toWhere=<%=toWhere%>">
<%
        }//id不为空
%>

</html>
