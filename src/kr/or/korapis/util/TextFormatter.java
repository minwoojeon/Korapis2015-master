package kr.or.korapis.util;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.NumberFormat;




public class TextFormatter {
	
	private static DecimalFormat rateFormat = new DecimalFormat("#0.00");
	private static DecimalFormat rtFormat = new DecimalFormat("###,###,###,###,###.##");
	
	
	
	public static String formatNum(Object val){
		String retVal = val+"";
		try{
			retVal = rtFormat.format(Long.parseLong(retVal));
		}catch(Exception e){
			e.printStackTrace();
		}
		return retVal;
	}

	/**
	 * space 리턴
	 * @param nDepth : int depth value
	 * @return
	 */
	public static String getSpace(int nDepth) {
		return getSpace(nDepth, "&nbsp; &nbsp; ");
	}

	/**
	 * 입력받은 string 값을 depth size만큼 곱해서 리턴
	 * @param nDepth : int depth value
	 * @param str    : 추가 문자열
	 * @return
	 */
	public static String getSpace(int nDepth, String str) {
		String strSpace = "";
		for (int n=0; n < nDepth; n++) {
			strSpace += str;
		}
		return strSpace;
	}
	
	
	/**
	 * 레벨에 따른 깊이 계산 
	 * @param level
	 * @return
	 */
	public static String getReplyTab(String level){
		int depth = 0;
		StringBuffer str = new StringBuffer("");
		try{
			depth = Integer.parseInt(level);
			if(depth > 0){
				int  baseDepth = 0;
				while(baseDepth < depth){
					str.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					depth --;
				}
				str.append("(답글☞)");
			}
		}catch(Exception e){
		}
		return str.toString();
	}
	
	
	/**
	 * String 객체의 NULL처리<br>
	 * @param s1 문자열 
	 * @param s2 NULL일때 치환 문자열 
	 * @return
	 */
	public static String convNvl(String s1, String s2)
	{
		if(s1 == null || s1.equals("") || s1.equals("null")) return s2;
		else return s1;	
	}
	
	public static int convNvl(String s1, int i2){
		int retVal = i2;
		
		try{
			retVal = Integer.parseInt(s1);
		}catch(NumberFormatException nfe){
		}
		
		return retVal;
	}
	public static int convNvl(Object s1, int i2){
		if(s1==null){
			s1 =  i2+"";
		}
		return convNvl(s1.toString(), i2);
	}
	
	/**
	 * String 객체의 NULL처리<br>
	 * @param s1 문자열 
	 * @param s2 NULL일때 치환 문자열 
	 * @return
	 */
	public static String convNvl(String s1)
	{
		if(s1 == null || s1.equals("") || s1.equals("null")) return "";
		else return s1;	
	}
	
	/**
	 * String 객체의 NULL처리<br>
	 * @param o1 객체 
	 * @param s2 NULL일때 치환 문자열 
	 * @return
	 */
	public static String convNvl(Object o1, String s2)
	{
		if(o1 == null) return s2;
		if("".equals(o1.toString())) return s2;
		else return o1.toString();	
	}
	
	/**
	 * String 객체의 Int형 변환 
	 * @param s1
	 * @return
	 */
	public static int convInteger(String s1) {
		if (s1 == null || s1.equals("")) return 0;
		else return Integer.parseInt(replace(s1,",",""));
	}
	
	/**
	 * String 객체의 Double형 변환
	 * @param s1
	 * @return
	 */
	public static double convDouble(String s1) {
		double tmpDbl = 0.d;
		if (s1 == null || s1.equals("")) return 0;
		tmpDbl = Double.parseDouble(replace(s1,",",""));
		return tmpDbl;
	}
	
	/**
	 * String 객체의 Long형 변환
	 * @param s1
	 * @return
	 */
	public static long convLong(String s1) {
		if (s1 == null || s1.equals("")) return 0;
		else return Long.parseLong(replace(s1,",",""));
	}
	
