# 사단법인한국양봉협회 홈페이지 프로젝트

## 실행환경
- Java 7 이상
- Maven Project
- MySQL 8.0

## 프로젝트 구조
- `/src` - Java 소스 및 Resource 폴더 (classpath)
- `/WebContent` - Web App Root (JSP, Static files)
  * `/WebContent/_mgr` - 관리자용 페이지 (Struts 1.3.10 views)
  * `/WebContent/book_beeplant` - 한국의 밀원 식물 현황
  * `/WebContent/datafile` - 업로드 파일 경로
  * `/WebContent/jsp` - 양봉협회 홈페이지 소스 (JSP)

## 설정파일 셋업
 - `/src/exhibition.properties.original` 파일의 내용을 `/src/exhibition.properties`로 복사
 - `exhibition.properties`에서 `WEBROOT`를 Web App Root 경로와 일치시킨다. (개발환경에서는 `/WebContent` 디렉토리의 절대 경로, 마지막 `/` 기호 필수)
 - `exhibition.properties`에서 `COOLSMS_API_KEY`, `COOLSMS_API_SECRET`은 [Cool SMS](https://coolsms.co.kr)에 가입 후 API Key, Secret을 발급받아 입력
 - 사용하는 Jakarta Server가 Apache Tomcat이 아니라면 `/src/log4j2.xml`의 `${sys:catalina.base}`를 로그를 쌓기에 적절한 경로로 변경
 
## JDBC Connection
본 프로젝트는 JNDI 방식 JDBC Connection을 사용합니다. `kr.or.korapis.db.ConnectDB`의 생성자를 참고 부탁드립니다. 다른 방식으로 자유롭게 변경 하실 수 있습니다.

- url = "jdbc:mysql://localhost:3306/korapis?zeroDateTimeBehavior=convertToNull&amp;useOldAliasMetadataBehavior=true&amp;autoDeserialize=true&amp;autoReconnect=true&amp;serverTimezone=UTC" 
- driverClassName = "com.mysql.cj.jdbc.Driver"
- name = "jdbc/MySqlDB" (JNDI Name)

Apache Tomcat 사용중이시라면 `<Context>` 태그 안에 다음 예시처럼 `<Resource>`태그를 넣으시면 됩니다.

```xml
<Resource auth="Container"
        type="javax.sql.DataSource"
        name="jdbc/MySqlDB"
        driverClassName="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://127.0.0.1:3306/korapis?zeroDateTimeBehavior=convertToNull&amp;useOldAliasMetadataBehavior=true&amp;autoDeserialize=true&amp;autoReconnect=true&amp;serverTimezone=UTC"
        username="mysql-username"
        password="mysql-password"
        maxActive="20"
        maxIdle="10" 
        maxWait="-1"
    />
```# Korapis2015-master
