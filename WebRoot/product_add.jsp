<%@page language="java" contentType="text/html;charset=gb2312"%>

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


<%java.util.ArrayList rs = new java.util.ArrayList();
  java.util.Hashtable hash = new java.util.Hashtable();
%>
<html>
<head>
<link rel="stylesheet" href="inc/css.css" type="text/css" />
<META content="MSHTML 6.00.2900.2627" name=GENERATOR>
</head>
<body>
<form name=insert method="post" action="product_add_submit.jsp" onSubmit="return errorCheck();"
ENCTYPE="multipart/form-data">
  <table width=100% border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class=tableBorder>
    <tbody>
      <tr>
        <th align=center colspan=2 style="height: 23px">ѧУչʾ����</th>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td colspan="2" align="center" class=txlrow>&nbsp;</td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">ѧУ����:</td>
        <td align=left class=txlrow><INPUT size=40 name=NAME  id="title"></td>
      </tr>
     <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">ѧУ��ַ:</td>
        <td align=left class=txlrow><INPUT size=40 name=SADDRESS  id="title"></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">ѧУѧ�������ַ:</td>
        <td align=left class=txlrow><INPUT size=40 name=BADDRESS  id="title"></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">ѧУס�ޱ����ַ:</td>
        <td align=left class=txlrow><INPUT size=40 name=LADDRESS  id="title"></td>
      </tr>
      <TR bgcolor="#DEE5FA">
        <TD align="center" class="txlrow">ͼ&nbsp;&nbsp;&nbsp;&nbsp;Ƭ:<FONT 
	  color=#ff0000></FONT></TD>
        <TD align=left class=txlrow><input type="file" name="samllfile">
        </TD>
      </TR>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">˵&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
        <td align=left class=txlrow><TEXTAREA name="content" id="content1" rows=28 wrap=VIRTUAL cols=125></TEXTAREA>
        </td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td align="center" class="txlrow">&nbsp;</td>
        <td align=left class=txlrow>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <INPUT type=submit value=�ύ name=Submit onClick="javascript:return errorcheck();"></td>
      </tr>
      <tr bgcolor="#DEE5FA">
        <td colspan=2 align=center class=txlrow></td>
      </tr>
      
    </tbody>
  </table>
</form>
<script language="javascript" type="text/javascript">
function $(id){return document.getElementById(id);}
function trimTxt(txt)
{
   //t.replace(/(^\s*)|(\s*$)/g, "");
   //t.replace(/^\s+|\s+$/g,"");  ȥ�����ҿո�
   return txt.replace(/(^\s*)|(\s*$)/g, "");
}

//����Ƿ�Ϊ��
function isEmpty(inputId)
{
   if(trimTxt($(inputId).value)=='' || trimTxt($(inputId).value)=='null' || trimTxt($(inputId).value)==null){return true}
   return false;
}

function errorcheck()
{   
   
	if(isEmpty("title")){
      	alert("���Ʋ���Ϊ��!");
		return false;
	}
	else{
        
		$('insert').submit();
		return true;
	}	
}
</script>
</BODY>
</HTML>
