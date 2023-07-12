package kr.or.korapis.util;

import com.itextpdf.text.BaseColor;

public class PdfDocumentWrite {
    
    /**
     * 이 문서가 참고용 도장이 필요한 [참고용] 문서인지 구분합니다.
     * @Author botbinoo 
     * @since 2023.07.12
     * */
    public static boolean isReferToDoc(String prdNm) {
        
        if(!("한벌꿀(봉인)".equals(prdNm)
            || "봉인".equals(prdNm)
            || "벌집꿀(봉인)".equals(prdNm))
            ){
            return true;
        }
        return false;
    }

    /**
     * 이 문서가 참고용 문서인지 구분하여 문서제목을 리턴합니다.
     * @Author botbinoo 
     * @since 2023.07.12
     * */
    public static String getSubTitleText(String prdNm) {
        if(isReferToDoc(prdNm)) {
            return "참고용 시험 결과 통지서";
        } else {
            return "시험 결과 통지서";
        }
    }

    /**
     * 이 문서가 참고용 문서인지 구분하여 문서제목을 리턴합니다.
     * @Author botbinoo 
     * @since 2023.07.12
     * */
    public static String getSubTitleText2(String prdNm) {
        if(isReferToDoc(prdNm)) {
            return "참고용 시험 성적 통지서";
        } else {
            return "시험 성적 통지서";
        }
    }

    /**
     * 이 문서가 참고용 문서인지 구분하여 문서 테이블의 색상을 리턴합니다.
     * @Author botbinoo 
     * @since 2023.07.12
     * */
    public static BaseColor getTableBaseColor(String prdNm) {
        if(isReferToDoc(prdNm)) {
            return new BaseColor(255,231,216);
        } else {
            return new BaseColor(208,234,237);
        }
    }
}
