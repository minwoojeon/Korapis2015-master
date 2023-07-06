package kr.or.korapis.frame;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class Conf extends Properties {

	static final long serialVersionUID = 1L;
	
	private static Conf instance = null;
	private static final String PROPERTIES_NAME = "exhibition.properties";
	private static final Logger LOG = LogManager.getLogger( Conf.class );
	
	
	private Conf() throws IOException  {
		super();
		InputStream in = null;

		try {
			String propPath = System.getProperty(PROPERTIES_NAME);
			if (propPath != null) {
				LOG.info("설정파일 ["+PROPERTIES_NAME+"]의 경로: "+propPath);
				in = new FileInputStream(new File(propPath));
			} else {
				in = Conf.class.getClassLoader().getResourceAsStream(PROPERTIES_NAME);
			}
			this.load(in);
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				//ignored
			}
		}
	}
	
	public static synchronized Conf getInstance() {
		if (instance == null) {
			try {
				instance = new Conf();
			} catch (Exception ex) {
				LOG.error("설정파일 ["+PROPERTIES_NAME+"]의 객체생성 실패.");
				ex.printStackTrace();
			}
		}
		return instance;
	}
	
}