	/**
	 * 대상 문자열에서 바꿀부분의 문자열을 새로운문자열로 변환하여 리턴<br>
	 * (참고: java의 replace는 캐릭터를 변환한다.<br>
	 *       jdk 1.4의 replaceAll과 같은 메소드임.<br>
	 * )<br> 
	 * @param s1	대상문자열
	 * @param s2	대상문자열의 바꿀문자열
	 * @param s3	변환할 문자열
	 * @return
	 */
	public static String replace(String s1, String s2, String s3) {

		StringBuffer buf = new StringBuffer(s1);
		
		int len = s2.length();
		
		int ep = 0;
		int sp = 0;
		
		while (true) {
			ep = buf.toString().indexOf(s2,sp);
			sp = ep + s3.length();	
			if (ep == -1)
				break;
			buf.replace(ep, ep + len, s3);
		} // end of while

		return buf.toString();
	}
	
	/**
	 * JSON 오브젝트를 위한 스트링 치환 \r\n, \", \\
	 * @param str
	 * @return
	 */
	public static String convJson(String str){
		str=replace(str,"\\","\\\\");
		str=replace(str,"\r\n","\\r\\n");
		str=replace(str,"\"","\\\"");
		return str;		
	}
	
	
	/**
	 * 오라클 LPAD<br>
	 * @param s1 원본문자열
	 * @param len 반복횟수
	 * @param pad  붙일문자열
	 * @return
	 */
	public static String Lpad(String s1,int len, String pad) {
	
		String t = "";
		
		if(s1 == null) s1 = "";

		t = s1;
	
		for(int i=s1.length();i<len;i++) {
			t = pad + t;
		}
	
		return t;
	}
	
	/**
	 * 오라클 LPAD<br>
	 * @param s1 원본문자열
	 * @param len 반복횟수
	 * @param pad  붙일문자열
	 * @return
	 */
	public static String Lpad2(String s1,int len, String pad) {

		String t = "";
	
		if(s1 == null) s1 = "";

		t = s1;

		for(int i=s1.getBytes().length;i<len;i++) {
			t = pad + t;
		}

		return t;
	}
	
	/**
	 * 오라클 RPAD<br>
	 * @param s1 원본문자열
	 * @param len 반복횟수
	 * @param pad  붙일문자열
	 * @return
	 */
	public static String Rpad(String s1,int len, String pad) {

		String t = "";
	
		if(s1 == null) s1 = "";

		t = s1;

		for(int i=s1.length();i<len;i++) {
			t += pad;
		}

		return t;
	}
	
	/**
	 * 오라클 RPAD<br>
	 * @param s1 원본문자열
	 * @param len 반복횟수
	 * @param pad  붙일문자열
	 * @return
	 */
	public static String Rpad2(String s1,int len, String pad) {

		String t = "";

		if(s1 == null) s1 = "";

		t = s1;

		for(int i=s1.getBytes().length;i<len;i++) {
			t += pad;
		}

		return t;
	}
	
	/**
	 * Number format overloading methods<br>
	 * @param num
	 * @return String
	 */
	public static String convType(double num) {
		
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMaximumFractionDigits(4);
		return nf.format(num);
	}

	/**
	 * Number format overloading methods<br>
	 * @param num
	 * @return String
	 */
	public static String convType(long num) {
		return NumberFormat.getInstance().format(num);
	}

	/**
	 * Number format overloading methods<br>
	 * @param num
	 * @return String
	 */
	public static String convType(int num) {
		return NumberFormat.getInstance().format(num);
	}
	/**
	 * convType(String) overloading methods<br>
	 * @param obj
	 * @return String
	 */
	public static String convType(Object obj) {
    
		if (obj == null)
			return convType("");
    
		return convType(obj.toString());        
	}
	/**
	 * 문자열(숫자값)을 받아 숫자의 금액포맷으로 변환 후 리턴<br>
	 * @param str
	 * @return String
	 */	
	public static String convType(String str) {

		//trim()으로 문자열 앞뒤의 공백을 제거한 후
		//replace()로 내부에 있는 공백을 제거한 후
		//replace()로 다시 콤마를 제거한다.
		String oStr = replace( replace(str.trim()," ",""), ",", "");
    
		if (oStr.equals(""))
			return convNvl(oStr,"0");
		
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMaximumFractionDigits(4);
		return nf.format(Double.parseDouble(oStr));
	}

