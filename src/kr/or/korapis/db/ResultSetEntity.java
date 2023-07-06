
package kr.or.korapis.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.AbstractSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.NoSuchElementException;


public class ResultSetEntity extends AbstractSet {
	
	private final static int NONE = 0;
	private final static int BRACKET = 1;
	private final static int BRACKET_ROUND = 2;
	
	
	private HashMap info = new HashMap();

	private String[] columnName = null;
	private String[] columnTypeName = null;
	private int[] columnType = null; 
	private int[] columnDisplaySize = null; 
	
	private HashMap columnNameHash = new HashMap();

	// private HashMap columnDisplaySize = new HashMap();
	private HashMap[] aRecord;
	private int _columnSize;
	private int _recordSize = -1;
	private int currentCursor = -1;
	private int bookmark = 0;

	private ResultSetMetaData rmd = null;

//	public ResultSetEntity(HashMap listInfo) {
//		this.info = (HashMap) listInfo.get("sizeInfo");
//		this._columnSize = ((Integer) info.get("columnSize")).intValue();
//		this._recordSize = ((Integer) info.get("recordSize")).intValue();
//		this.columnNameHash = (HashMap) listInfo.get("columnNameInfo");
//		this.aRecord = new HashMap[_columnSize];
//		this.aRecord = (HashMap[]) listInfo.get("aRecordInfo[]");
//	}

	public ResultSetEntity(ResultSet rset) throws SQLException, IOException {
		initResultSet(rset);
	}

	private void initResultSet(ResultSet rset) throws SQLException, IOException  {
		char cbuf[] = new char[1024];
		rmd = rset.getMetaData();
		_columnSize = rmd.getColumnCount();
		aRecord = new HashMap[_columnSize];
		_recordSize = 0;
		try {
			columnName = new String[ _columnSize];
			columnTypeName = new String[ _columnSize];
			columnType = new int[ _columnSize];
			columnDisplaySize = new int[ _columnSize];
			
			for (int i = 0; i < _columnSize; i++) {
				columnType[i] = rmd.getColumnType(i + 1);
				columnName[i] = rmd.getColumnName(i + 1).toUpperCase();
				columnTypeName[i] = rmd.getColumnTypeName(i + 1);
				columnNameHash.put( columnName[i], new Integer(i + 1));
				columnDisplaySize[i] = rmd.getColumnDisplaySize(i + 1);
				aRecord[i] = new HashMap();
			}
			// while((rset.next() && (_recordSize*_columnSize) < 300000))
			
			
			Object obj = null;
			boolean isBlob = false;
			while (rset.next()) {
				_recordSize++;
				for (int _columnNumb = 1; _columnNumb <= _columnSize; _columnNumb++) {
					obj = null;
					isBlob = false;
					
					StringBuffer sbuf = new StringBuffer();
					/*
					 * System.out.println("columnNumb : " + _columnNumb);
					 * System.out.println("columnNumb Scale : " +
					 * rmd.getScale(_columnNumb));
					 * System.out.println("columnNumb getColumnTypeName : " +
					 * rmd.getColumnTypeName(_columnNumb));
					 */
					if (rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("long") 
							|| rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("clob")) {
						
						Reader in = rset.getCharacterStream(_columnNumb);
						if( in != null) {
							int charBuff = 0;
							while ((charBuff = in.read(cbuf, 0, 1024)) != -1) {
								sbuf.append(cbuf, 0, charBuff);
							}
						}
						
					//BLOB일 경우 getObject()사용.
					} else if(rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("blob") 
							|| rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("longblob")){
						obj = rset.getObject(_columnNumb);
						isBlob = true;
						
					} else if (rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("integer")) {
						sbuf.append(rset.getInt(_columnNumb));
					} else if (rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("bigint")) {
						sbuf.append(rset.getLong(_columnNumb));
					} else if (rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("double")) {
						sbuf.append(rset.getDouble(_columnNumb));
					} else if (rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("float")
							|| rmd.getColumnTypeName(_columnNumb).toLowerCase().equals("decimal")) {
						if (rmd.getScale(_columnNumb) > 0 && rmd.getScale(_columnNumb) <= 10) {
							sbuf.append(rset.getFloat(_columnNumb));
						} else if (rmd.getScale(_columnNumb) > 10) {
							sbuf.append(rset.getDouble(_columnNumb));
						} else {
							sbuf.append(rset.getLong(_columnNumb));
						}
					} else {
						sbuf.append(rset.getString(_columnNumb));
					}

					
					//blob일경우
					if(isBlob){
						aRecord[_columnNumb - 1].put(new Integer(_recordSize), obj);
					}else{
						if (sbuf.length() > 0) {
							aRecord[_columnNumb - 1].put(new Integer(_recordSize), sbuf.toString());
						} else {
							aRecord[_columnNumb - 1].put(new Integer(_recordSize), "");
						}
					}
				}
			}
			// System.out.println("columnName : " + columnName + "\n recordSize
			// : " + _recordSize);
		} catch (SQLException se) {
			// se.printStackTrace();
			System.out.println("Inital Exception  : " + se.toString());
		} finally {
			rset.close();
		}
	}

