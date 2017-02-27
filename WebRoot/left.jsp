<%@page language="java" contentType="text/html;charset=gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>管理页面</TITLE>
		<STYLE type=text/css>
BODY {
	BACKGROUND: #799ae1;
	MARGIN: 0px;
	FONT: 9pt 宋体
}

TABLE {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 0px
}

TD {
	FONT: 12px 宋体
}

IMG {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	VERTICAL-ALIGN: bottom;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 0px
}

A {
	FONT: 12px 宋体;
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #428eff;
	TEXT-DECORATION: underline
}

.sec_menu {
	BORDER-RIGHT: white 1px solid;
	BACKGROUND: #d6dff7;
	OVERFLOW: hidden;
	BORDER-LEFT: white 1px solid;
	BORDER-BOTTOM: white 1px solid
}

.menu_title {
	
}

.menu_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 7px;
	COLOR: #215dc6;
	POSITION: relative;
	TOP: 2px
}

.menu_title2 {
	
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 8px;
	COLOR: #428eff;
	POSITION: relative;
	TOP: 2px
}
</STYLE>
		<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2900.2180" name=GENERATOR>
	</HEAD>
	<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
		<TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0>
			<TBODY>
				<TR>
					<TD vAlign=top bgColor=#799ae1>
						<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
							<TBODY>
								<TR>
									<TD vAlign=bottom height=42>
										<IMG height=38 src="images/title.gif" width=158>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
							<TBODY>
								<TR>
									<TD height=25>
										&nbsp;
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
							<TBODY>
								<TR>
									<TD class=menu_title id=menuTitle1
										onMouseOver="this.className='menu_title2';"
										onclick=showsubmenu(2)
										onMouseOut="this.className='menu_title';"
										background=images/admin_left_2.gif height=25>
										<SPAN>后台管理</SPAN>
									</TD>
								</TR>
								<TR>
									<TD id=submenu2>
										<DIV class=sec_menu style="WIDTH: 158px">
											<TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
												<TBODY>
													<TR>
														<TD height=20>
															<a href="about.jsp?id=1" target=mainFrame>高教区生活助手简介</a>
														</TD>
													</TR>
													<TR>
														<TD height=20>
															<a href="news.jsp?type=1" target=mainFrame>高教区生活助手资讯推送</a>
														</TD>
													</TR>
													<TR>
														<TD height=20>
															<a href="product.jsp?type=1" target=mainFrame>高教区学校信息展示</a>
														</TD>
													</TR>
													<TR>
														<TD height=20>
															<a href="store.jsp" target=mainFrame>高教区生活学习信息展示</a>
														</TD>
													</TR>
													<TR style="display:none;">
														<TD height=20>
															<a href="product.jsp?type=1" target=mainFrame>高教区地点店铺评论信息</a>
														</TD>
													</TR>

													<TR>
														<TD height=20>
															<a href="ly.jsp" target=mainFrame>在线留言</a>
														</TD>
													</TR>
													<TR>
														<TD height=20>
															<a href="about.jsp?id=2" target=mainFrame>联系我们</a>
														</TD>
													</TR>

													
													<TR >
														<TD height=20>
															<a href="link.jsp" target=mainFrame>友情链接</a>
														</TD>
													</TR>
													<TR>
														<TD height=20>
															<a href="passwordmodify.jsp" target="mainFrame">修改密码</a>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
									</td>
								</tr>
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		</td>
		</TR>
		</TBODY>
		</TABLE>
	</BODY>
</HTML>