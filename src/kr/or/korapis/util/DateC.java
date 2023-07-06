
package kr.or.korapis.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;


public class DateC {
	private static SimpleDateFormat dateFormatter;


	public static int getKorapisBillYear(){
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 20);
		return cal.get(Calendar.YEAR);
	}


	/**
	 * mysql의 datetime자료형 2013-12-23 00:00:00.0을 받아서 원하는 포맷으로 변경한다.
	 * @throws ParseException
	 */
	public static String chgMysqlDate(String strDATETIME, String fmt){
		String retVal = "";

	    if (dateFormatter == null)
			dateFormatter = new SimpleDateFormat();
		dateFormatter.applyPattern(fmt);

	    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	    Date datetime;
		try {
			datetime = formatter.parse(strDATETIME);
			retVal = dateFormatter.format(datetime.getTime());
		} catch (ParseException e) {
			//e.printStackTrace();
			System.out.println("###날짜처리 요망!!!");
		}
	    return retVal;
	}
	public static String chgMysqlDate(String strDATETIME){
		return chgMysqlDate(strDATETIME, "yyyy-MM-dd");
	}





	public static String getCurrent_str(Date date, String fmt){
		if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
		}
		dateFormatter.applyPattern(fmt);
		return dateFormatter.format(date);
	}
	public static String getCurrent_str(String fmt){
		Calendar cur = Calendar.getInstance();
		if (dateFormatter == null)
			dateFormatter = new SimpleDateFormat();

		dateFormatter.applyPattern(fmt);
		return dateFormatter.format(cur.getTime());
	}
	public static String getCurrent_str(String fmt, int diffDay){
		Calendar cur = Calendar.getInstance();
		cur.add(Calendar.DATE, diffDay);
		if (dateFormatter == null)
			dateFormatter = new SimpleDateFormat();

		dateFormatter.applyPattern(fmt);
		return dateFormatter.format(cur.getTime());
	}


	public static String Date_Format(String day, String type) throws Exception {

		if(day == null){

		}
		else{
			if(day.length() > 7){
				//day = day.substring(2,4)+type+day.substring(5,7)+type+day.substring(8,10)+"&nbsp;"+day.substring(11,16);
				day = day.substring(0,4)+type+day.substring(5,7)+type+day.substring(8,10);
			}

		}
		return day;
	}



	public static String getCurrent_yyyymmddhh24miss(){
		Calendar cur = Calendar.getInstance();

		if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
		}
		dateFormatter.applyPattern("yyyyMMddhhmmss");
		return dateFormatter.format(cur.getTime());
	}
	/**
	 * 사용 예
	 * calMonth(2007, 3, -5) 리턴값: 200610
	 * calMonth(2007, 10, 5) 리턴값: 200803
	 *
	 *  diff 입력된 년월에서 diff만큼 차이가 나는 년월을 YYYYMM형태로 리턴한다.
	 * @param year
	 * @param month
	 * @param diff
	 * @return
	 */
	public static String calMonth(int year, int month, int diff){

		String returnVal = "";
		int val = 1;

		if(month > 0 && month < 13){
			val = month + diff;

			if(val == 0 ){
				month += 1;
			}else if(val < 0){
				year -= 1;
				month = 12 + val;
			}else if(val > 12){
				year += 1;
				month = val - 12;
			}else{
				month = val;
			}
			returnVal = String.valueOf(year) + TextFormatter.Lpad(String.valueOf(month), 2, "0");
		}
		return returnVal;
	}

	/*==================현재 날짜,시각을 호출하는 함수=========================================*/
		/********************************************************************
		*  Function Name      : getDate()
		*  Description        : 서버 현재 날짜 받기
		*  Input Data         :
		*  Output Data        : String 날짜
		/********************************************************************/
		public String getDate() {
			return getDate(getPlainDate());
		}

		/********************************************************************
		*  Function Name      : getDate()
		*  Description        : 서버 날짜에 연,월 더하거나 빼서 받기
		*  Input Data         : flag(연단위,월단위),offset(현재날짜에 더하거나 뺄 수)
		*  Output Data        : String 날짜
		/********************************************************************/
		public String getDate( int flag, int offset ) {
			try {
				StringBuffer buf = new StringBuffer();

			   String[] ids = java.util.TimeZone.getAvailableIDs(-8 * 60 * 60 * 1000);
			   // if no ids were returned, something is wrong. get out.
			   if (ids.length == 0)
					return null;
				java.util.SimpleTimeZone pdt = new java.util.SimpleTimeZone(-8 * 60 * 60 * 1000, ids[0]);
				// set up rules for daylight savings time(섬머타임 적용 여부 설정)
				pdt.setStartRule(java.util.Calendar.APRIL, 1, java.util.Calendar.SUNDAY, 2 * 60 * 60 * 1000);
				pdt.setEndRule(java.util.Calendar.OCTOBER, -1, java.util.Calendar.SUNDAY, 2 * 60 * 60 * 1000);
				// create a GregorianCalendar with the Pacific Daylight time zone
				// and the current date and time

				java.util.Calendar endx_date = new GregorianCalendar(pdt);
				java.util.Date trialTime = new java.util.Date();
				endx_date.setTime(trialTime);

				if( flag == 1 ){
					endx_date.add( java.util.Calendar.MONTH, offset );
				}
				else if( flag == 2 ){
					endx_date.add( java.util.Calendar.DATE, offset );
				}

				buf.append(endx_date.get(endx_date.YEAR));
				if( endx_date.get(endx_date.MONTH) < 9 )
					buf.append('0');
				buf.append(endx_date.get(endx_date.MONTH)+1 );
				if( endx_date.get(endx_date.DATE) <= 9 )
					buf.append('0');
				buf.append(endx_date.get(endx_date.DATE) );

				return buf.toString();

			}catch( Exception e ){
				e.printStackTrace(System.err);
				return null;
			}
		}

		/********************************************************************
		*  Function Name      : getPlainDate()
		*  Description        : 날짜호출(GregorianCalendar)
		*  Input Data         :
		*  Output Data        :
		/********************************************************************/
		public String getPlainDate() {
			GregorianCalendar cal = new GregorianCalendar();
			StringBuffer date = new StringBuffer();
			date.append(cal.get(1));
			if(cal.get(2) < 9)
				date.append('0');
			date.append(cal.get(2) + 1);
			if(cal.get(5) < 10)
				date.append('0');
			date.append(cal.get(5));
			return date.toString();
		}

		/********************************************************************
		*  Function Name      : getPlainDateTime()
		*  Description        : 날짜,시각호출(GregorianCalendar)
		*  Input Data         :
		*  Output Data        :
		/********************************************************************/
		public String getPlainDateTime() {
			GregorianCalendar cal = new GregorianCalendar();
			StringBuffer date = new StringBuffer();
			date.append(cal.get(1));
			if(cal.get(2) < 9)
				date.append('0');
			date.append(cal.get(2) + 1);
			if(cal.get(5) < 10)
				date.append('0');
			date.append(cal.get(5));
			if(cal.get(11) < 10)
				date.append('0');
			date.append(cal.get(11));
			if(cal.get(12) < 10)
				date.append('0');
			date.append(cal.get(12));
			return date.toString();
		}

		/********************************************************************
		*  Function Name      : getPlainDateTime2()
		*  Description        : 날짜,시각호출(GregorianCalendar)
		*  Input Data         :
		*  Output Data        :
		/********************************************************************/
		public String getPlainDateTime2() {
			StringBuffer date = new StringBuffer();
			GregorianCalendar cal = new GregorianCalendar();
			date.append(cal.get(1));
			if(cal.get(2) < 9)
				date.append('0');
			date.append(cal.get(2) + 1);
			if(cal.get(5) < 10)
				date.append('0');
			date.append(cal.get(5));
			if(cal.get(11) < 10)
				date.append('0');
			date.append(cal.get(11));
			if(cal.get(12) < 10)
				date.append('0');
			date.append(cal.get(12));
			if(cal.get(13) < 10)
				date.append('0');
			date.append(cal.get(13));
			return date.toString();
		}

	/*==================날짜형식을 변환시켜주는 함수=========================================*/
		/********************************************************************
		*  Function Name      : formatDate
		*  Description        : 날짜형식에 따라 문자열을 반환한다
		*                       <code>예) formatDate(new java.util.Date(), "yyyy-MM-dd (HH:mm:ss)");<br>
		*                             결과) 2003-03-05 (11:22:33) </code>
		*  Input Data         : Date객체,format
		*  Output Data        : String
		/********************************************************************/
		public String formatDate(Date date, String format) {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}

		/********************************************************************
		*  Function Name      : getDateStr()
		*  Description        : Date객체를 입력받아 "yyyy-MM-dd"형식으로 리턴해준다.
		*  Input Data         : Date객체
		*  Output Data        : String 날짜"yyyy-MM-dd"
		/********************************************************************/
		public static String getDateStr(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyy-MM-dd");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}

		/********************************************************************
		*  Function Name      : getDateStrWithNoBar()
		*  Description        : Date객체를 입력받아 "yyyyMMdd"형식으로 리턴해준다.
		*  Input Data         : Date객체
		*  Output Data        : String 날짜"yyyyMMdd"
		/********************************************************************/
		public static String getDateStrWithNoBar(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyyMMdd");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}

		/********************************************************************
		*  Function Name      : getMonthStrWithNoBar()
		*  Description        : Date객체를 입력받아 "yyyyMM"형식으로 리턴해준다.
		*  Input Data         : Date객체
		*  Output Data        : String 날짜"yyyyMM"
		/********************************************************************/
		public static String getMonthStrWithNoBar(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyyMM");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}



		public static String getYearStrWithNoBar(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyy");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}


		/********************************************************************
		*  Function Name      : getDateTimeStr()
		*  Description        : Date객체를 입력받아 "yyyy-MM-dd HH:mm:ss"형식으로 리턴해준다.
		*  Input Data         : Date객체
		*  Output Data        : String 날짜"yyyy-MM-dd HH:mm:ss"
		/********************************************************************/
		public static String getDateTimeStr(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyy-MM-dd HH:mm:ss");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}

		/********************************************************************
		*  Function Name      : getDateTimeStrWithNoBar()
		*  Description        : Date객체를 입력받아 "yyyyMMdd HH:mm:ss"형식으로 리턴해준다.
		*  Input Data         : Date객체
		*  Output Data        : String 날짜"yyyyMMdd HH:mm:ss"
		/********************************************************************/
		public static String getDateTimeStrWithNoBar(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyyMMdd HH:mm:ss");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}

		/********************************************************************
		*  Function Name      : getDate()
		*  Description        : 날짜 변환
		*  Input Data         : String 날짜 (20040717)
		*  Output Data        : String 날짜 (2004-07-17)
		/********************************************************************/
		public static String getDate(String date) {
			String result = "";

			if( date.length() < 8 ) return date;
			else if(date.length() > 8){
				result = date.substring(0,10);
				return result;
			}

			if(!date.equals("")) {
				StringBuffer newDate = new StringBuffer(date);
				newDate.insert(6, '-');
				newDate.insert(4, '-');
				result = newDate.toString();
			}
			return result;
		}

		/********************************************************************
		*  Function Name      : trimDate() -
		*  Description        : 날짜 변환
		*  Input Data         : String 날짜 (2004-07-17)
		*  Output Data        : String 날짜 (20040717)
		/********************************************************************/
		public static String trimDate(String dateStr) {
			if (dateStr != null) {
				return dateStr.replace('-',' ').trim();
			} else {
				return "";
			}
		}

		/********************************************************************
		*  Function Name      : trimDate2() -
		*  Description        : 날짜 변환
		*  Input Data         : String 날짜 (2004-07-17)
		*  Output Data        : String 날짜 (20040717)
		/********************************************************************/
//		public static String trimDate2(String dateStr) {
//			if (dateStr != null) {
//				return dateStr.replace("-","").trim();
//			} else {
//				return "";
//			}
//		}
		/********************************************************************
		*  Function Name      : getDatetime()
		*  Description        : 날짜 변환
		*  Input Data         : String 날짜 (20040717134522)
		*  Output Data        : String 날짜 (2004년07월17일13시45분22초) (2004/07/17 13:45:22)
		/********************************************************************/
		public static String getDatetime(String datetime, int index) {
			String result = "";
			if(!datetime.equals("")) {
				StringBuffer newDatetime = new StringBuffer(datetime);
				if(index == 0) {
					newDatetime.insert(12, ':');
					newDatetime.insert(10, ':');
					newDatetime.insert(8, ' ');
					newDatetime.insert(6, '/');
					newDatetime.insert(4, '/');
				}
				else if(index == 1) {
					newDatetime.insert(14, " 초");
					newDatetime.insert(12, " 분");
					newDatetime.insert(10, " 시 ");
					newDatetime.insert(8, " 일 ");
					newDatetime.insert(6, " 월 ");
					newDatetime.insert(4, " 년 ");
				}
				result = newDatetime.toString();
			}
			return result;
		}

		/********************************************************************
		*  Function Name      : getDateFormat()
		*  Description        : 날짜(월)를 영문으로 변환
		*  Input Data         : String date
		*  Output Data        : String 영문월
		/********************************************************************/
		public String getDateFormat(String date) {
			String f_year=date.substring(0,4);
			String f_month=date.substring(5,7);
			String f_day=date.substring(8,10);


			if (f_month.equals("01")){f_month="Jan";}
			if (f_month.equals("02")){f_month="Feb";}
			if (f_month.equals("03")){f_month="Mar";}
			if (f_month.equals("04")){f_month="Apr";}
			if (f_month.equals("05")){f_month="May";}
			if (f_month.equals("06")){f_month="Jun";}
			if (f_month.equals("07")){f_month="Jul";}
			if (f_month.equals("08")){f_month="Aug";}
			if (f_month.equals("09")){f_month="Sep";}
			if (f_month.equals("10")){f_month="Oct";}
			if (f_month.equals("11")){f_month="Nov";}
			if (f_month.equals("12")){f_month="Dec";}

			String f_date = f_month + " " + f_day + ", " + f_year;
			return f_date;
		}


		/********************************************************************
		*  Function Name      : Newmark()
		*  Description        : String 날짜를 입력받아 오늘이나 어제날짜일 경우 new마크를 보여주고 아니면 일반마크 보여줌
		*  Input Data         : String 날짜 (2004-09-01)
		*  Output Data        : String html 태그
		/********************************************************************/
		public String Newmark(String var_regidate){
			//오늘과 어제의 데이터 구별
			String var_cdate,var_bdate,var_image="";
			Calendar aDate = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			///////////현재 날짜를 구한다/////////
			var_cdate = df.format(aDate.getTime());
			aDate.add(Calendar.DATE, -1); // 현재날짜에 1일을 뺀다.
			///////////어제 날짜를 구한다/////////
			var_bdate = df.format(aDate.getTime());

			if(var_regidate.equals(var_cdate) || var_regidate.equals(var_bdate))
				var_image="<div style='float:left'><img src='/imgs/bullets/article_new.gif' border='0' align='absmiddle'></div>";
			else
				var_image="<div style='float:left'><img src='/imgs/bullets/article_old.gif' border='0' align='absmiddle'></div>";

			return var_image;
		}

		/********************************************************************
		*  Function Name      : getNextdate()
		*  Description        : String 날짜를 입력받아 다음날을 반환
		*  Input Data         : String 날짜 (2004-09-31)
		*  Output Data        : String 날짜 (2004-10-01)
		/********************************************************************/
		public String getNextdate(String date){
			String var_cdate="";

			String f_year=date.substring(0,4);
			String f_month=date.substring(5,7);
			String f_day=date.substring(8,10);

			Calendar cdate   = Calendar.getInstance();
			cdate.set(Integer.parseInt(f_year), Integer.parseInt(f_month)-1,
				  Integer.parseInt(f_day));
			cdate.add(Calendar.DATE, 1);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			var_cdate = df.format(cdate.getTime());

			return var_cdate;
		}

		/********************************************************************
		*  Function Name      : getAdddate()
		*  Description        : String 날짜를 입력받아 add만큼 더하거나 빼서 반환
		*  Input Data         : String 날짜 (2004-12-31), int add (4)
		*  Output Data        : String 날짜 (2005-01-04)
		/********************************************************************/
		public static String getNextdate(String date,int add){
			String var_cdate="";

			String f_year=date.substring(0,4);
			String f_month=date.substring(5,7);
			String f_day=date.substring(8,10);

			Calendar cdate   = Calendar.getInstance();
			cdate.set(Integer.parseInt(f_year), Integer.parseInt(f_month)-1,
				  Integer.parseInt(f_day));
			cdate.add(Calendar.DATE,add);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			var_cdate = df.format(cdate.getTime());

			return var_cdate;
		}

		/********************************************************************
		*  Function Name      : getLastMonthDay() +
		*  Description        : String 날짜를 입력받아 add만큼 더하거나 뺀 월의 마지막날 반환
		*  Input Data         : String 날짜 (2004-12-01), int add (1)
		*  Output Data        : String 날짜 (2005-01-31)
		/********************************************************************/
		public String getLastMonthDay(String date,int add){
			String var_cdate="";

			String f_year=date.substring(0,4);
			String f_month=date.substring(5,7);
			String f_day=date.substring(8,10);

			Calendar cdate   = Calendar.getInstance();
			cdate.set(Integer.parseInt(f_year), Integer.parseInt(f_month)-1,1);
			cdate.add(Calendar.MONTH,add);
			cdate.add(Calendar.DATE,cdate.getActualMaximum(Calendar.DATE)-1);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			var_cdate = df.format(cdate.getTime());

			return var_cdate;
		}
//	----------------2004-11-03 이광덕 추가 부분 시작 -------------------//

		/********************************************************************
		*  Function Name      : getLastMonth()
		*  Description        : String 날짜를 입력받아 add만큼 더하거나 빼서 반환
		*  Input Data         : int year,int month,int date,int add
		*  Output Data        : String 날짜 (2005-01)
		/********************************************************************/
		public String getLastMonth(int year,int month,int date,int add){
			String var_cdate="";

			Calendar cdate   = Calendar.getInstance();
			cdate.set(year, month-1,date);
			cdate.add(Calendar.MONTH,add);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			var_cdate = df.format(cdate.getTime());

			return var_cdate.substring(0,7);
		}

		/********************************************************************
		*  Function Name      : getLastMonth()
		*  Description        : String 날짜를 입력받아 add만큼 더하거나 빼서 반환
		*  Input Data         : int year,int month,int date,int add
		*  Output Data        : String 날짜 (2005-01)
		/********************************************************************/
		public String getLastMonth(String date,int add){
			String var_cdate= "";
			String f_year	= "";
			String f_month	= "";
			String f_day	= "";
			if(date.length()==10){
				f_year	= date.substring(0,4);
				f_month	= date.substring(5,7);
				f_day	= date.substring(8,10);
			} else if(date.length() == 8){
				f_year	= date.substring(0,4);
				f_month	= date.substring(4,6);
				f_day	= date.substring(6,8);
			} else if(date.length() == 6){
				f_year	= date.substring(0,4);
				f_month	= date.substring(4,6);
				f_day	= "01";
			}


			Calendar cdate   = Calendar.getInstance();
			cdate.set(Integer.parseInt(f_year), Integer.parseInt(f_month)-1,Integer.parseInt(f_day));
			cdate.add(Calendar.MONTH,add);

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			var_cdate = df.format(cdate.getTime());

			return var_cdate.substring(0,7);
		}

		/********************************************************************
		*  Function Name      : getSelectYear()
		*  Description        : 현재년도 기준으로 과거 5년부터 현재년도까지 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : None
		*  Output Data        : codec.getBaseSelected(strYearOption.toString(),strYear) OPTION HTML구문
		/********************************************************************/
		public String getSelectYear(){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strYearOption = new StringBuffer();
			String strYear = "";
			strYear = getDate().replaceAll("-","").substring(0,4);
			for(int i = (Integer.parseInt(strYear)-5);i<=Integer.parseInt(strYear);i++){
				strYearOption.append("<option value='").append(i).append("'>").append(i).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strYearOption.toString(),strYear);
		}

		/********************************************************************
		*  Function Name      : getSelectYear()
		*  Description        : 현재년도 기준으로 (현재년도-add)부터 현재년도까지 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : int add (4)
		*  Output Data        : strYearOption.toString() OPTION HTML구문
		/********************************************************************/
		public String getSelectYear(int add){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strYearOption = new StringBuffer();
			String strYear = "";
			strYear = getDate().replaceAll("-","").substring(0,4);
			for(int i = (Integer.parseInt(strYear)-add);i<=Integer.parseInt(strYear);i++){
				strYearOption.append("<option value='").append(i).append("'>").append(i).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strYearOption.toString(),strYear);
		}

		/********************************************************************
		*  Function Name      : getSelectYear()
		*  Description        : 현재년도 기준으로 (현재년도-add1)부터 (현재년도+add2)까지 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : int add1 (4),int add2
		*  Output Data        : codec.getBaseSelected(strYearOption.toString(),strYear); OPTION HTML구문
		/********************************************************************/
		public String getSelectYear(int add1,int add2){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strYearOption = new StringBuffer();
			String strYear = "";
			strYear = getDate().replaceAll("-","").substring(0,4);
			for(int i = (Integer.parseInt(strYear)-add1);i<=(Integer.parseInt(strYear)+add2);i++){
				strYearOption.append("<option value='").append(i).append("'>").append(i).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strYearOption.toString(),strYear);
		}

		/********************************************************************
		*  Function Name      : getSelectYear()
		*  Description        : 입력받은 기준년도 기준으로 과거 5년부터 기준년도까지 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : String 날짜 (2004)
		*  Output Data        : codec.getBaseSelected(strYearOption.toString(),year) OPTION HTML구문
		/********************************************************************/
		public String getSelectYear(String year){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strYearOption = new StringBuffer();
			for(int i = (Integer.parseInt(year)-5);i<=Integer.parseInt(year);i++){
				strYearOption.append("<option value='").append(i).append("'>").append(i).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strYearOption.toString(),year);
		}


		/********************************************************************
		*  Function Name      : getSelectYear()
		*  Description        : 입력받은 기준년도 기준으로 (기준년도-add)년부터 기준년도까지 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : String 날짜 (2004), int add (4)
		*  Output Data        : strYearOption.toString() OPTION HTML구문
		/********************************************************************/
		public String getSelectYear(String year,int add){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strYearOption = new StringBuffer();
			for(int i = (Integer.parseInt(year)-add);i<=Integer.parseInt(year);i++){
				strYearOption.append("<option value='").append(i).append("'>").append(i).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strYearOption.toString(),year);
		}

		/********************************************************************
		*  Function Name      : getSelectYear()
		*  Description        : String 날짜(년도)를 입력받아 +,-add만큼 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : String 날짜 (2004), int add (4)
		*  Output Data        : strYearOption.toString() OPTION HTML구문
		/********************************************************************/
		public String getSelectYear(String year,int add1,int add2){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strYearOption = new StringBuffer();
			for(int i = (Integer.parseInt(year)-add1);i<=(Integer.parseInt(year)+add2);i++){
				strYearOption.append("<option value='").append(i).append("'>").append(i).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strYearOption.toString(),year);
		}

		/********************************************************************
		*  Function Name      : getSelectMonth()
		*  Description        : 월을 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : None
		*  Output Data        : strYearOption.toString() OPTION HTML구문
		/********************************************************************/
		public String getSelectMonth(){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strMonthOption = new StringBuffer();
			String month = getDate().replaceAll("-","").substring(4,6);
			String strMonth = "";
			for(int i = 1;i<=12;i++){
				if(i<10) strMonth = "0"+i;
				else strMonth = ""+i;
				strMonthOption.append("<option value='").append(strMonth).append("'>").append(strMonth).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strMonthOption.toString(),month);
		}

		/********************************************************************
		*  Function Name      : getSelectMonth()
		*  Description        : 월을 SELECT BOX의 OPTION으로 변환시켜주는 메소드
		*  Input Data         : None
		*  Output Data        : strYearOption.toString() OPTION HTML구문
		/********************************************************************/
		public String getSelectMonth(String month){
			SelectBoxDao Selectbox = new SelectBoxDao();
			StringBuffer strMonthOption = new StringBuffer();
			String strMonth = "";
			for(int i = 1;i<=12;i++){
				if(i<10) strMonth = "0"+i;
				else strMonth = ""+i;
				strMonthOption.append("<option value='").append(strMonth).append("'>").append(strMonth).append("</option> \n");
			}
			return Selectbox.getBaseSelected(strMonthOption.toString(),month);
		}
//	----------------2004-11-03 이광덕 추가 부분 끝 -------------------//


//	----------------2004-11-18 추가 부분 -------------------//
		/********************************************************************
		*  Function Name      : getLastDay()
		*  Description        : 월의 마지막날을 구하는 메소드
		*  Input Data         : String 년월(200411)
		*  Output Data        : int 마지막날
		/********************************************************************/
		public int getLastDay(String date){
			if (date.length() != 6) return 0;
			Calendar cal   = Calendar.getInstance();
			cal.set(Integer.parseInt(date.substring(0,4)), Integer.parseInt(date.substring(4,6))-1, 1);
			return cal.getActualMaximum(Calendar.DATE);
		}

		/**
		 * Description	: 입력받은 날짜가 최근 n일 이내이면 new(이미지) html을 넘겨준다.
		 * Input Data	: 2008-09-01 00:00:00.0
		 * Output Date	:
		 */
		public static String getNewImgHtml(String date, int add){

			boolean inDay = false;
			String returnVal = "";

			if(date != null || !"".equals(date)){
				String f_year=date.substring(0,4);
				String f_month=date.substring(5,7);
				String f_day=date.substring(8,10);

				Calendar cdate   = Calendar.getInstance();
				cdate.set(Integer.parseInt(f_year), Integer.parseInt(f_month)-1, Integer.parseInt(f_day));

				Calendar today = Calendar.getInstance();
				today.add(Calendar.DATE, add);

				inDay = cdate.getTime().after(today.getTime());

				if(inDay){
					returnVal = "NEW";
					returnVal = "<img valign='top' src='/img/icon/ico_n.gif'>";
				}
			}

			return returnVal;

		}



		//####################################################################
		/**
		 * 2009-03-01 혹은 20090301의 형식을 받아서 2009.03.01형태로 변경해준다.
		 */
		public static String getDateToFormat(String strDate){
			StringBuffer retVal = new StringBuffer();
			String yy = "";
			String mm = "";
			String dd = "";

			try{
				if(strDate != null && !"".equals(strDate)){

					if(strDate.length() == 8){
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(4,6);
						dd	= strDate.substring(6);
					}else{
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(5,7);
						dd	= strDate.substring(8,10);
					}

					retVal.setLength(0);
					retVal.append(yy).append(".").append(mm).append(".").append(dd);
				}
			}catch(Exception e){
				//e.printStackTrace();
				retVal.append(strDate);
			}

			return retVal.toString();
		}

		public static String getDateToFormat_min(String strDate){

			String retVal = strDate;

			if(strDate != null && (strDate.length() > 16)){
				retVal = strDate.substring(0, 16);
			}

			return retVal;
		}





		/**
		 * 2009-03-01 혹은 20090301의 형식을 받아서 20090301형태로 변경해준다.
		 */
		public static String getDateToFormat2(String strDate){
			StringBuffer retVal = new StringBuffer();
			String yy = "";
			String mm = "";
			String dd = "";

			try{
				if(strDate != null && !"".equals(strDate)){

					if(strDate.length() == 8){
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(4,6);
						dd	= strDate.substring(6);
					}else{
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(5,7);
						dd	= strDate.substring(8,10);
					}

					retVal.setLength(0);
					retVal.append(yy).append(mm).append(dd);
				}
			}catch(Exception e){
				e.printStackTrace();
				retVal.append(strDate);
			}

			return retVal.toString();
		}

		/**
		 * 2009-03-01 혹은 20090301의 형식을 받아서 2009.03.01형태로 변경해준다.
		 */
		public static String getDateToFormat3(String strDate){
			StringBuffer retVal = new StringBuffer();
			String yy = "";
			String mm = "";
			String dd = "";

			try{
				if(strDate != null && !"".equals(strDate)){

					if(strDate.length() == 8){
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(4,6);
						dd	= strDate.substring(6);
					}else{
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(5,7);
						dd	= strDate.substring(8,10);
					}

					retVal.setLength(0);
					retVal.append(mm).append(".").append(dd);
				}
			}catch(Exception e){
				//e.printStackTrace();
				retVal.append(strDate);
			}

			return retVal.toString();
		}


		public static String getDateToFormat4(String strDate){
			StringBuffer retVal = new StringBuffer();
			String yy = "";
			String mm = "";
			String dd = "";

			try{
				if(strDate != null && !"".equals(strDate)){

					if(strDate.length() == 8){
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(4,6);
						dd	= strDate.substring(6);
					}else{
						yy	= strDate.substring(0,4);
						mm	= strDate.substring(5,7);
						dd	= strDate.substring(8,10);
					}

					retVal.setLength(0);
					retVal.append(mm).append("/").append(dd);
				}
			}catch(Exception e){
				e.printStackTrace();
				retVal.append(strDate);
			}

			return retVal.toString();
		}



		/********************************************************************
		*  Function Name      : getDateTimeStrWithNoBar()
		*  Description        : Date객체를 입력받아 "yyyyMMdd HH:mm:ss"형식으로 리턴해준다.
		*  Input Data         : Date객체
		*  Output Data        : String 날짜"yyyyMMdd HH:mm:ss"
		/********************************************************************/
		public static String getDateTimeStrWithNoBarFull(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyyMMddHHmmss");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}

		/********************************************************************
		*  Function Name      : getDateTimeStrWithNoBar()
		*  Description        : Date객체를 입력받아 "yyyyMMdd HH:mm:ss"형식으로 리턴해준다.
		*  Input Data         : Date객체
		*  Output Data        : String 날짜"yyyyMMdd HH:mm:ss"
		/********************************************************************/
		public static String getDateTime_notelist(Date date) {
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyy-MM-dd HH:mm:ss");
			if (date != null) {
				return dateFormatter.format(date);
			} else {
				return "";
			}
		}



		/**
		 * 20100120형태의 날짜정보를 Date형태로 변경한다.
		 * @param date
		 * @return
		 * @throws ParseException
		 */
		public static Date convertStringToDate(String nowTime) throws ParseException{
	        Date currentTime;

	        //SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMdd"); //개발기
			currentTime = formatter.parse(nowTime);

			return currentTime;
		}

		/**
		 * yyyy-mm-dd hh:mm:ss 형태의 날짜정보를 MM/DD의 형태로 변경한다.
		 * @param date
		 * @return
		 */
		public static String convertDateMMDD(String date){
			String retVal = date;
			try{
				String mm = date.substring(5,7);
				String dd = date.substring(8,10);
				retVal = mm+"/"+dd;

			}catch(Exception e){
				retVal = date;
			}

			return retVal;
		}


		public static String getCurrentYear(){
			Date date = new Date(System.currentTimeMillis());
			return "";
		}


		public static String getCurrentYYYY(){
			return getCurrent("yyyy");
		}
		public static String getCurrentMM(){
			return getCurrent("mm");
		}
		public static String getCurrentDD(){
			return getCurrent("dd");
		}
		private static String getCurrent(String gubun){
			Calendar today = Calendar.getInstance();
			if (dateFormatter == null) {
				dateFormatter = new SimpleDateFormat();
			}
			dateFormatter.applyPattern("yyyyMMdd");

			String retVal = "";
			try{
				retVal = dateFormatter.format(today.getTime());
				if("yyyy".equals(gubun)){
					retVal = retVal.substring(0, 4);
				}else if("mm".equals(gubun)){
					retVal = retVal.substring(4, 6);
				}else if("dd".equals(gubun)){
					retVal = retVal.substring(6, 8);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
			return retVal;
		}



		/**
		 * 입력받은 날짜가 오늘부터 한달 이내인지 알아본다.
		 * @param date
		 * @return
		 */
		public static String isOneMonth(String nowTime){
			String retVal = "N";
			Date date = null;
			Date monthAgo	= new Date(System.currentTimeMillis() + (1000L * 60 * 60 * 24 * 30) );

			try{

				date = convertStringToDate(getDateToFormat2(nowTime));
				if(date.compareTo(monthAgo)  < 0){  //입력받은 날짜가 한달이전임.
					retVal = "Y";
				}
			}catch(Exception e){
				//e.printStackTrace();
			}


			return retVal;
		}


		/**
		 * 입력받은 날짜가 오늘 이전인지 알아본다.
		 * @param date
		 * @return
		 */
		public static String afterToday(String nowTime){
			String retVal = "N";
			Date date = null;
			Date today 		= new Date(System.currentTimeMillis());

			try{
				date = convertStringToDate(getDateToFormat2(nowTime));
				if(date.compareTo(today)  < 0){  //오늘 이후임.
					retVal = "Y";
				}
			}catch(Exception e){
				//e.printStackTrace();
			}


			return retVal;
		}





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
