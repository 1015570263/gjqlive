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
<%@page import="com.li.dao.*;"%>
<%
    /**
     *���տ��ܵı�����Ϣ,�Կ���Ϊnull���ַ���������
     */         String ID = request.getParameter("id");
              int ID1 = Integer.parseInt(ID);
	            String PID =request.getParameter("PID"); 	 
			    String showPage = request.getParameter("toPage");
		        String sqlWhere = request.getParameter("toWhere");
				String submit = request.getParameter("pxsubmit");//���水ť��ֵ
				
				
				
				String PX =request.getParameter("px");	
				 int PX1 = Integer.parseInt(PX);		
								  StoreDao md=new StoreDao();
				  md.updateStorepx(ID1,PX1);  
				//System.out.println(sql);
				if (PX!=null){
%>
				<script>
				alert("�����޸ĳɹ�����¼�������·�ʽ����");
				</script>
				<meta http-equiv="refresh"content="0;url=store.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&PID=<%=PID%>">
<%
				}
				
			

%>