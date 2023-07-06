package kr.or.korapis.util;

import java.text.SimpleDateFormat;




public class DateFormatter {
	

	private static SimpleDateFormat dateFormatter;

	
	

	/**
	 * 2013-07-10 15:22:01  >> MySql datetime type
	 * @param strdate
	 * @return 2013-07-10<br>15:22:01
	 */
	public static String format(String strdate){
		StringBuffer retVal = new StringBuffer();
		
		try{
			retVal.append(strdate.substring(0,10));
			retVal.append("<br/>");
			retVal.append(strdate.substring(11));
			
		}catch (Exception e) {
			if(strdate==null) strdate = "";
			retVal.setLength(0);
			retVal.append(strdate);
		}
		
		return retVal.toString();
	}
	
	
	/**
	 * 2013-07-10 15:22:01  >> MySql datetime type
	 * @param strdate
	 * @return
	 */
	public static String format2(String strdate){
		StringBuffer retVal = new StringBuffer();
	
		try{
			retVal.append(strdate.substring(5,10));
			retVal.append("<br/>");
			retVal.append(strdate.substring(11,16));
			
		}catch (Exception e) {
			if(strdate==null) strdate = "";
			retVal.setLength(0);
			retVal.append(strdate);
		}
		
		return retVal.toString();
	}
	
	
	
	
	public static String format3(String strdate){
		StringBuffer retVal = new StringBuffer();
		
		try{
			retVal.append(strdate.replaceAll("-", ".").substring(0,16));
			
		}catch (Exception e) {
			if(strdate==null) strdate = "";
			retVal.setLength(0);
			retVal.append(strdate);
		}
		
		return retVal.toString();	
	}
	
	
	
}
