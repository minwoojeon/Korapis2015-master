<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.poi.ss.usermodel.FormulaEvaluator"%>
<%@page import="kr.or.korapis.frame.Conf"%>
<%@page import="kr.or.korapis.db.TransactionHandler"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="kr.or.korapis.frame.MiceParam" %>
<%@page import="kr.or.korapis.db.DBHandler" %>
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
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				ret = cell.getStringCellValue()+"";
				break;
			default:
				break;
		}
	}
	
	return ret;
}

%>
<%!
public int getList_regnum_tot(String regnum) {


	StringBuffer sql = new StringBuffer();
	DBHandler dbh = new DBHandler();
	
	
	sql.setLength(0);
	sql.append("\n SELECT count(regnum) ");
	sql.append("\n	FROM `korapis_test2` ");
	sql.append("\n 	WHERE del_yn IS NULL AND regnum like '%").append(regnum).append("%'");
	
	
	return Integer.parseInt(dbh.getAData(sql.toString()));
};
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
	//플루바리네이트	플루메쓰린	그레이아노톡신	기타		성상		물불용물	산도		사카린나트륨	타이르색소	이성화당	판정			시험완료일 등급판정
	//플루바리네이트	플루메쓰린	그레이아노톡신	gita	sung	hwoi	sando	gammoryo	tarr		esung	test_rslt	test_endd_date						등급판정
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	
	
	Object[] obj = null;
	sql.setLength(0);
	sql.append("\n	INSERT INTO `korapis_test2`( 	"); 
	sql.append("\n		sel_issuenum, mmbr_idnt, bongin,han, recv_date, 검체표시, regnum, rqst_prdt_name,   	");
	//sql.append("\n		wght, aa_F1, aa_G1, aa_S1, aa_f2, aa_g3, aa_s2, sgar, grap_sgar, sung, wter, june_sgar, 	");
	sql.append("\n		 wter, june_sgar, 	");
	sql.append("\n		ja_sgar, hmf, c12, fng, 클로암페니콜, 니트로퓨란, 설폰아마이드, doxine, merazine, methoxazole, pyridine, 	");
	sql.append("\n		매크로라이드, erythro, spira, tilmico, tyrosin, 베타락탐, amoxi, ampi, penicillin, 네오마이신, 스트렙토마이신, strep, dihydro, 옥시테트라, 	");
	sql.append("\n		테트라사이클린, chlor, demeclo, tetra, doxy, 퀴놀론1, enro, cipro, 퀴놀론2, dano, nor, oflo, 브로모프로필레이트, 시미아졸, 쿠마포스, 아미트라즈, 	  	");
	sql.append("\n		플루바리네이트, 플루메쓰린, 그레이아노톡신, gita, sung_valu, hwoi, sando, gammoryo, tarr, esung, test_rslt, test_endd_date, 등급판정,  	");
	sql.append("\n		`TS`,regnum_cnt 	");
	sql.append("\n )VALUES(  	");
	sql.append("\n		?, ?, ?, ?, ?, ?, ?, ?	"); 
	//sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	");
	sql.append("\n		, ?, ? 	");
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	");
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	"); 
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	"); 
	sql.append("\n		, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? 	");
	sql.append("\n		, now(),?	");
	sql.append("\n )	");
	StringTokenizer st = new StringTokenizer(sql.toString(), "?");
	int cnt = st.countTokens();
	obj = new Object[cnt - 1];

	
	POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(f));
	HSSFWorkbook workbook = new HSSFWorkbook(fs);
	HSSFSheet sheet = workbook.getSheetAt(0);  
	int rows = sheet.getPhysicalNumberOfRows();
	FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator(); // 수식 계산 시 필요!!!!!!
	
	DecimalFormat df = new DecimalFormat("###.##");
	DecimalFormat df2 = new DecimalFormat("###.#");
	
	
	for(int rowIndex=1; rowIndex<=rows; rowIndex++){
		HSSFRow row = sheet.getRow(rowIndex);
		System.out.println("rows : "+rows);
		System.out.println("rowIndex:"+rowIndex+" ");
		
		if(row != null){
			//의뢰자아이디가 없는 경우 skip한다.
			if(row.getCell((short)1)==null 
				|| (row.getCell((short)1)!=null && "".equals(row.getCell((short)1).getStringCellValue().trim())) ){
				//System.out.println("\t skip-의뢰자아이디없음");
				continue;
			}
			
			int idx = 0;
			String s = "";
			String regnum = "";
			
			//셀이 몇개인지 확인.
			int cells = row.getPhysicalNumberOfCells();
			
			System.out.println("cell size check:::::::::::::::::::::"+cells);
			
			for(int i=0; i<77; i++){
				
				if(i==6 || i==22){//이름/맥아당 미사용
					continue;
				//무게, F,G,S,f,g,s,과당,포도당,성상 미사용(숨겨진셀 J부터S까지)
				}else if(i > 8 && i < 19){
					continue;
				//탄소동위원소비 앞에 "-" 를 붙여준다.
				}else if(i==24){
					s = "-"+get_cell_by_type(row.getCell((short)i));
				
				}else{
					//셀을 인식못하는경우가 있음.
					//셀을 인식 못하는 경우에 따라 그셀은 데이터가 없으므로 빈셀을 생성한다.
					if(row.getCell(i)==null){
						row.createCell(i);
					}
					HSSFCell cell = row.getCell(i);
					
					switch (cell.getCellType()) {        
						case HSSFCell.CELL_TYPE_FORMULA:
							if(!(cell.toString().equalsIgnoreCase("")) ){
								if(evaluator.evaluateFormulaCell(cell)==HSSFCell.CELL_TYPE_NUMERIC){
									double fddata = cell.getNumericCellValue();         
									s = df.format(fddata);
								}else if(evaluator.evaluateFormulaCell(cell)==HSSFCell.CELL_TYPE_STRING){
									s = cell.getStringCellValue();
								}else if(evaluator.evaluateFormulaCell(cell)==HSSFCell.CELL_TYPE_BOOLEAN){
									boolean fbdata = cell.getBooleanCellValue();         
									s = String.valueOf(fbdata);         
								}else{
									s = get_cell_by_type(row.getCell((short)i));
								}
								break; 
							}
						default:
							
							//셀타입이 numeric일경우 
							if(cell.getCellType() == 0){
								if(i > 18 && i <26){
									if(i > 18 && i <25){
										double fddata = cell.getNumericCellValue();         
										s = df2.format(fddata);
									}else if(i == 25){
										double fddata = cell.getNumericCellValue();         
										s = df.format(fddata);	
									}
								}else{
									s = get_cell_by_type(row.getCell((short)i));
								}
							}else{
								s = get_cell_by_type(row.getCell((short)i));
							}
							
								
					}
				}
				//test_rslt는 적합/부적합 2가지만 사용된다.
				//15-07-08 판정 결과를 직접입력한 데이터를 넣는방식으로 변경.
				//DB구조 test_rslt 컬럼 형식 enum에서 varchar로 변경함.
				//기존 enum 초기화값이 제거됨.
				/* if(i==73 && !("적합".equals(s) || "부적합".equals(s)) ){
					s = "부적합";						
				} */
				//한벌꿀은 0,1만 들어온다.
				if(i==3){
					s = (int)Double.parseDouble(s)+"";
				}else if(i==7){
					regnum=s;
				}
				obj[idx++] = s;
			}
			int regnum_tot = getList_regnum_tot(regnum);
			
			if(regnum_tot>0){
				obj[64]=obj[64]+String.valueOf(regnum_tot);	
			}
			
						
		}else{
			System.out.println("===============row null continue===============");
			continue;
			
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