	public Object get(int index) {
		// printMessage(req, res, "index= "+index+"<br>");
		if (index >= _columnSize)
			throw new NoSuchElementException("범위를 벗어난 인덱스 값입니다. 인덱스 : " + index);
		return aRecord[index].get(new Integer(currentCursor + 1));
	}

	public Object get(String names) {
		if (!isColumnName(names)){
			//throw new NoSuchElementException("해당 컬럼이름이 없습니다. 이름 : " + names);
			System.out.println("해당 컬럼이름이 없습니다. 이름 : " + names);
			return null;
		}
		return aRecord[((Integer) columnNameHash.get(names.toUpperCase())).intValue() - 1].get(new Integer(currentCursor + 1));
	}
	/**
	 * @deprecated
	 * @param names
	 * @return
	 */
	public Object get_allowNoCol(String names) {
		if (!isColumnName(names))
			return null;
		return aRecord[((Integer) columnNameHash.get(names.toUpperCase())).intValue() - 1].get(new Integer(currentCursor + 1));
	}
	
	

	public boolean isColumnName(String names) {

		String buff = null;
		for (Iterator iter = columnNameHash.keySet().iterator(); iter.hasNext();) {
			buff = iter.next().toString();
			if (names.toUpperCase().equals(buff.toUpperCase())) {
				return true;
			}
		}
		return false;
	}

	public String getColumnName(int index) {
		return columnName[index];
	}

	public HashMap getColumnName() {
		HashMap setColumnName = new HashMap();
		try {
			for (int i = 0; i < rmd.getColumnCount(); i++) {
				setColumnName.put(new Integer(i + 1), rmd.getColumnName(i + 1));
				// System.err.println("colnumnname["+i+"]"+rmd.getColumnName(i+1));
			}
		} catch (Exception e) {
		}
		return setColumnName;
	}
	public String[] getColumnName_arr(){
		return columnName;
	}

	public int getColumnDisplaySize( int columnNumb) {
		return columnDisplaySize[columnNumb];
	}

	public int getColumnType(int columnNumb) {
		return columnType[columnNumb];
	}

	public String getColumnTypeName(int columnNumb) {
		return columnTypeName[columnNumb];
	}
	
	public int size() {
		return this._recordSize;
	}

	public int columnSize() {
		return this._columnSize;
	}

	public int getInt(int index)  {
		return getInt(index, -1);
	}
	public int getInt(int index, int def)  {
		Object obj = get(index);
		try{
			return Integer.parseInt(obj.toString());
		}catch(Exception e){
			return def;
		}
	}

	public int getInt(String columnName) {
		Object obj = get(columnName);
		try{
			return Integer.parseInt(obj.toString());
		}catch(Exception e){
			return -1;
		}
	}
	public int getInt(String columnName, int def) {
		Object obj = get(columnName);
		try{
			return Integer.parseInt(obj.toString());
		}catch(Exception e){
			return def;
		}
	}

	public float getFloat(int index) {
		return Float.parseFloat(get(index).toString());
	}

	public float getFloat(String columnName) {
		return Float.parseFloat(get(columnName).toString());
	}

