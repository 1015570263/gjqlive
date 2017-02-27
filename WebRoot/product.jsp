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
      <th align=center colspan=8 style="height: 23px">学校信息展示管理</th>
    </tr>
    <tr bgcolor="#DEE5FA">
      <td colspan="8" align="right" class=txlrow><a href="product_add.jsp"><font color=red>添加新学校</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="big.jsp" style="display:none;"><font color=red>查看产品类别</font></a></td>
    </tr>
    <tr align="center" bgcolor="#799AE1">
      <td width="18%" align="center" class="txlHeaderBackgroundAlternate" style="display:none;">一级分类</td>
      <td width="20%" align="center" class="txlHeaderBackgroundAlternate">学校名称</td>
      <td width="20%" align="center" class="txlHeaderBackgroundAlternate">学校地点</td>
      <td width="20%" align="center" class=txlHeaderBackgroundAlternate>图片</td>
     <td width="15%" align="center" class=txlHeaderBackgroundAlternate>学校排序（从小到大排序）</td>  
     <td width="10%" align="center" class=txlHeaderBackgroundAlternate>推荐置顶</td>		  
      <td align="center" colspan=2 class=txlHeaderBackgroundAlternate>操作</td>
    </tr>
   
  <center>
  
  <%
/*********************根据情况修改pageSize的值******************/
  int pageSize=10;  //*********每页显示的记录数************//
  int recount=0;   //*********总记录数*******************//
  int showPage=1;  //*********当前显示的页数**************//
  int pageCount=0; //*********总页数*********************//
  int maxNumber=1;   //*********序号***********************//
  int temp;
  java.util.ArrayList rs=new java.util.ArrayList();
  String queryStr=null;
  String sqlWhere="";
  //String toWhere="";
  String toWhere=request.getParameter("toWhere");
    
/*******************查询条件处理*************************/
/********************((((需要修改))))*************************/
 

/*******************************************************************/
/*******************************************************************/
 
  //out.print("<br>"+sqlWhere);
/***************需要修改数据表名************************************/
/*****************************************************************/
 
	//*************总记录数**************//
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

	//*******传递当前页数********//
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
	//**************得到记录集***************************//
	
	//rs=db.getList(queryStr,showPage,pageSize);
	//System.out.println(queryStr);
%>
  <%
//***************************************************//
//***************************************************//

  maxNumber=(showPage-1)*pageSize+1; //****当前页的最小记录序号****//
   
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
	<input type="submit" name="pxsubmit" value="修改"></td></form>
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
                  ><font color=red>修改</font></A> </td>
    <td width="10%" align=center class=txlrow><A class=cpxl 
                  href="product_delete.jsp?PID=<%=m.getSid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>" 
                  onClick="del('此条记录')"><font color=red>删除</font></A> </td>
  </tr>
  <%/******************************************************************/
      maxNumber=maxNumber+1;
}%>
  <tr bgcolor="#DEE5FA">
    <td colspan=8 align=center class=txlrow><table width=98%>
        <tr>
          <td align=center><font size=2>共<font color=red><%=recount%></font>条记录，
            <!--当前是第<%=showPage%>页-->
            </font></td>
          <td align=center><font size=2> <a href="product.jsp?toPage=1&toWhere=<%=sqlWhere%>"><font color=red>首页</font></a> 
          <a href="product.jsp?toPage=<%=showPage-1%>&toWhere=<%=sqlWhere%>"><font color=red>上一页</font></a> 
          <a href="product.jsp?toPage=<%=showPage+1%>&toWhere=<%=sqlWhere%>"><font color=red>下一页</font></a>
           <a href="product.jsp?toPage=<%=pageCount%>&toWhere=<%=sqlWhere%>"><font color=red>尾页</font></a> </font> </td>
          <td align=center><font size=2>第<%=showPage%>/<%=pageCount%>页</font></td>
          <form name="form1" action="product.jsp?toWhere=<%=sqlWhere%>" method="post" onSubmit="return errorCheck();">
            <td align=center><font size=2>转到
              <input type="text" name="go" size=4 maxlength=4 >
              页
              <input type="submit" name="submit1" value="转到" class="input_02">
              </font> </td>
          </form>
        </tr>
      </table></td>
  </tr>
  </tbody>
</table>
</BODY>
</HTML>