	/**
	 * 한글변환
	 * @param s1 8859_1 캐릭터셋의 한글 변환
	 * @return
	 * @throws Exception
	 */
	public static String ksc5601(String s1) {
    
    	String t1 = null;
    	
		if (s1 == null)
			return t1;
		
		try {
			t1 = new String(s1.getBytes("8859_1"), "KSC5601");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return t1;
	}
	
	/**
	 * 왼쪽문자기준으로 자리수 절단
	 * @param s1  변수 
	 * @param len 길이
	 * @return
	 */
	public static String Lcut(String s1,int len) {
		
		if(s1 == null || s1.equals("")) return "";
		if(s1.length() < len) return s1;
		return s1.substring(0,len);
	}
	
	/**
	 * 오른쪽문자기준으로 자리수 절단
	 * @param s1  변수 
	 * @param len 길이
	 * @return
	 */	
	public static String Rcut(String s1,int len) {
		
		if(s1 == null || s1.equals("")) return "";
		if(s1.length() < len) return s1;
		return s1.substring(s1.length()-len);
	}
	
	/**
	 * 문자열 비교 치환
	 * @param s1 NULL 비교 스트링
	 * @param s2 NULL 일때 대체
	 * @param s3 NULL 아닐때 대체
	 * @return
	 */
	public static String Decode(String s1,String s2,String s3) {
		
		if(s1 == null || s1.equals("")) {
			return s2;
		}
		return s3;
	}
	


	/**
	 * 일반문자열형태를 HTML의 형태로 바꾼다. 기본적으로 &lt; &gt; 등의 문자는 실제 HTML형태로 변경시 태그를 망가뜨리는
	 * 대상이 될수 있으므로 각각의 tag에 영향을 미치지않게끔 문자를 replace시키도록 한다.
	 * (br태그는 제외한다.)
	 * @param fromText HTML형태로 변경시킬 문자열
	 * @return HTML포맷으로 변경되어진 문자열
	 */
	public static String toHTMLExceptBrTag(String fromText) {
		return toHTMLExceptBrTag(fromText, false);
	}
	/**
	 * 일반문자열형태를 HTML의 형태로 바꾼다. 기본적으로 &lt; &gt; 등의 문자는 실제 HTML형태로 변경시 태그를 망가뜨리는
	 * 대상이 될수 있으므로 각각의 tag에 영향을 미치지않게끔 문자를 replace시키도록 한다.
	 *(br태그는 제외한다.)
	 * @param fromText HTML형태로 변경시킬 문자열
	 * @param replyMode HTML mode or Reply mode를 지정하는 값
	 * @return HTML포맷으로 변경되어진 문자열
	 */
	private static String toHTMLExceptBrTag(String fromText, boolean replyMode) {
		if (fromText == null)
			return "";

		StringBuffer sb = new StringBuffer(100);
		char[] buf = fromText.toCharArray();
		if (replyMode)
			sb.append("> ");
		for (int i = 0; i < buf.length; i++) {
			switch (buf[i]) {
				/*
				 * case ' ': sb.append("&nbsp;"); break;
				 */
				case '<' :
					sb.append("&lt;");
					break;
				case '>' :
					sb.append("&gt;");
					break;
				case '&' :
					sb.append("&amp;");
					break;
				case '"' :
					sb.append("&quot;");
					break;
				case '\'' :
					sb.append("&#39;");
					break;
				case '\t' :
					sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
					break;
//				case '\n' :
//					sb.append("<br>\n");
//					break;
				default :
					sb.append(buf[i]);
			}
		}
		return sb.toString();
	}

	
	
	
	/**
	 * 줄바꿈 처리
	 * @param str
	 * @return
	 */
	public static String replaceLineToBR(String str){
		return str.replaceAll("\r\n","<br>").replaceAll("\n","<br>").replaceAll("\r","<br>");
	}
	
	public static String escapeHTML(String s){
		if (s == null) {
			return null;
		}
		StringBuffer result = new StringBuffer(s.length());
		int len = s.length();
		for (int i=0; i < len; ++i) {
			char c = s.charAt(i);
			switch (c) {
			case '<': result.append("&lt;"); break;
			case '>': result.append("&gt;"); break;
			case '"': result.append("&quot;"); break;
			case '\'': result.append("&#39;"); break;
			case '%': result.append("&#37;"); break;
			case ';': result.append("&#59;"); break;
			case '(': result.append("&#40;"); break;
			case ')': result.append("&#41;"); break;
			case '&': result.append("&amp;"); break;
			case '+': result.append("&#43;"); break;
			default: result.append(c); break;
			}
		}
		return result.toString();
	}
	
	
}
