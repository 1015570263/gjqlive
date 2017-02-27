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

	<link rel="stylesheet" href="../themes/default/default.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor-min.js"></script>
	<script charset="utf-8" src="../lang/zh_CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>
	<script charset="utf-8" src="../showEditor.js"></script>
	
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
      String PID = request.getParameter("PID");
      int ID1 = Integer.parseInt(PID);
      String showPage = request.getParameter("toPage");
      String sqlWhere = request.getParameter("toWhere");
	  java.util.ArrayList rs = new java.util.ArrayList();
      java.util.Hashtable hash = new java.util.Hashtable();
    if(PID.equals("")){
%>
<script>
		alert("请检查数据！");
		history.back();
		</script>
<%
    }
    else{
        /**
         * 查询数据库记录
         */
        UserDao md=new UserDao();  
	     School m=new School();  
	     m=md.findSchoolById(ID1);

        /**
         * 定义与数据表相对应的变量
         */

        String NAME = "";
		String SADDRESS = "";
		String BADDRESS="";
		String LADDRESS="";
		String SCONTENT="";
		String attach = "";

        if (m==null){
%>
<script>
		alert("请检查数据！");
		history.back();
		</script>
<%
        }
        else{
			NAME = m.getName();
			SADDRESS = m.getSaddress();
			attach = m.getSic();
			BADDRESS=m.getBaddress();
			LADDRESS=m.getLaddress();
			SCONTENT=m.getContent();
        }
		
%>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
<META content="MSHTML 6.00.2900.2627" name=GENERATOR>
</head>
<body>
<form name=modify method="post" action="product_modify_submit.jsp?PID=<%=PID%>&toPage=<%=showPage%>&toWhere=<%=sqlWhere%>" onSubmit="return errorCheck();" ENCTYPE="multipart/form-data">
  <table width=100% border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=2 style="height: 23px">学校展示管理</th>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td colspan="2" align="center" class=txlrow>&nbsp;</td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">学校名称：</td>
        <td align=left class=txlrow><INPUT size=40 name=NAME value="<%=NAME%>" id="title"></td>
      </tr>
       <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">学校地点：</td>
        <td align=left class=txlrow><INPUT size=40 name=SADDRESS value="<%=SADDRESS%>" id="title"></td>
      </tr>
       <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">学校学籍报告地点：</td>
        <td align=left class=txlrow><INPUT size=40 name=BADDRESS value="<%=BADDRESS%>" id="title"></td>
      </tr>
       <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">学校住宿报告地点：</td>
        <td align=left class=txlrow><INPUT size=40 name=LADDRESS value="<%=LADDRESS%>" id="title"></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow"> 现有图片：<br>
        </td>
        <td align=left class=txlrow><%
            if (attach.trim().equals("")){
                out.println("无");
            }
            else{
                String file = "";//记录附件信息
                //String filename = "";//文件名
                java.util.StringTokenizer st =
                        new java.util.StringTokenizer(attach, " ");
                while(st.hasMoreTokens()){
                    file = st.nextToken();
                    System.out.println(file);
                    //取文件名
                    //index = file.lastIndexOf("/");
                    //filename = file.substring(index + 1, file.length());
        %>
         
          <img src="<%=file%>" width=250 height=250>&nbsp;
          <%
                }
            }
        %>
        </td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow"> 新图片：<br>
        </td>
        <td align=left class=txlrow><input type="file" name="samllfile" disabled>
          <input type="checkbox" name="isModifyFile" value="modify" onClick="javascript:document.modify.samllfile.disabled=!(document.modify.isModifyFile.checked)">
          是否修改图片(选中代表是) </td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">内容：</td>
        <td align=left class=txlrow><TEXTAREA name="content" id="content1" rows=28 wrap=VIRTUAL cols=125><%=htmlspecialchars(SCONTENT)%></TEXTAREA>
        </td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">&nbsp;</td>
        <td align=left class=txlrow>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" name="submit" value="保存" onClick="javascript:return errorcheck();">
          &nbsp;&nbsp;
          <input type="reset" name="reset" value="重填" ></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td colspan=2 align=center class=txlrow></td>
      </tr>
      <script language="javascript">
function $(id){return document.getElementById(id);}
//调用getCity(provinceID)
function selectCity(provinceID,spanID,type,selectedValue){getCity($(provinceID).value,spanID,type,selectedValue);}
//获取city下拉菜单
function getCity(provinceID,spanID,type,selectedValue)
{
var req=getAjax();
req.open("POST","ajax_getCity.jsp?provinceID="+provinceID+"&type="+type+"&selectedValue="+selectedValue,true);
req.onreadystatechange=function(){
if(req.readyState==4){
var content=req.responseText;
$(spanID).innerHTML=content;
}
}
req.send(null);
}

function getAjax()
{
var obj=null;
if(window.ActiveXObject)
obj=new ActiveXObject("MSXML2.XMLHTTP");
else if(window.createRequest)
obj=window.createRequest();
else 
obj=new XMLHttpRequest();
return obj;
}
</script>
    </tbody>
  </table>
</form>
<script charset="utf-8" src="../kindeditor.js"></script>
<script type="text/javascript">
KE.show({id:'content1'});
</script>
<script language="javascript" type="text/javascript">
function $(id){return document.getElementById(id);}
function trimTxt(txt)
{
   //t.replace(/(^\s*)|(\s*$)/g, "");
   //t.replace(/^\s+|\s+$/g,"");  去除左右空格
   return txt.replace(/(^\s*)|(\s*$)/g, "");
}

//检查是否为空
function isEmpty(inputId)
{
   if(trimTxt($(inputId).value)=='' || trimTxt($(inputId).value)=='null' || trimTxt($(inputId).value)==null){return true}
   return false;
}

function errorcheck()
{   
   
	if(isEmpty("title")){
      	alert("名称不能为空!");
		return false;
	}
	else{
        
		$('modify').submit();
		return true;
	}	
}
</script>
</BODY>
</HTML>
<%}%>
