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
<%@page import="com.li.entity.Comment"%>
<%@page import="com.li.dao.*;"%>
<%
      String PID = request.getParameter("PID");
      int ID1 = Integer.parseInt(PID);
      String showPage1 = request.getParameter("toPage");
      String sqlWhere1 = request.getParameter("toWhere");
	  java.util.ArrayList rs = new java.util.ArrayList();
      java.util.Hashtable hash = new java.util.Hashtable();
%>

<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
</head>
<body>
<table width=100% border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
  <tbody>
    <tr>
      <th align=center colspan=4 style="height: 23px">评论加权展示管理</th>
    </tr>
     <tr bgcolor="#DEE5FA">
      <td colspan="4" align="right" class=txlrow><a href="store.jsp?toPage=<%=showPage1%>&toWhere=<%=sqlWhere1%>"><font color=red>返回上一级页面</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="big.jsp" style="display:none;"><font color=red>查看产品类别</font></a></td>
    </tr>
    <tr align="center" bgcolor="#799AE1">
      <td width="15%" align="center" class="txlHeaderBackgroundAlternate">地点名称</td>
       <td width="5%" align="center" class="txlHeaderBackgroundAlternate">加权</td>
      <td width="75%" align="center" class="txlHeaderBackgroundAlternate">评论内容</td>			  
      <td width="5%" align="center" colspan=1 class=txlHeaderBackgroundAlternate>操作</td>
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
 StoreDao md1=new StoreDao();  
	     Comment m=new Comment();
	     Store s=new Store();
	     s=md1.findStoreById(ID1);  
	    List l1=null;  
	     l1=(List) md1.findCommentBySid(ID1); 
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
	      m=(Comment)i.next(); 
	    
  
  %>
  <tr bgcolor="#DEE5FA">
    <td align="center" class="txlrow">&nbsp;<%=s.getStorename()%></td>
     <td align="center" class="txlrow">&nbsp;<%=s.getSumm()%></td>
     <td align="center" class="txlrow">&nbsp;<%=m.getComment()%></td>
    <td width="20%" align=center class=txlrow><A class=cpxl 
                  href="store_comment_delete.jsp?PID=<%=m.getCid()%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>&SID=<%=PID%>" 
                  onClick="del('此条记录')"><font color=red>删除</font></A> </td>
  </tr>
  <%/******************************************************************/
      maxNumber=maxNumber+1;
}%>
  <tr bgcolor="#DEE5FA">
    <td colspan=9 align=center class=txlrow><table width=98%>
        <tr>
          <td align=center><font size=2>共<font color=red><%=recount%></font>条记录，
            <!--当前是第<%=showPage%>页-->
            </font></td>
          <td align=center><font size=2 > <a href="store_comment.jsp?toPage=1&toWhere=<%=sqlWhere%>"><font color=red>首页</font></a> 
          <a href="store_comment.jsp?toPage=<%=showPage-1%>&toWhere=<%=sqlWhere%>"><font color=red>上一页</font></a> 
          <a href="store_comment.jsp?toPage=<%=showPage+1%>&toWhere=<%=sqlWhere%>"><font color=red>下一页</font></a>
           <a href="store_comment.jsp?toPage=<%=pageCount%>&toWhere=<%=sqlWhere%>"><font color=red>尾页</font></a> </font> </td>
          <td align=center><font size=2>第<%=showPage%>/<%=pageCount%>页</font></td>
          <form name="form1" action="store_comment.jsp?toWhere=<%=sqlWhere%>" method="post" onSubmit="return errorCheck();">
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
