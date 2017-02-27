<%@page language="java" contentType="text/html;charset=gbk"%>
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
<%@page import="com.li.dao.*"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>

<%
    /**
     * 文件上传类初始化
     */
     SmartUpload myUpload=new  SmartUpload();
    myUpload.initialize(pageContext);
    myUpload.upload();
    String submit = myUpload.getRequest().getParameter("submit");
	String LID = request.getParameter("PID");
	int ID1 = Integer.parseInt(LID);
    String showPage = request.getParameter("toPage");
    String sqlWhere = request.getParameter("toWhere");
    if (submit.equals("保存")){//修改信息
%>
<%--[接受提交的信息,如果id为空,说明出错,否则先删除已有附件,再重新更新信息]--%>
<%
        
      
        if(LID.equals("")){//PRID为空
%>
			<script>
			alert("请检查数据！");
			history.back();
			</script>
<%
        }//PRID为空
        else{//PRID不为空
            /**
             * 查询数据库记录
             */
            UserDao md=new UserDao();  
	     School m=new School();  
	     m=md.findSchoolById(ID1);
            /**
             * 定义与数据表相对应的变量
             */
            String attach = "";

            if (m==null){
%>
					<script>
					alert("取不到对应数据！");
					history.back();
					</script>
<%
            }
            else{
                attach = m.getSic();
            }
			
            /**********************需要修改的部分********************/
            /**
             * 接收提交信息
             */
			String NAME = myUpload.getRequest().getParameter("NAME");
			String SCONTENT = myUpload.getRequest().getParameter("content");
			String SADDRESS = myUpload.getRequest().getParameter("SADDRESS");
			String BADDRESS = myUpload.getRequest().getParameter("BADDRESS");
			String LADDRESS = myUpload.getRequest().getParameter("LADDRESS");
			SCONTENT = SCONTENT.replaceAll("'", "&acute;");	
			String isModifyFile = myUpload.getRequest().getParameter("isModifyFile");
			
            /**
             *格式化字符串
             */
            /********************************************************/
            if (isModifyFile!=null){

                /**
                 * 删除原有文件
                 */
                java.util.StringTokenizer st = new java.util.StringTokenizer(attach, " ");
                String file = "";
                java.io.File attachFile;

                while(st.hasMoreTokens()){
					file = st.nextToken();
                    file = request.getRealPath(file);
                    attachFile = new  java.io.File(file);
					
                    attachFile.delete();
                }
                attach = "";//清空附件内容

                /**
                 * 文件上传部分处理
                 * 需要判断文件大小，文件总和不超过800KB(850000B)
                 * 需要判断文件类型，不能是jsp,inc,css,class,java,
                 * xml,htm,html,js,asp
                 * 文件命名规则是：new Date().getTime()＋.文件自己的扩展名
                 */

                int maxFileSize = 850000; //根据实际大小定  //====》修改

                int filesCount = myUpload.getFiles().getCount();//得到上传文件个数
                long filesize = 0;//文件大小之和
                com.jspsmart.upload.File upFile; //当前文件
				int total_val=1;//定义全局判断上传文件类型.1为上传文件正确，0为上传错误
				//====》添加

                //能使用的扩展名
        		//String[] dontExtAry = {"asp", "xml", "htm", "html",
        		//         "class", "inc", "js","jsp","exe", "php", "aspx", "bat", "java", "css",
       			//         "sql", "ini", "properties"};
        		String[] dontExtAry = {"asp", "xml", "htm", "html", "css",
                "class", "inc", "js", "jsp", "asax","asp", "php", "aspx", "vbp", "bat", "java", "net",
                "sql", "ini", "exe", "cfg", "properties"};  //====》修改

                //当前文件的扩展名数组
                String[] ext = new String[filesCount];
                for(int i = 0; i < filesCount; i++){//依次检验每个文件

                    upFile = myUpload.getFiles().getFile(i);
                    String filename = upFile.getFileName();

                   // if (!filename.equals("")){//文件不为空 ====》修改

                        int upFileSize = upFile.getSize();
                        if (upFileSize == 0){
							total_val=0;//====》添加
%>
							<script>
							alert("上传的文件不能为空!");
							history.back();
							</script>
<%
                        }
						if(upFileSize>maxFileSize)
						{
							total_val=0;//====》添加
%>
							<SCRIPT>
							alert("上传的文件大小不能超过800KB!");
							history.back();
							</SCRIPT>
<%				
						}
                		//====》添加                     
                        /**
                         *判断文件扩展名是否符合要求
                         */
                        ext[i] = upFile.getFileExt();
                        for (int j = 0; j < dontExtAry.length; j++){
                            if (ext[i].equals(dontExtAry[j])){//如果是不能使用的扩展名
								total_val=0;//====》添加
%>
								<script>
								alert("上传了不允许使用的文件类型");
								history.back();
								</script>
<%
                            }
                        }
                   // }//文件不为空
                }//依次检验每个文件

                /**
                 * 页面未跳转，说明符合要求,上传文件
                 */
				if(total_val==1){  //====》添加
					String path="gjqlive_images";
					//这部分是要替换的/
					String newFileHead = "";//文件名的前一部分
					//*************//
					path += "/";

					String timeStr;//时间字串
					String newFileName = "";//新文件名

					for (int i = 0; i < filesCount; i++){
						upFile = myUpload.getFiles().getFile(i);
						String filename = upFile.getFileName();

						if (!filename.equals("")){
							java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy_MM_dd_HHmmss"); 
							java.util.Date currentTime_1 = new java.util.Date();
							timeStr = formatter.format(currentTime_1); 
							newFileName = path + newFileHead + timeStr;
							if (!ext[i].equals("")){
								newFileName += "." + ext[i];
							}
							//out.println(newFileName);
							myUpload.getFiles().getFile(i).saveAs(newFileName);
							attach += newFileName + " ";
						}
					}

					/******************需要替换部分******************/
					/**
					 * 对所有的字符串作符合sql的处理
					 */
					String ATTACHMENT = attach;/*String
					Fj附件对应的数据库字段名，一般是Fj，注意大小写要与数据库字段大小一致*/
					/**
					 * 添加入数据库操作
					 */
				
                  md.updateSchool(ID1,NAME,SADDRESS,BADDRESS,LADDRESS,SCONTENT,ATTACHMENT);
				//	System.out.println(sql);
					/**********************************************/
					
				
					
					if (m!=null){
%>
						<SCRIPT>
						alert("保存成功！");
						
						</SCRIPT>
						<meta http-equiv="refresh"content="0;url=product.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
<%
					}
					else{
%>
						<SCRIPT>
						alert("请检查您输入的信息，有不正常字符信息导致保存过程出现异常！");
						history.back();
						</SCRIPT>
<%
					}
				}//====》添加
            }
            else{
                /******************需要替换部分******************/
	            
               md.updateSchool1(ID1,NAME,SADDRESS,BADDRESS,LADDRESS,SCONTENT);
                /**********************************************/
				
				//System.out.println(sql);
                
				if (m!=null){
%>
					<SCRIPT>
					alert("保存成功！");
					
					</SCRIPT>
					<meta http-equiv="refresh"content="0;url=product.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
<%
				}
				else{
%>
					<SCRIPT>
					alert("请检查您输入的信息，有不正常字符信息导致保存过程出现异常！");
					history.back();
					</SCRIPT>
<%
				}
            }

        }//id不为空
    }//修改信息
%>
