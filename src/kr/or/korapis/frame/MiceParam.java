package kr.or.korapis.frame;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;


/**
 * 파라미터 null -> "" 처리
 * @author leejunho
 *
 */
public class MiceParam extends HashMap<Object, Object> {

	private static final org.apache.log4j.Logger LOGGER = LogManager.getLogger( MiceParam.class );
	private static final long serialVersionUID = 1L;


	@Override
	public Object get(Object key) {
		Object retObj = super.get(key);
	
		if(retObj != null){
			
			if(retObj instanceof String[]){
				//System.out.println("======================>String[]");
				String[] arr = (String[])retObj;
				
				if(arr!=null && arr.length==1){
					retObj = arr[0];
					if("null".equals(retObj))
						retObj = "";
					
				}else{
					//do nothing, return object is array.
				}
				
			}else if(retObj instanceof String && "null".equals(retObj)){
				//System.out.println("======================>String or 'null' ");
				retObj = "";
			}

		}else{
			//System.out.println("======================>null ");
			retObj = "";
		}
			
		return retObj;
	}
	
	
	
	
	
	public String getString(String key){
		return getString(key, "");
	}	
	
	public String getString(String key, String def){
		Object obj = super.get(key);
		String retVal = def;
		if(obj == null){
			retVal = def;

		}else if( obj instanceof String[] && ((String[])obj).length == 1 ){
			retVal = ((String[])obj)[0];
			if("null".equals(retVal) || "".equals(retVal))
				retVal = def;
			
		}else if( obj instanceof String ){
			retVal = (String)obj;
			if("null".equals(retVal) || "".equals(retVal))
				retVal = def;
			
		}else{
			retVal = def;
		}
		
		return retVal;
	}	
	
	/**
	 * xss적용해서 가져온다.
	 * @param key
	 * @return
	 */
	public String getString_xss(String key){
		/*
		 * 로직처리해줄 것.
		 */
		return getString(key, "");
	}
	
	
	
	
	
	public int getInt(String key){
		return getInt(key, -1);
	}
	public int getInt0(String key) {
		return getInt(key, 0);
	}
	public int getInt(String key, int def){
		Object obj = super.get(key);
		
		if(key == null){
			return def;
		}
		
		
		int ret = def;
		String sTmp = "";
		
		if( obj instanceof String[] && ((String[])obj).length == 1 ){
			sTmp = ((String[])obj)[0];
		}else if( obj instanceof String ){
			sTmp = (String)obj;
		}
		
		if("null".equals(sTmp)){
			ret = def;
		}else{
			try{
				ret = Integer.parseInt(sTmp);
			}catch(Exception e){
				LOGGER.error("key:["+key+"]sTmp:["+sTmp+"] "+e.toString());
				ret = def;
			}
		}
		
		return ret;
	}
	
	
	
	/**
	 * Array일 경우
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public String[] getStringArr(String key) throws Exception{
		Object obj = super.get(key);
		String[] retVal;
		if(obj != null && obj instanceof String[]){
			retVal = (String[])obj;

		}else if(obj!=null && obj instanceof String){
			retVal = new String[]{ (String)obj };
		}else{
			throw new Exception("[MiceHub: Value is not String Array!!]");
		}
		
		return retVal;
	}
	
	public static MiceParam parseRequest(HttpServletRequest request) {
		MiceParam param = new MiceParam();
		Enumeration en = request.getParameterNames();
		String name, values[];
		while (en.hasMoreElements()) {
			name = (String) en.nextElement();
			values = request.getParameterValues(name);
			param.put(name, values);
		}
		return param;
	}

	
	

	
	
}
