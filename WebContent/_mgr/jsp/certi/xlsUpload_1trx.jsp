<%@page import="kr.or.korapis.frame.Conf"%>
<%@page import="kr.or.korapis.db.TransactionHandler"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>  
<%@ page import="java.net.*" %>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8"%>
<%!
public String get_cell_by_type(HSSFCell cell){
	String ret = "";
	
	if(cell!=null){
		switch(cell.getCellType()){
		
			case HSSFCell.CELL_TYPE_STRING:
				ret = cell.getStringCellValue();
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:
				ret = cell.getNumericCellValue()+"";
				break;
			default:
				break;
		}
	}
	
	return ret;
}

%>
<% 


String savePath= Conf.getInstance().getProperty("WEBROOT")+"upload_excel/";	//저장경로 
boolean isSuc = false;

int sizeLimit = 25 * 1024 * 1024 ; 			
String filename = "";
String ofilename = "";
int filesize = 0;
StringBuffer sql = new StringBuffer();
int inscnt = 0;
TransactionHandler trh = null;
try{
	trh = new TransactionHandler();
	//trh.setTrace(true);
	File dir = new File(savePath);
	
	MultipartRequest multi= new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy() );
	Enumeration e = multi.getFileNames();
	String strName = (String) e.nextElement();
	strName = URLDecoder.decode(strName);
	File f = new File(savePath+multi.getFilesystemName(strName));


	
	//발급번호 
	//sel_issuenum
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//의뢰자ID	봉인번호	한벌꿀	접수일		검체표시		성명			접수번호		시험항목				무게		
	//mmbr_idnt	bongin	han		recv_date	검체표시		**(없음)**			regnum		rqst_prdt_name				wght	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//F		G		S		f		g		s		과당		포도당		성상	수분		전화당		
	//aa_F1	aa_G1	aa_S1	(aa_f2)	(aa_g3)	(aa_s2)	sgar	grap_sgar	sung_valu	wter	june_sgar	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//자당		맥아당(삭제)	HMF	탄소동위원소	F/G	클로암페니콜	니트로퓨란	설폰아마이드	doxine	merazine	methoxazole	pyridine	
	//ja_sgar	**(없음)**	hmf	c12			fng	클로암페니콜	니트로퓨란	설폰아마이드	doxine	merazine	methoxazole	pyridine	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//매크로라이드	erythro.	spira.	tilmico.	tyrosin	베타락탐	amoxi	ampi	penicillin	네오마이신	스트렙토마이신	strep	dihydro	옥시테트라	
	//매크로라이드	erythro		spira	tilmico		tyrosin	베타락탐	amoxi	ampi	penicillin	네오마이신	스트렙토마이신	strep	dihydro	옥시테트라	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//테트라사이클린	chlor	demeclo	tetra	doxy	퀴놀론1	enro	cipro	퀴놀론2	dano	nor	oflo	브로모프로필레이트	시미아졸	쿠마포스	아미트라즈	
	//테트라사이클린	chlor	demeclo	tetra	doxy	퀴놀론1	enro	cipro	퀴놀론2	dano	nor	oflo	브로모프로필레이트	시미아졸	쿠마포스	아미트라즈	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//플루바리네이트	플루메쓰린	그레이아노톡신	기타		성상		물불용물	산도		사카린나트륨	타이르색소	이성화당	판정			시험완료일
	//플루바리네이트	플루메쓰린	그레이아노톡신	gita	sung	hwoi	sando	gammoryo	tarr		esung	test_rslt	test_endd_date
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	
	
	Object[] obj = null;
	sql.setLength(0);
	sql.append("\n	INSERT INTO `korapis_test2`( 	"); 
	sql.append("\n		sel_issuenum, mmbr_idnt, bongin,han, recv_date, 검체표시, regnum, rqst_prdt_name, wght,  	");
	sql.append("\n		aa_F1, aa_G1, aa_S1, aa_f2, aa_g3, aa_s2, sgar, grap_sgar, sung_valu, wter, june_sgar, 	");
	sql.append("\n		ja_sgar, hmf, c12, fng, 클로암페니콜, 니트로퓨란, 설폰아마이드, doxine, merazine, methoxazole, pyridine, 	");
	sql.append("\n		매크로라이드, erythro, spira, tilmico, tyrosin, 베타락탐, amoxi, ampi, penicillin, 네오마이신, 스트렙토마이신, strep, dihydro, 옥시테트라, 	");
	sql.append("\n		테트라사이클린, chlor, demeclo, tetra, doxy, 퀴놀론1, enro, cipro, 퀴놀론2, dano, nor, oflo, 브로모프로필레이트, 시미아졸, 쿠마포스, 아미트라즈, 	  	");
	sql.append("\n		플루바리네이트, 플루메쓰린, 그레이아노톡신, gita, sung, hwoi, sando, gammoryo, tarr, esung, test_rslt, test_endd_date,   	");
	sql.append("\n		`TS` 	");
	sql.append("\n )VALUES(  	");
	sql.append("\n		?, ?, ?, ?, ?, ?, ?, ?, ?	"); 
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	");
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	");
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	"); 
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	"); 
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	");
	sql.append("\n		, now()	");
	sql.append("\n )	");
	StringTokenizer st = new StringTokenizer(sql.toString(), "?");
	int cnt = st.countTokens();
	obj = new Object[cnt - 1];

	
	
	POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(f));
	HSSFWorkbook workbook = new HSSFWorkbook(fs);
	HSSFSheet sheet = workbook.getSheetAt(0);  
	int rows = sheet.getPhysicalNumberOfRows();
	
	//System.out.println("rows : "+rows);
	for(int rowIndex=1; rowIndex<rows; rowIndex++){
		HSSFRow row = sheet.getRow(rowIndex);
		//System.out.println("rowIndex:"+rowIndex+" ");
		
		if(row != null){
			//의뢰자아이디가 없는 경우 skip한다.
			if(row.getCell((short)1)==null 
				|| (row.getCell((short)1)!=null && "".equals(row.getCell((short)1).getStringCellValue().trim())) ){
				//System.out.println("\t skip-의뢰자아이디없음");
				continue;
			}
			
			int idx = 0;
			String s = "";
			for(int i=0; i<75; i++){
				if(i==6 || i==22){//이름/맥아당 미사용 
					continue;
				}else{
					s = get_cell_by_type(row.getCell((short)i));
				}
				//test_rslt는 적합/부적합 2가지만 사용된다.
				if(i==73 && !("적합".equals(s) || "부적합".equals(s)) ){
					s = "부적합";						
				}
				//한벌꿀은 0,1만 들어온다.
				if(i==3){
					s = (int)Double.parseDouble(s)+"";
				}
				obj[idx++] = s;
			}
		}
		
		trh.setQueryData(sql.toString(), obj);
		inscnt++;
	}
	trh.commit();
	
	
	filesize = (int)f.length();
	filename = URLEncoder.encode(((String)multi.getFilesystemName(strName)).replaceAll(" ","%20"),"utf-8");
	ofilename=URLEncoder.encode(((String)multi.getOriginalFileName(strName)).replaceAll(" ","%20"),"utf-8");
	/* 
	filename = ((String)multi.getFilesystemName(strName)).replaceAll(" ","%20");
	ofilename=((String)multi.getOriginalFileName(strName)).replaceAll(" ","%20");
	 */
	
	isSuc= true;
}catch(Exception e) {
	e.printStackTrace();
	trh.rollback();
	isSuc = false;
	inscnt = 0;
}finally{
	trh.close();
}


%>


<body>
<form name="frmReload" method="post" action="/adminCerti.do" target="">
<input type="hidden" name="selAction" value="excelconfirm"/>
</form>
</body>

<script>

<%if(isSuc){%>
alert("업로드가 완료되었습니다.(총<%=inscnt %>건)");
<%}else{%>
alert("업로드시 오류가 발생했습니다.");
<%}%>
document.forms.frmReload.submit();
</script>