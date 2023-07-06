package kr.or.korapis.admin.sms.coolsms;

import kr.or.korapis.frame.Conf;

public class SetBase {
	
	private String api_key;
	private String api_secret; 
	private String base_url="https://api.coolsms.co.kr/1/";
	
	public SetBase() {
	  Conf conf = Conf.getInstance();
	  this.api_key = conf.getProperty("COOLSMS_API_KEY");
	  this.api_secret = conf.getProperty("COOLSMS_API_SECRET");
	}
	
	public String getApiKey() {
		return api_key;
	}		
	public String getApiSecret() {
		return api_secret;
	}
	public String getBaseUrl() {
		return base_url;
	}
}
