<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>高教区生活助手后台登录</TITLE>
		<META http-equiv=Content-Language content=zh-cn>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<SCRIPT language=JavaScript src="login_images/basic_type.js"></SCRIPT>
		<SCRIPT language=JavaScript src="login_images/common_form.js"></SCRIPT>
		<SCRIPT language=JavaScript src="login_images/common_prima.js"></SCRIPT>

		<SCRIPT language=JavaScript src="login_images/detect_browser.js"></SCRIPT>

		<SCRIPT language=JavaScript>
	<!--


		function fn_CheckParameters ( theForm )
		{
			if ( ! fn_CheckRequired ( theForm.username , "账号" ) )
				return (false) ;

			if ( ! fn_CheckRequired ( theForm.password , "密码" ) )
				return (false) ;

    		if ( theForm.verifycode && ! fn_CheckRequired ( theForm.verifycode , "验证码" ) )
    		{
    		    return false;
    		}
			theForm.login.value = theForm.username.value + "@" + theForm.domain.value;
		    if ( login_td != null )
		    {
		        login_td.innerHTML = "正在登录..." ;
		    }
			return true;
		}

	//-->
	</SCRIPT>
		<LINK id=style_sheet href="login_images/primacommonstyle.css"
			type=text/css rel=stylesheet>
		<META content="MSHTML 6.00.6000.16640" name=GENERATOR>
	</HEAD>
	<BODY>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<TABLE height="30%" cellSpacing=0 cellPadding=0 width="100%"
			bgColor=#ffffff border=0>
			<FORM id=frm_login name=frm_login
				onsubmit="JavaScript:return fn_CheckParameters(this);"
				action="${pageContext.request.contextPath}/login.do" method=post>
				<INPUT type=hidden value=1 name=dologin>
				<INPUT type=hidden name=login>
				<TBODY>
					<TR>
						<TD vAlign=center noWrap align=middle width="100%" height="100%">
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
									<TR>
										<TD>
											<TABLE height=59 cellSpacing=0 cellPadding=0 width=611
												align=center border=0>
												<TBODY>
													<TR>
														<TD width=34 rowSpan=2>
															<IMG height=59 src="login_images/top-1.gif" width=34>
														</TD>
														<TD height=15>
															<IMG height=15 src="login_images/top-2.gif" width=537>
														</TD>
														<TD width=40 rowSpan=2>
															<IMG height=59 src="login_images/top-3.gif" width=40>
														</TD>
													</TR>
													<TR>
														<TD bgColor=#e8e8e8 height=44>
															<TABLE cellSpacing=0 cellPadding=0 width=537 border=0>
																<TBODY>
																	<TR>
																		<TD width=200 height=44>
																			&nbsp;
																		</TD>
																		<TD width=137 height=44>
																			&nbsp;
																		</TD>
																		<TD align=right width=200 height=44>
																			&nbsp;
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD background=login_images/cplogin_bg.gif>
											<TABLE height=294 cellSpacing=0 cellPadding=0 width=611
												align=center border=0>
												<TBODY>
													<TR>
														<TD vAlign=top width=611
															background=login_images/middle-bg.gif height=294>
															<TABLE cellSpacing=0 cellPadding=0 width=611 border=0>
																<TBODY>
																	<TR>
																		<TD width=110 height=52>
																			&nbsp;
																		</TD>
																		<TD vAlign=bottom width=501 height=52>
																			<IMG height=40 src="login_images/controlpanel.gif"
																				width=130>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
															<TABLE cellSpacing=0 cellPadding=0 width=611 border=0>
																<TBODY>
																	<TR>
																		<TD width=311 height=11>
																			&nbsp;
																		</TD>
																		<TD vAlign=top width=300 height=93>
																			<TABLE cellSpacing=0 cellPadding=0 width=260 border=0>
																				<TBODY>
																					<TR>
																						<TD align=middle width=30 height=24>
																							<IMG src="login_images/cplogin_user.gif">
																						</TD>
																						<TD style="FONT-SIZE: 12px; COLOR: #034491"
																							width=60>
																							账&nbsp;&nbsp;号：
																						</TD>
																						<TD>
																							<INPUT class=solidinput size=16 value=""
																								name=username>
																						</TD>
																					</TR>
																					<!-- <TR>
                            <TD align=middle width=30 height=27><IMG 
                              src="login_images/cplogin_domain.gif"></TD>
                            <TD style="FONT-SIZE: 12px; COLOR: #034491" 
                              width=60>域&nbsp;&nbsp;名：</TD>
                            <TD><INPUT class=solidinput size=16 
                          name=domain></TD></TR>-->
																					<TR>
																						<TD align=middle width=30 height=27>
																							<IMG src="login_images/cplogin_password.gif">
																						</TD>
																						<TD style="FONT-SIZE: 12px; COLOR: #034491"
																							width=60>
																							密&nbsp;&nbsp;码：
																						</TD>
																						<TD>
																							<INPUT class=solidinput type=password size=16
																								name=password>
																						</TD>
																					</TR>
																					<TR>

																						
																					</TR>
																				</TBODY>
																			</TABLE>
																		</TD>
																	</TR>
																	<TR>
																		<TD height=25>
																			&nbsp;
																		</TD>
																		<TD id=login_td align=middle height=25>
																			&nbsp;
																		</TD>
																	</TR>
																	<TR>
																		<TD width=311 height=10>
																			&nbsp;
																		</TD>
																		<TD id=login_td align=middle width=300 height=25>
																			<INPUT type=image
																				src="login_images/cplogin_login.gif" border=0>
																		</TD>
																	</TR>
																	<TR vAlign=bottom>
																		<TD colSpan=2 height=85>
																			<TABLE cellSpacing=0 cellPadding=0 width=611 border=0>
																				<TBODY>
																					<TR>
																						<TD width=520 height=40>
																							&nbsp;
																						</TD>
																						<TD width=81>
																							<!--<A class=staticlink 
                              href="#">忘记密码？</A>-->
																						</TD>
																					</TR>
																				</TBODY>
																			</TABLE>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
									<TR>
										<TD>
											&nbsp;
										</TD>
									</TR>
									<TR>
										<TD>
											&nbsp;
										</TD>
									</TR>
									<TR>
										<TD align=middle>
											&nbsp;
										</TD>
									</TR>
									<TR>
										<TD>
											&nbsp;
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
			</FORM>
			</TBODY>
		</TABLE>
		<SCRIPT language=JavaScript>
	var message = '';
	if ( message != "" )
		alert ( message ) ;
</SCRIPT>
	</BODY>
</HTML>