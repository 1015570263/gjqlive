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
     * �ļ��ϴ����ʼ��
     */
    SmartUpload myUpload=new  SmartUpload();
    myUpload.initialize(pageContext);
    myUpload.upload();

    String submit = myUpload.getRequest().getParameter("Submit");
    String sql="";
     StoreDao md=new StoreDao();  
	     Store m=new Store();  

    if (submit.equals("�ύ")){
        /*********************������Ҫ�޸�************************/
        /**
         * �����ύ��Ϣ
         */
        String STORENAME = myUpload.getRequest().getParameter("NAME");
        String ADDRESS = myUpload.getRequest().getParameter("SADDRESS");
        String LID = myUpload.getRequest().getParameter("BID");
        int LID1 = Integer.parseInt(LID);
		
		
		String CONTEXT = myUpload.getRequest().getParameter("content");

		
		
        String smallpath="";//Сͼ·��,����insertʱ
		String bigpath="";//��ͼ·��,����insertʱ
       

        /********************������Ҫ�޸�************************/

        /**
         * �ļ��ϴ����ִ���
         * ��Ҫ�ж��ļ���С���ļ��ܺͲ�����800KB(850000B)
         * ��Ҫ�ж��ļ����ͣ�������jsp,inc,css,class,java,exe,asp
         * xml,htm,html,js,jsp
         * �ļ����������ǣ�������д���û�����new Date().getTime()��.�ļ��Լ�����չ��
         */

        int maxFileSize = 850000;  //����ʵ�ʴ�С��  //====���޸�

        int filesCount = myUpload.getFiles().getCount();//�õ��ϴ��ļ�����
        long filesize = 0;//�ļ���С֮��
        com.jspsmart.upload.File upFile; //��ǰ�ļ�

        //��ʹ�õ���չ��
        //String[] dontExtAry = {"asp", "xml", "htm", "html",
        //         "class", "inc", "js","jsp","exe", "php", "aspx", "bat", "java", "css",
        //         "sql", "ini", "properties"};
        String[] dontExtAry = {"asp", "xml", "htm", "html", "css",
                "class", "inc", "js", "jsp", "asax","asp", "php", "aspx", "vbp", "bat", "java", "net",
                "sql", "ini", "exe", "cfg", "properties"}; //====���޸�

        //��ǰ�ļ�����չ������
        String[] ext = new String[filesCount];
		int total_val=1;//����ȫ���ж��ϴ��ļ�����.1Ϊ�ϴ��ļ���ȷ��0Ϊ�ϴ�����
		//====�����
        for(int i = 0; i < filesCount; i++){//���μ���ÿ���ļ�

            upFile = myUpload.getFiles().getFile(i);
            String filename = upFile.getFileName();

            //if (!filename.equals("")){//�ļ���Ϊ��  ====���޸�

                int upFileSize = upFile.getSize();
                if (upFileSize == 0){
					total_val=0;  //====�����
%>
					<SCRIPT>
					alert("�ϴ����ļ�����Ϊ��!");
					history.back();
					</SCRIPT>
<%
                }
				if(upFileSize>maxFileSize)
				{
					total_val=0;
%>
					<SCRIPT>
					alert("�ϴ����ļ���С���ܳ���800KB!");
					history.back();
					</SCRIPT>
<%				
				}
                //====�����
                ext[i] = upFile.getFileExt();
                
              
                
           // }//�ļ���Ϊ��  //====���޸�
        }//���μ���ÿ���ļ�

        /**
         * ҳ��δ��ת��˵������Ҫ��,�ϴ��ļ�
         */
		//if(total_val==1){   //====�����
        String path="";//�ļ�·��
		path += "gjqlive_images";
        String newFileHead = "";//�ļ�����ǰһ����
        //*************//
        path += "/";

        String timeStr;//ʱ���ִ�
        String newFileName = "";//���ļ���

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
				//�����getFieldName()����ȡHTML���ж�Ӧ�ڴ��ϴ��ļ��ı�������֡�
				if(upFile.getFieldName().equals("samllfile")){
                smallpath += newFileName + " ";
				}else if(upFile.getFieldName().equals("bigfile")){
				bigpath += newFileName + " ";
				}
            }
        }

        /**
         * ��������ݿ����
         */
		if(STORENAME.equals("")){
		%>
						<SCRIPT>
						alert("ѧУ���Ʊ�����д��");
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
        /******************������Ҫ�滻����******************/
       
        if (m!=null){
		//������ǰ��һ���ط�����Ҫ����˾��Ա¼��Ƿ���Ϣ����insertʧ�ܣ�����ͼƬ���ϴ��ɹ���������ܶ�����ͼƬ������
		//���ｫ�ϴ�ͼƬ�Ĳ����ŵ�insert�ɹ�֮����
			for (int i = 0; i < filesCount; i++){
				upFile = myUpload.getFiles().getFile(i);
				String filename = upFile.getFileName();
				if (!filename.equals("")){
					newFileName=""+newFileName; 
					myUpload.getFiles().getFile(0).saveAs(newFileName);
				}
             %>
						<SCRIPT>
						alert("�ϴ��ɹ�!");
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
			alert("�������������Ϣ���в������ַ���Ϣ���±�����̳����쳣��");
			history.back();
			</SCRIPT>			
<%
        }
	 // }  //====�����
	}    
%>
