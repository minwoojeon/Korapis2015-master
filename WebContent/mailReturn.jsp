<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Timer"%>
<%@page import="kr.or.korapis.util.DefaultCode"%>
<%@page import="kr.or.korapis.db.TransactionHandler"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%

	// 참고 : http://docs.aws.amazon.com/sns/latest/dg/json-formats.html#http-header

	// 1. SubscriptionConfirmation
	// 2. Notification
	// 3. UnsubscribeConfirmation
	String messagetype = request.getHeader("x-amz-sns-message-type");
	if (messagetype == null)
		return;


	Enumeration<String> e = request.getHeaderNames();
	while(e.hasMoreElements()){
		String key = e.nextElement();
		System.out.println("["+key+"] "+request.getHeader(key));
	}

	
	Scanner scan = new Scanner(request.getInputStream());
	StringBuilder builder = new StringBuilder();
	while (scan.hasNextLine()) {
		builder.append(scan.nextLine());
	}
	JSONObject jo = JSONObject.fromObject(builder.toString());
	
	String str_jo = jo.toString();
	Iterator<String> it = jo.keys();
	String key = "";
	String val = "";
	while(it.hasNext()){
		key = it.next();
		val = jo.getString(key);
		System.out.println(key+" : "+val);
	}

	String table_name = "";
	String count1 = "";
	String count2 = "";
	
	//수신동의
	if("SubscriptionConfirmation".equals(messagetype)){
		
		Scanner sc = new Scanner(new URL(jo.getString("SubscribeURL")).openStream());
		StringBuilder sb = new StringBuilder();
		while (sc.hasNextLine()) {
			sb.append(sc.nextLine());
		}
		System.out.println(">>Subscription confirmation ("+ jo.get("SubscribeURL")+ ") Return value: "+ sb.toString());
	
		
	//Noti일 경우
	}else if("Notification".equals(messagetype)){
		

			JSONObject jo_Message = JSONObject.fromObject(jo.get("Message"));
			String str_JoMessage = jo_Message.toString();
			if("Bounce".equals(jo_Message.getString("notificationType"))){
				System.out.println("---->this is bouce json ");
				
				JSONObject jo_bounce = jo_Message.getJSONObject("bounce");
				JSONObject jo_mail = jo_Message.getJSONObject("mail");
				System.out.println(" bounceType is :"+jo_bounce.getString("bounceType"));
				System.out.println(" bounceSubType is :"+jo_bounce.getString("bounceSubType"));
				System.out.println(" bouncedRecipients is :"+jo_bounce.getString("bouncedRecipients"));
				
				System.out.println(" messageId is :"+jo_mail.getString("messageId"));
				
  				JSONArray ja = JSONArray.fromObject(jo_bounce.getString("bouncedRecipients"));
  				
  				String action = "";
  				String status = "";
  				String diagnosticCode = "";
  				
  				for(int i=0; i<ja.size(); i++){
  					
  					JSONObject jo_Recipients = (JSONObject)ja.get(i);
  					action = jo_Recipients.getString("action");
  					status = jo_Recipients.getString("status");
  					diagnosticCode = jo_Recipients.getString("diagnosticCode");
  					String emailAddress = jo_Recipients.getString("emailAddress");
					
 					System.out.println(" ---->this is bouncedrecipients json ");
 					System.out.println(" action is :"+action);
 					System.out.println(" action is :"+status);
 					System.out.println(" action is :"+emailAddress);
 					
 				}
  				
  				//엔드포인트 받은json 수정.
  				StringBuffer sql = new StringBuffer();
			    TransactionHandler trh = new TransactionHandler(DefaultCode.JNDI_MYSQL_V22);
			    try {
			    	
					Object[] obj = null;
					
					/* count1 = trh.getAData(" select count(idx) from MICE_INFO_MAILHISTORY where  MESSAGE_ID = '"+jo_mail.getString("messageId")+"'");					
					count2 = trh.getAData(" select count(idx) from MICE_CORPFAIR_MAILHISTORY where  MESSAGE_ID = '"+jo_mail.getString("messageId")+"'");
					
					
					System.out.println("===============================?"+count1);
					
					
					if(!"0".equals(count1)){
						table_name = "MICE_INFO_MAILHISTORY";
					} else if(!"0".equals(count2)){
						table_name = "MICE_CORPFAIR_MAILHISTORY";
					}
					
					sql.setLength(0);
	 				sql.append("\n	UPDATE ").append(table_name).append(" SET ");
	 				sql.append("\n	RESULT_VALUE = ?		");
	 				sql.append("\n	,NOTIFICATION = ?		");
	 				sql.append("\n	,BOUNCE = ?				");
	 				sql.append("\n	,BOUNCE_SUBTYPE = ?		");
	 				sql.append("\n	,JSONDATA = ?		");
	 				sql.append("\n	WHERE MESSAGE_ID = '").append(jo_mail.getString("messageId")).append("'");
					obj = new Object[5];
					obj[0] = diagnosticCode;
					obj[1] = jo_Message.getString("notificationType");
					obj[2] = jo_bounce.getString("bounceType");
					obj[3] = jo_bounce.getString("bounceSubType");
					obj[4] = str_JoMessage;
					trh.setQueryData(sql.toString(), obj); */
					
					
					
					
					
					
					//1. 행사정보 등록
					sql.setLength(0);
					sql.append("\n	INSERT INTO MICE_MAIL_NOTIFICATION (		"); 
					sql.append("\n		RESULT_VALUE			"); 
					sql.append("\n 	   	,MESSAGE_ID		");         
					sql.append("\n 	   	,NOTIFICATION		");           
					sql.append("\n 	   	,BOUNCE		");      
					sql.append("\n 	   	,BOUNCE_SUBTYPE		");
					sql.append("\n 	   	,JSONDATA		");
					sql.append("\n 	   	,CDATE		");
					
					sql.append("\n	)values(			"); 
					sql.append("\n		?			"); 
					sql.append("\n 	   	,?		");         
					sql.append("\n 	   	,?		");           
					sql.append("\n 	   	,?		");
					sql.append("\n 	   	,?		");     
					sql.append("\n 	   	,?		");     
					sql.append("\n 	   	,NOW()		");          
					sql.append("\n	)	");

					//sql 쿼리내의 ?갯수를 센다.
					StringTokenizer st = new StringTokenizer(sql.toString(), "?");
					int cnt = st.countTokens();
					int idx = 0;
					obj = new Object[cnt-1];
					
					obj[idx++] = diagnosticCode; 
					obj[idx++] = jo_mail.getString("messageId");
					obj[idx++] = jo_Message.getString("notificationType");
					obj[idx++] = jo_bounce.getString("bounceType");
					obj[idx++] = jo_bounce.getString("bounceSubType");
					obj[idx++] = str_JoMessage;
					
					trh.setQueryData(sql.toString(), obj);
					trh.commit();
					
					
					
				}catch(Exception ect){
					ect.printStackTrace();
					trh.rollback();
				}finally{
					trh.close();
				}
			    
			}else if("Delivery".equals(jo_Message.getString("notificationType"))){
				System.out.println("---->this is Succeeded json ");
				
				JSONObject jo_bounce = jo_Message.getJSONObject("delivery");
				JSONObject jo_mail = jo_Message.getJSONObject("mail");
				System.out.println(" messageId is :"+jo_mail.getString("messageId"));
				
				
				//엔드포인트 받은json 수정.
  				StringBuffer sql = new StringBuffer();
			    TransactionHandler trh = new TransactionHandler(DefaultCode.JNDI_MYSQL_V22);
			    try {
					Object[] obj = null;
					
					
					/* 		
					count1 = trh.getAData(" select count(idx) from MICE_INFO_MAILHISTORY where  MESSAGE_ID = '"+jo_mail.getString("messageId")+"'");					
					count2 = trh.getAData(" select count(idx) from MICE_CORPFAIR_MAILHISTORY where  MESSAGE_ID = '"+jo_mail.getString("messageId")+"'");
					
					System.out.println("===============================?"+count1);
					
					if(!"0".equals(count1)){
						table_name = "MICE_INFO_MAILHISTORY";
					} else if(!"0".equals(count2)){
						table_name = "MICE_CORPFAIR_MAILHISTORY";
					}
					
					sql.setLength(0);
					sql.append("\n	UPDATE ").append(table_name).append(" SET ");
	 				sql.append("\n	result_value = ?		");
	 				sql.append("\n	, notification = ?		");
	 				sql.append("\n	, jsondata = ?		");
	 				sql.append("\n	WHERE message_id = '").append(jo_mail.getString("messageId")).append("'");
					obj = new Object[3];
					obj[0] = jo_Message.getString("delivery");
					obj[1] = jo_Message.getString("notificationType");
					obj[2] = str_JoMessage;
					trh.setQueryData(sql.toString(), obj); */
					
					
					//1. 행사정보 등록
					sql.setLength(0);
					sql.append("\n	INSERT INTO MICE_MAIL_NOTIFICATION (		"); 
					sql.append("\n		RESULT_VALUE			"); 
					sql.append("\n 	   	,MESSAGE_ID		");         
					sql.append("\n 	   	,NOTIFICATION		");           
					sql.append("\n 	   	,JSONDATA		");
					sql.append("\n 	   	,CDATE		");
					
					sql.append("\n	)values(			"); 
					sql.append("\n		?			"); 
					sql.append("\n 	   	,?		");         
					sql.append("\n 	   	,?		");     
					sql.append("\n 	   	,?		");     
					sql.append("\n 	   	,NOW()		");          
					sql.append("\n	)	");

					//sql 쿼리내의 ?갯수를 센다.
					StringTokenizer st = new StringTokenizer(sql.toString(), "?");
					int cnt = st.countTokens();
					int idx = 0;
					obj = new Object[cnt-1];
					
					obj[idx++] = jo_Message.getString("delivery");
					obj[idx++] = jo_mail.getString("messageId");
					obj[idx++] = jo_Message.getString("notificationType");
					obj[idx++] = str_JoMessage;
					
					trh.setQueryData(sql.toString(), obj);
					trh.commit();
					
				}catch(Exception ect){
					ect.printStackTrace();
					trh.rollback();
				}finally{
					trh.close();
				}
			    
			//불만일경우	
			}else if("Complaint".equals(jo_Message.getString("notificationType"))){
				System.out.println("---->this is Complaints json ");
				
				
				JSONObject jo_bounce = jo_Message.getJSONObject("complaint");
				JSONObject jo_mail = jo_Message.getJSONObject("mail");
				System.out.println(" userAgent is :"+jo_bounce.getString("userAgent"));
				System.out.println(" complaintFeedbackType is :"+jo_bounce.getString("complaintFeedbackType"));
				System.out.println(" messageId is :"+jo_mail.getString("messageId"));
				
				
				//엔드포인트 받은json 수정.
  				StringBuffer sql = new StringBuffer();
			    TransactionHandler trh = new TransactionHandler(DefaultCode.JNDI_MYSQL_V22);
			    try {
					Object[] obj = null;
					
					/* count1 = trh.getAData(" select count(idx) from MICE_INFO_MAILHISTORY where  MESSAGE_ID = '"+jo_mail.getString("messageId")+"'");					
					count2 = trh.getAData(" select count(idx) from MICE_CORPFAIR_MAILHISTORY where  MESSAGE_ID = '"+jo_mail.getString("messageId")+"'");
					
					if(!"0".equals(count1)){
						table_name = "MICE_INFO_MAILHISTORY";
					} else if(!"0".equals(count2)){
						table_name = "MICE_CORPFAIR_MAILHISTORY";
					}
					
					sql.setLength(0);
					sql.append("\n	UPDATE ").append(table_name).append(" SET ");
	 				sql.append("\n	RESULT_VALUE = ?		");
	 				sql.append("\n	,NOTIFICATION = ?		");
	 				sql.append("\n	,BOUNCE = ?				");
	 				sql.append("\n	,JSONDATA = ?		");
	 				sql.append("\n	WHERE MESSAGE_ID = '").append(jo_mail.getString("messageId")).append("'");
					obj = new Object[4];
					obj[0] = jo_bounce.getString("userAgent");
					obj[1] = jo_Message.getString("notificationType");
					obj[2] = jo_bounce.getString("complaintFeedbackType");
					obj[3] = str_JoMessage;
					trh.setQueryData(sql.toString(), obj); */
					
					
					//1. 행사정보 등록
					sql.setLength(0);
					sql.append("\n	INSERT INTO MICE_MAIL_NOTIFICATION (		"); 
					sql.append("\n		RESULT_VALUE			"); 
					sql.append("\n 	   	,MESSAGE_ID		");         
					sql.append("\n 	   	,NOTIFICATION		");           
					sql.append("\n 	   	,BOUNCE		");      
					sql.append("\n 	   	,JSONDATA		");
					sql.append("\n 	   	,CDATE		");
					
					sql.append("\n	)values(			"); 
					sql.append("\n		?			"); 
					sql.append("\n 	   	,?		");         
					sql.append("\n 	   	,?		");           
					sql.append("\n 	   	,?		");     
					sql.append("\n 	   	,?		");     
					sql.append("\n 	   	,NOW()		");          
					sql.append("\n	)	");

					//sql 쿼리내의 ?갯수를 센다.
					StringTokenizer st = new StringTokenizer(sql.toString(), "?");
					int cnt = st.countTokens();
					int idx = 0;
					obj = new Object[cnt-1];
					
					obj[idx++] = jo_bounce.getString("userAgent");
					obj[idx++] = jo_mail.getString("messageId");
					obj[idx++] = jo_Message.getString("notificationType");
					obj[idx++] = jo_bounce.getString("complaintFeedbackType");
					obj[idx++] = str_JoMessage;
					
					trh.setQueryData(sql.toString(), obj);
					
					trh.commit();
					
					
					
					
					
				}catch(Exception ect){
					ect.printStackTrace();
					trh.rollback();
				}finally{
					trh.close();
				}
				
			}
		
	//수신거절일 경우
	}else if("UnsubscribeConfirmation".equals(messagetype)){
		
		Scanner sc = new Scanner(new URL(jo.getString("SubscribeURL")).openStream());
		StringBuilder sb = new StringBuilder();
		while (sc.hasNextLine()) {
			sb.append(sc.nextLine());
		}
		System.out.println(">>UnsubscribeConfirmation ("+ jo.get("SubscribeURL")+ ") Return value: "+ sb.toString());
		
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>json</h1>
<%=str_jo %>
<br/><br/>




</body>
</html>