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
    String submit = myUpload.getRequest().getParameter("submit");
	String LID = request.getParameter("PID");
	int ID1 = Integer.parseInt(LID);
    String showPage = request.getParameter("toPage");
    String sqlWhere = request.getParameter("toWhere");
    if (submit.equals("����")){//�޸���Ϣ
%>
<%--[�����ύ����Ϣ,���idΪ��,˵������,������ɾ�����и���,�����¸�����Ϣ]--%>
<%
        
      
        if(LID.equals("")){//PRIDΪ��
%>
			<script>
			alert("�������ݣ�");
			history.back();
			</script>
<%
        }//PRIDΪ��
        else{//PRID��Ϊ��
            /**
             * ��ѯ���ݿ��¼
             */
            StoreDao md=new StoreDao();  
	     Store m=new Store();  
	     m=md.findStoreById(ID1);
            /**
             * ���������ݱ����Ӧ�ı���
             */
            String attach = "";

            if (m==null){
%>
					<script>
					alert("ȡ������Ӧ���ݣ�");
					history.back();
					</script>
<%
            }
            else{
                attach = m.getPhoto();
            }
			
            /**********************��Ҫ�޸ĵĲ���********************/
            /**
             * �����ύ��Ϣ
             */
			String STORENAME = myUpload.getRequest().getParameter("NAME");
			String CONTEXT = myUpload.getRequest().getParameter("content");
			String ADDRESS = myUpload.getRequest().getParameter("SADDRESS");
			String BID = myUpload.getRequest().getParameter("BID");
			int LID1 = Integer.parseInt(BID);
			CONTEXT = CONTEXT.replaceAll("'", "&acute;");	
			String isModifyFile = myUpload.getRequest().getParameter("isModifyFile");
			
            /**
             *��ʽ���ַ���
             */
            /********************************************************/
            if (isModifyFile!=null){

                /**
                 * ɾ��ԭ���ļ�
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
                attach = "";//��ո�������

                /**
                 * �ļ��ϴ����ִ���
                 * ��Ҫ�ж��ļ���С���ļ��ܺͲ�����800KB(850000B)
                 * ��Ҫ�ж��ļ����ͣ�������jsp,inc,css,class,java,
                 * xml,htm,html,js,asp
                 * �ļ����������ǣ�new Date().getTime()��.�ļ��Լ�����չ��
                 */

                int maxFileSize = 850000; //����ʵ�ʴ�С��  //====���޸�

                int filesCount = myUpload.getFiles().getCount();//�õ��ϴ��ļ�����
                long filesize = 0;//�ļ���С֮��
                com.jspsmart.upload.File upFile; //��ǰ�ļ�
				int total_val=1;//����ȫ���ж��ϴ��ļ�����.1Ϊ�ϴ��ļ���ȷ��0Ϊ�ϴ�����
				//====�����

                //��ʹ�õ���չ��
        		//String[] dontExtAry = {"asp", "xml", "htm", "html",
        		//         "class", "inc", "js","jsp","exe", "php", "aspx", "bat", "java", "css",
       			//         "sql", "ini", "properties"};
        		String[] dontExtAry = {"asp", "xml", "htm", "html", "css",
                "class", "inc", "js", "jsp", "asax","asp", "php", "aspx", "vbp", "bat", "java", "net",
                "sql", "ini", "exe", "cfg", "properties"};  //====���޸�

                //��ǰ�ļ�����չ������
                String[] ext = new String[filesCount];
                for(int i = 0; i < filesCount; i++){//���μ���ÿ���ļ�

                    upFile = myUpload.getFiles().getFile(i);
                    String filename = upFile.getFileName();

                   // if (!filename.equals("")){//�ļ���Ϊ�� ====���޸�

                        int upFileSize = upFile.getSize();
                        if (upFileSize == 0){
							total_val=0;//====�����
%>
							<script>
							alert("�ϴ����ļ�����Ϊ��!");
							history.back();
							</script>
<%
                        }
						if(upFileSize>maxFileSize)
						{
							total_val=0;//====�����
%>
							<SCRIPT>
							alert("�ϴ����ļ���С���ܳ���800KB!");
							history.back();
							</SCRIPT>
<%				
						}
                		//====�����                     
                        /**
                         *�ж��ļ���չ���Ƿ����Ҫ��
                         */
                        ext[i] = upFile.getFileExt();
                        for (int j = 0; j < dontExtAry.length; j++){
                            if (ext[i].equals(dontExtAry[j])){//����ǲ���ʹ�õ���չ��
								total_val=0;//====�����
%>
								<script>
								alert("�ϴ��˲�����ʹ�õ��ļ�����");
								history.back();
								</script>
<%
                            }
                        }
                   // }//�ļ���Ϊ��
                }//���μ���ÿ���ļ�

                /**
                 * ҳ��δ��ת��˵������Ҫ��,�ϴ��ļ�
                 */
				if(total_val==1){  //====�����
					String path="gjqlive_images";
					//�ⲿ����Ҫ�滻��/
					String newFileHead = "";//�ļ�����ǰһ����
					//*************//
					path += "/";

					String timeStr;//ʱ���ִ�
					String newFileName = "";//���ļ���

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

					/******************��Ҫ�滻����******************/
					/**
					 * �����е��ַ���������sql�Ĵ���
					 */
					String ATTACHMENT = attach;/*String
					Fj������Ӧ�����ݿ��ֶ�����һ����Fj��ע���СдҪ�����ݿ��ֶδ�Сһ��*/
					/**
					 * ��������ݿ����
					 */
				
                  md.updateStore(ID1,STORENAME,ADDRESS,LID1,CONTEXT,ATTACHMENT);
				//	System.out.println(sql);
					/**********************************************/
					
				
					
					if (m!=null){
%>
						<SCRIPT>
						alert("����ɹ���");
						
						</SCRIPT>
						<meta http-equiv="refresh"content="0;url=store.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
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
				}//====�����
            }
            else{
                /******************��Ҫ�滻����******************/
	            
               md.updateStore1(ID1,STORENAME,ADDRESS,LID1,CONTEXT);
                /**********************************************/
				
				//System.out.println(sql);
                
				if (m!=null){
%>
					<SCRIPT>
					alert("����ɹ���");
					
					</SCRIPT>
					<meta http-equiv="refresh"content="0;url=store.jsp?toPage=<%=showPage%>&toWhere=<%=sqlWhere%>">
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
            }

        }//id��Ϊ��
    }//�޸���Ϣ
%>
