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
<%@page import="com.li.entity.Store"%>
<%@page import="com.li.dao.*"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>


<%
    /**
     * 文件上传类初始化
     */
    SmartUpload myUpload=new  SmartUpload();
    myUpload.initialize(pageContext);
    myUpload.upload();

    String submit = myUpload.getRequest().getParameter("Submit");
    String sql="";
     StoreDao md=new StoreDao();  
	     Store m=new Store();  

    if (submit.equals("提交")){
        /*********************以下需要修改************************/
        /**
         * 接收提交信息
         */
        String STORENAME = myUpload.getRequest().getParameter("NAME");
        String ADDRESS = myUpload.getRequest().getParameter("SADDRESS");
        String LID = myUpload.getRequest().getParameter("BID");
        int LID1 = Integer.parseInt(LID);
		
		
		String CONTEXT = myUpload.getRequest().getParameter("content");

		
		
        String smallpath="";//小图路径,用于insert时
		String bigpath="";//大图路径,用于insert时
       

        /********************以上需要修改************************/

        /**
         * 文件上传部分处理
         * 需要判断文件大小，文件总和不超过800KB(850000B)
         * 需要判断文件类型，不能是jsp,inc,css,class,java,exe,asp
         * xml,htm,html,js,jsp
         * 文件命名规则是：科室缩写＋用户名＋new Date().getTime()＋.文件自己的扩展名
         */

        int maxFileSize = 850000;  //根据实际大小定  //====》修改

        int filesCount = myUpload.getFiles().getCount();//得到上传文件个数
        long filesize = 0;//文件大小之和
        com.jspsmart.upload.File upFile; //当前文件

        //能使用的扩展名
        //String[] dontExtAry = {"asp", "xml", "htm", "html",
        //         "class", "inc", "js","jsp","exe", "php", "aspx", "bat", "java", "css",
        //         "sql", "ini", "properties"};
        String[] dontExtAry = {"asp", "xml", "htm", "html", "css",
                "class", "inc", "js", "jsp", "asax","asp", "php", "aspx", "vbp", "bat", "java", "net",
                "sql", "ini", "exe", "cfg", "properties"}; //====》修改

        //当前文件的扩展名数组
        String[] ext = new String[filesCount];
		int total_val=1;//定义全局判断上传文件类型.1为上传文件正确，0为上传错误
		//====》添加
        for(int i = 0; i < filesCount; i++){//依次检验每个文件

            upFile = myUpload.getFiles().getFile(i);
            String filename = upFile.getFileName();

            //if (!filename.equals("")){//文件不为空  ====》修改

                int upFileSize = upFile.getSize();
                if (upFileSize == 0){
					total_val=0;  //====》添加
%>
					<SCRIPT>
					alert("上传的文件不能为空!");
					history.back();
					</SCRIPT>
<%
                }
				if(upFileSize>maxFileSize)
				{
					total_val=0;
%>
					<SCRIPT>
					alert("上传的文件大小不能超过800KB!");
					history.back();
					</SCRIPT>
<%				
				}
                //====》添加
                ext[i] = upFile.getFileExt();
                
              
                
           // }//文件不为空  //====》修改
        }//依次检验每个文件

        /**
         * 页面未跳转，说明符合要求,上传文件
         */
		//if(total_val==1){   //====》添加
        String path="";//文件路径
		path += "gjqlive_images";
        String newFileHead = "";//文件名的前一部分
        //*************//
        path += "/";

        String timeStr;//时间字串
        String newFileName = "";//新文件名

        for (int i = 0; i < filesCount; i++){
            upFile = myUpload.getFiles().getFile(i);
            String filename = upFile.getFileName();
            if (!filename.equals("")){
                //timeStr = String.valueOf(new java.util.Date().getTime()).trim();
                java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy_MM_dd_HHmmss"); 
                java.util.Date currentTime_1 = new java.util.Date();
                timeStr = formatter.format(currentTime_1); 
                newFileName = path + i +"_"+timeStr;
                if (!ext[i].equals("")){
                    newFileName += "." + ext[i];
                }
                //myUpload.getFiles().getFile(i).saveAs(newFileName);
				//下面的getFieldName()用于取HTML表单中对应于此上传文件的表单项的名字。
				if(upFile.getFieldName().equals("samllfile")){
                smallpath += newFileName + " ";
				}else if(upFile.getFieldName().equals("bigfile")){
				bigpath += newFileName + " ";
				}
            }
        }

        /**
         * 添加入数据库操作
         */
		if(STORENAME.equals("")){
		%>
						<SCRIPT>
						alert("学校名称必须填写！");
						history.back();
						</SCRIPT>				
		<%}else{ 
		m.setStorename(STORENAME);
		m.setAddress(ADDRESS);
		m.setLid(LID1);
		m.setPhoto(smallpath);
        m.setPx(100);
        m.setTj("0");
        m.setSumm(0);
        m.setContext(CONTEXT);
        md.saveStore(m);
		}		
	//System.out.println(sql);
        /******************以上需要替换部分******************/
       
        if (m!=null){
		//这里以前不一样地方，主要防公司人员录入非法信息，致insert失败，但是图片又上传成功，会产生很多无用图片，所以
		//这里将上传图片的操作放到insert成功之后做
			for (int i = 0; i < filesCount; i++){
				upFile = myUpload.getFiles().getFile(i);
				String filename = upFile.getFileName();
				if (!filename.equals("")){
					newFileName=""+newFileName; 
					myUpload.getFiles().getFile(0).saveAs(newFileName);
				}
             %>
						<SCRIPT>
						alert("上传成功!");
						</SCRIPT>
						<meta http-equiv="refresh"content="0;url=store.jsp">
            <%              
			}
%>
			<meta http-equiv="refresh"content="0;url=store.jsp">
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
	 // }  //====》添加
	}    
%>