	public long getLong(int index) {
		return Long.parseLong(get(index).toString());
	}

	public long getLong(String columnName) {
		return Long.parseLong(get(columnName).toString());
	}

	public double getDouble(int index) {
		return Double.parseDouble(get(index).toString());
	}

	public double getDouble(String columnName) {
		return Double.parseDouble(get(columnName).toString());
	}

	
	
	
	/**
	 * 줄바꿈 처리후 표시.
	 * @param columnName
	 * @return
	 */
	public String getStringText(String columnName, String def){
		String str = getString(columnName, def).replaceAll("\r\n","<br>").replaceAll("\n","<br>").replaceAll("\r","<br>");
		return str;
	}
	public String getStringText(String columnName){
		return getStringText(columnName, "");
	}
	

	public String getString(String columnName) {
		return getString(columnName, "", this.NONE);
	}	
	public String getString(String columnName, String def){
		return getString(columnName, def, this.NONE);
	}
	public String getString(int index) {
		return getString(index, "");
	}
	public String getString(int index, String def) {
		String r = "";
		Object obj = get(index).toString();
		if(obj == null || obj.toString().equals("null") || obj.toString().equals("")){
			r = def;
		}else{
			r = obj.toString();
		}
		
		return r;
	}
	public String getString_bracket(String colunmName){
		return getString(colunmName, "", this.BRACKET);
	}
	public String getString_bracketRound(String colunmName){
		return getString(colunmName, "", this.BRACKET_ROUND);
	}
	private String getString(String columnName, String def, int opt){
		String r = "";
		Object obj = get(columnName);
		if(obj == null || obj.toString().equals("null") || obj.toString().equals("")){
			r = def;
		}else{
			r = obj.toString();
		}
		
		if(!"".equals(r)){
			if(opt==this.NONE){
				//do nothing 
			}else if(opt==this.BRACKET){
				r = "["+r+"]";
			}else if(opt==this.BRACKET_ROUND){
				r = "("+r+")";
			}
		}
		
		return r;
	}
	
	
	
	
	/**
	 * @deprecated
	 * @param columnName
	 * @return
	 */
	public String getString_allowNoCol(String columnName) {
		Object obj = get_allowNoCol(columnName);
		return (obj==null) ? "" : obj.toString();		
	}
	

	public int getCurrentIndex() {
		return currentCursor;
	}

	public Iterator iterator() {
		return new Iterator() {
			public boolean hasNext() {
				return (currentCursor++ < (_recordSize - 1));
			}

			public Object next() {
				return getInstance();
			}

			public void remove() {
			}
		};
	}

	public ListIterator literator() {
		return new ListIterator() {
			public int nextIndex() {
				bookmark = currentCursor + 1;
				if (bookmark > _recordSize) {
					bookmark = -1;
				}
				return (bookmark);
			}

			public int previousIndex() {
				bookmark = currentCursor - 1;
				if (bookmark <= 0) {
					bookmark = -1;
				}
				return (bookmark);
			}

			public boolean hasNext() {
				return (currentCursor++ < (_recordSize - 1));
			}

			public boolean hasPrevious() {
				return (currentCursor-- > 0);
			}

			public Object next() {
				return getInstance();
			}

			public Object previous() {
				return getInstance();
			}

			public void set(Object o) {
			}

			public void remove() {
			}

			public void add(Object o) {
			}
		};
	}

	private ResultSetEntity getInstance() {
		return this;
	}

	public void initCursor() {
		currentCursor = -1;
	}

	public boolean next() {
		return (currentCursor++ < (_recordSize - 1));
	}

	public void dump() {
		try {

			System.out.println("Data dump start ===========================================");
			for (int i = 0; i < columnSize(); i++) {
				if (i > 0)
					System.out.print(",");
				System.out.print(getColumnName(i));
			}
			System.out.println();
			System.out.println("-------------------------------------------");
			initCursor();
			while (next()) {
				for (int i = 0; i < columnSize(); i++) {
					if (i > 0)
						System.out.print(",");
					System.out.print(getString(i));
				}
				System.out.println();
			}
			System.out.println("Data dump end ===========================================");
			initCursor();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
