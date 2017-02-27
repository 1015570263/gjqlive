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
<%@page import="com.li.entity.School"%>
<%@page import="com.li.dao.*;"%>
<%
    /**
     *接收可能的保存信息,对可能为null的字符串作处理
     */         String ID = request.getParameter("id");
              int ID1 = Integer.parseInt(ID);
	            String PID =request.getParameter("PID"); 	 
			    String showPage = request.getParameter("toPage");
		        String sqlWhere = request.getParameter("toWhere");
				String submit = request.getParameter("pxsubmit");//保存按钮的值
				
				
				
				String PX =request.getParameter("px");	
				 int PX1 = Integer.parseInt(PX);		
								  UserDao md=new UserDao();
				  md.updateSchoolpx(ID1,PX1);  
				//System.out.println(sql);
				if (PX!=null){
%>
				<script>
				alert("排序修改成功，记录将以最新方式排序！");
				</script>
				<meta http-equiv="refresh"content="0;url=product.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&PID=<%=PID%>">
<%
				}
				
			

%>