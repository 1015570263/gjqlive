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


<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
</head>
<body>
<table width=100% border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
  <tbody>
    <tr>
      <th align=center colspan=8 style="height: 23px">ѧУ��Ϣչʾ����</th>
    </tr>
    <tr bgcolor="#DEE5FA">
      <td colspan="8" align="right" class=txlrow><a href="product_add.jsp"><font color=red>�����ѧУ</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="big.jsp" style="display:none;"><font color=red>�鿴��Ʒ���</font></a></td>
    </tr>
    <tr align="center" bgcolor="#799AE1">
      <td width="18%" align="center" class="txlHeaderBackgroundAlternate" style="display:none;">һ������</td>
      <td width="20%" align="center" class="txlHeaderBackgroundAlternate">ѧУ����</td>
      <td width="20%" align="center" class="txlHeaderBackgroundAlternate">ѧУ�ص�</td>
      <td width="20%" align="center" class=txlHeaderBackgroundAlternate>ͼƬ</td>
     <td width="15%" align="center" class=txlHeaderBackgroundAlternate>ѧУ���򣨴�С��������</td>  
     <td width="10%" align="center" class=txlHeaderBackgroundAlternate>�Ƽ��ö�</td>		  
      <td align="center" colspan=2 class=txlHeaderBackgroundAlternate>����</td>
    </tr>
   
  <center>
  
  <%
/*********************��������޸�pageSize��ֵ******************/
  int pageSize=10;  //*********ÿҳ��ʾ�ļ�¼��************//
  int recount=0;   //*********�ܼ�¼��*******************//
  int showPage=1;  //*********��ǰ��ʾ��ҳ��**************//
  int pageCount=0; //*********��ҳ��*********************//
  int maxNumber=1;   //*********���***********************//
  int temp;
  java.util.ArrayList rs=new java.util.ArrayList();
  String queryStr=null;
  String sqlWhere="";
  //String toWhere="";
  String toWhere=request.getParameter("toWhere");
    
/*******************��ѯ��������*************************/
/********************((((��Ҫ�޸�))))*************************/
 

/*******************************************************************/
/*******************************************************************/
 
  //out.print("<br>"+sqlWhere);
/***************��Ҫ�޸����ݱ���************************************/
/*****************************************************************/
 
	//*************�ܼ�¼��**************//
 UserDao md1=new UserDao();  
	     School m=new School();  
	    List l1=null;  
	     l1=(List) md1.findSchool(); 
	     recount = l1.size();
	if(recount%pageSize==0){
		pageCount=recount/pageSize;
	}else{
		pageCount=(recount/pageSize)+1;
	}

	//*******���ݵ�ǰҳ��********//
	String toPage=request.getParameter("toPage"); 

	if(toPage!=null){
		
		showPage=Integer.parseInt(toPage);

		if(showPage>pageCount){
			showPage=pageCount;
		}else if(showPage<=0){
			showPage=1;
		}
	}

	if(request.getParameter("go")!=null){
		
		temp=Integer.parseInt(request.getParameter("go"));
		showPage=temp;

		if(temp>pageCount){
			showPage=pageCount;
		}else if(temp<=0){
			showPage=1;
		}
	}
	//**************�õ���¼��***************************//
	
	//rs=db.getList(queryStr,showPage,pageSize);
	//System.out.println(queryStr);
%>
  <%
//***************************************************//
//***************************************************//

  maxNumber=(showPage-1)*pageSize+1; //****��ǰҳ����С��¼���****//
   
	     if(l1.size()>9){  
	     l1.subList(showPage*10-10,showPage*10-1);
	     }
	     Iterator i=((java.util.List) l1).iterator();  
	     
	     while(i.hasNext()){  
	      m=(School)i.next();  
	    
  
  %>
  <tr bgcolor="#DEE5FA">
    <td align="center" class="txlrow"  style="display:none;"> </td>
    <td align="center" class="txlrow">&nbsp;<%=m.getName()%></td>
     <td align="center" class="txlrow">&nbsp;<%=m.getSaddress()%></td>
    <td align=center class=txlrow >&nbsp;<img src="<%=m.getSic()%>" width=100 height="100"></A></td>
	<form name="pxfrom" action="hypx_modify1.jsp?id=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&PID=<%=m.getSid()%>" method="post">
	<td align="center" class="txlrow" >&nbsp;<input value="<%=m.getPx()%>" name="px" size="4">
	<input type="submit" name="pxsubmit" value="�޸�"></td></form>
	 <td align="center" class="txlrow" style="display:none">&nbsp;
	 </td>
	 <td align="center" class="txlrow">&nbsp;
	 <%if(m.getTj().equals("0")){%>
	 <a  href="tjsy_audit.jsp?id=<%=m.getSid()%>&tj=<%=m.getTj()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
	 <img src="images/no.gif" border="0"></a>
	 <%}else if(m.getTj().equals("1")){%>
	 <a  href="tjsy_audit.jsp?id=<%=m.getSid()%>&tj=<%=m.getTj()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
	 <img src="images/OK.gif" border="0"></a><%}%></td>
    <td width="9%" align=center class=txlrow><A class=cpxl 
                  href="product_modify.jsp?PID=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>" 
                  ><font color=red>�޸�</font></A> </td>
    <td width="10%" align=center class=txlrow><A class=cpxl 
                  href="product_delete.jsp?PID=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>" 
                  onClick="del('������¼')"><font color=red>ɾ��</font></A> </td>
  </tr>
  <%/******************************************************************/
      maxNumber=maxNumber+1;
}%>
  <tr bgcolor="#DEE5FA">
    <td colspan=8 align=center class=txlrow><table width=98%>
        <tr>
          <td align=center><font size=2>��<font color=red><%=recount%></font>����¼��
            <!--��ǰ�ǵ�<%=showPage%>ҳ-->
            </font></td>
          <td align=center><font size=2> <a href="product.jsp?toPage=1&toWhere=<%=sqlWhere%>"><font color=red>��ҳ</font></a> 
          <a href="product.jsp?toPage=<%=showPage-1%>&toWhere=<%=sqlWhere%>"><font color=red>��һҳ</font></a> 
          <a href="product.jsp?toPage=<%=showPage+1%>&toWhere=<%=sqlWhere%>"><font color=red>��һҳ</font></a>
           <a href="product.jsp?toPage=<%=pageCount%>&toWhere=<%=sqlWhere%>"><font color=red>βҳ</font></a> </font> </td>
          <td align=center><font size=2>��<%=showPage%>/<%=pageCount%>ҳ</font></td>
          <form name="form1" action="product.jsp?toWhere=<%=sqlWhere%>" method="post" onSubmit="return errorCheck();">
            <td align=center><font size=2>ת��
              <input type="text" name="go" size=4 maxlength=4 >
              ҳ
              <input type="submit" name="submit1" value="ת��" class="input_02">
              </font> </td>
          </form>
        </tr>
      </table></td>
  </tr>
  </tbody>
</table>
</BODY>
</HTML>
