<%@ page import="kr.or.korapis.frame.MiceParam" %>
<%@ page import="kr.or.korapis.db.DBHandler" %>
<%@ page import="kr.or.korapis.db.TransactionHandler" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%!

    public boolean checkQrcd(String category, int startNum, int endNum){
        DBHandler dbh = new DBHandler();
        String sql = "SELECT COUNT(*) FROM korapis_prod_history WHERE prod_category = ? AND prod_seq BETWEEN ? AND ?;";
        int cnt = Integer.parseInt(dbh.getAData(sql, new Object[]{category, startNum, endNum}));
        return cnt == 0;

    }
    public void insertQrcd(String category, int prodSeq){

        int digit = 6; //qrcode 발급 = 7, 미발급 = 6
        TransactionHandler trh = new TransactionHandler();
        String sql = "INSERT INTO korapis_prod_history(prod_category, prod_seq, prod_qrcd, cdate) VALUES(?, ?, ?,NOW());";
        List<Object> objList = new ArrayList<>();
        String prodQrcd = String.valueOf(prodSeq);
        int prodSeqDigit = String.valueOf(prodSeq).split("").length;
        for(int i = prodSeqDigit; i < digit; i++){
            prodQrcd = "0" + prodQrcd;
        }
        prodQrcd = category + "." + prodQrcd;

        objList.add(category);
        objList.add(prodSeq);
        objList.add(prodQrcd);


        try{
            trh.setQueryData(sql, objList.toArray());
            trh.commit();
        }catch (Exception e){
            e.printStackTrace();
            trh.rollback();
        }finally {
            trh.close();
        }
    }
%>
<%
    MiceParam param = MiceParam.parseRequest(request);

    String category = param.getString("category");
    int startNum = param.getInt("startNum");
    int endNum = param.getInt("endNum");



    for(int i = startNum; i <= endNum; i++){
        insertQrcd(category, i);
    }
    /*if(checkQrcd(category, startNum, endNum)){
        for(int i = startNum; i < endNum; i++){
            insertQrcd(category, i);
        }
        out.print("발급 완료");
    }else{
        out.print("중복 qrcode 존재");
    };*/

%>