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


<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
</head>
<body>
<table width=100% border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
  <tbody>
    <tr>
      <th align=center colspan=9 style="height: 23px">�߽�������ѧϰչʾ����</th>
    </tr>
    <tr bgcolor="#DEE5FA">
      <td colspan="9" align="right" class=txlrow><a href="store_add.jsp"><font color=red>����µص�</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="big.jsp" style="display:none;"><font color=red>�鿴��Ʒ���</font></a></td>
    </tr>
    <tr align="center" bgcolor="#799AE1">
      <td width="12%" align="center" class="txlHeaderBackgroundAlternate" >һ������</td>
      <td width="15%" align="center" class="txlHeaderBackgroundAlternate">�ص�����</td>
      <td width="15%" align="center" class="txlHeaderBackgroundAlternate">�ص��ַ</td>
      <td width="20%" align="center" class=txlHeaderBackgroundAlternate>ͼƬ</td>
     <td width="15%" align="center" class=txlHeaderBackgroundAlternate>�ص����򣨴�С��������</td>  
     <td width="5%" align="center" class=txlHeaderBackgroundAlternate>�Ƽ��ö�</td>
     <td width="5%" align="center" class=txlHeaderBackgroundAlternate>���ۼ�Ȩ</td>			  
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
 StoreDao md1=new StoreDao();  
	     Store m=new Store();  
	    List l1=null;  
	     l1=(List) md1.findStore(); 
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
	      m=(Store)i.next(); 
	      String LNAME="";
	      if(m.getLid()==1){
	      LNAME="�߽�����������ص�";
	      } if(m.getLid()==2){
	       LNAME="�߽���ѧϰ����ص�";
	      } if(m.getLid()==3){
	       LNAME="�߽�����������ص�";
	      }  if(m.getLid()==4){ LNAME="�߽�����������ص�";} 
	    
  
  %>
  <tr bgcolor="#DEE5FA">
    <td align="center" class="txlrow"  ><%=LNAME %> </td>
    <td align="center" class="txlrow">&nbsp;<%=m.getStorename()%></td>
     <td align="center" class="txlrow">&nbsp;<%=m.getAddress()%></td>
    <td align=center class=txlrow >&nbsp;<img src="<%=m.getPhoto()%>" width=100 height="100"></A></td>
	<form name="pxfrom" action="stpx_modify1.jsp?id=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&LID=<%=m.getLid()%>" method="post">
	<td align="center" class="txlrow" >&nbsp;<input value="<%=m.getPx()%>" name="px" size="4">
	<input type="submit" name="pxsubmit" value="�޸�"></td></form>
	 <td align="center" class="txlrow" style="display:none">&nbsp;
	 </td>
	 <td align="center" class="txlrow">
	 <%if(m.getTj().equals("0")){%>
	 <a  href="sttjsy_audit.jsp?id=<%=m.getSid()%>&tj=<%=m.getTj()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&LID=<%=m.getLid()%>">
	 <img src="images/no.gif" border="0"></a>
	 <%}else if(m.getTj().equals("1")){%>
	 <a  href="sttjsy_audit.jsp?id=<%=m.getSid()%>&tj=<%=m.getTj()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&LID=<%=m.getLid()%>">
	 <img src="images/OK.gif" border="0"></a><%}%></td>
	 <td align="center" class="txlrow" ><A class=cpxl 
                  href="store_comment.jsp?PID=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&LID=<%=m.getLid()%>" 
                  ><font color=red>�鿴</font></A> 
	 </td>
    <td width="9%" align=center class=txlrow><A class=cpxl 
                  href="store_modify.jsp?PID=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&LID=<%=m.getLid()%>" 
                  ><font color=red>�޸�</font></A> </td>
    <td width="10%" align=center class=txlrow><A class=cpxl 
                  href="store_delete.jsp?PID=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&LID=<%=m.getLid()%>" 
                  onClick="del('������¼')"><font color=red>ɾ��</font></A> </td>
  </tr>
  <%/******************************************************************/
      maxNumber=maxNumber+1;
}%>
  <tr bgcolor="#DEE5FA">
    <td colspan=9 align=center class=txlrow><table width=98%>
        <tr>
          <td align=center><font size=2>��<font color=red><%=recount%></font>����¼��
            <!--��ǰ�ǵ�<%=showPage%>ҳ-->
            </font></td>
          <td align=center><font size=2> <a href="store.jsp?toPage=1&toWhere=<%=sqlWhere%>"><font color=red>��ҳ</font></a> 
          <a href="store.jsp?toPage=<%=showPage-1%>&toWhere=<%=sqlWhere%>"><font color=red>��һҳ</font></a> 
          <a href="store.jsp?toPage=<%=showPage+1%>&toWhere=<%=sqlWhere%>"><font color=red>��һҳ</font></a>
           <a href="store.jsp?toPage=<%=pageCount%>&toWhere=<%=sqlWhere%>"><font color=red>βҳ</font></a> </font> </td>
          <td align=center><font size=2>��<%=showPage%>/<%=pageCount%>ҳ</font></td>
          <form name="form1" action="store.jsp?toWhere=<%=sqlWhere%>" method="post" onSubmit="return errorCheck();">
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
