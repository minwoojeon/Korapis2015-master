<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>사단법인 한국양봉협회</title>
<link rel="stylesheet" href="/css/default.css" >
<link href="/css/sub.css"  rel="stylesheet" type="text/css" />
<!--[if lte IE 8]>
<script src="js/html5.js" ></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://korapis.weelsystem.co.kr";
var g5_bbs_url   = "weel_bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
<script src="/js/jquery-1.8.3.min.js" ></script>
<script src="/js/common.js" ></script>
<script src="/js/wrest.js" ></script>

</head>
<body>
<div id="skipToContent" title="스킵네비게이션">
		<a href="#main_menu">메뉴 바로가기</a>
		<a href="#search">프로그램 검색 바로가기</a>
		<a href="#footer">카피라이터 바로가기</a>
</div>

<!-- sub_wrap_main START -->
<div id="sub_wrap_main">
		
<jsp:include page="inc/header.jsp" />

<!-- sub_wrap START -->
 	<div id="sub_wrap">

 		<jsp:include page="inc/leftmenu.jsp" />

        <!-- sub_contents START -->
        <div id="sub_contents">

            <!-- sub_con START -->
            <div id="sub_con_box">
            	<div class="sub_top_box">
            		<h2 class="page_title">사양관리</h2>
                	<div class="location">홈 &gt; 양봉산업 정보 &gt; <span>사양관리</span></div>
                </div>
				<div class="sub_body_box">
				
				    <ul class="tab_list grid_4 ver_pc">
				        <li><a href="/jsp/sub3-3.jsp" target="_self">봄철의 꿀벌관리</a></li>
				        <li><a href="/jsp/sub3-3_01.jsp" target="_self">여름철의 봉군관리</a></li>
				        <li><a href="/jsp/sub3-3_02.jsp" target="_self">가을철의 봉군관리</a></li>
				        <li class="on"><a href="/jsp/sub3-3_03.jsp" target="_self">월동준비 및 봉군관리</a></li>
				    </ul>
				    
				    <ul class="tab_list grid_2 ver_m">
                        <li><a href="/jsp/sub3-3.jsp" target="_self">봄철의 꿀벌관리</a></li>
                        <li><a href="/jsp/sub3-3_01.jsp" target="_self">여름철의 봉군관리</a></li>
                        <li><a href="/jsp/sub3-3_02.jsp" target="_self">가을철의 봉군관리</a></li>
                        <li class="on"><a href="/jsp/sub3-3_03.jsp" target="_self">월동준비 및 봉군관리</a></li>
                    </ul>
				
				
				    <h3 class="title_txt">월동준비 및 봉군관리</h3>
				
				    <section>
				        <ul class="timeline">
				            <li class="event">
				                <input type="radio" name="tl-group" checked="" id="s3-3_001">
				                <label class="radio_b" for="s3-3_001">01</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_001" class="h_label">
				                            <h3>월동에 적합한 봉군의 기준 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>월동 사양을 10월 중순이전 까지 끝내게 되면 꿀벌들은 월동의 마지막 준비를 위해서 자연의 기후변화에 순응하기위해 여왕벌은 몸을 줄여가면서 산란을 서서히 중단하게되고 일벌들은 월동에 불필요한 숫벌을 소상 밖으로 쫓아내어 스스로 죽게하는 등 많은 변화가 발생하게 된다. 일벌들은 저장되어 있는 꿀이나 사양액을 전화시켜 숙성된 먹이는 모두 소방에 충만되는 즉시 봉개하여 변질이
				                                없도록 함과 동시에 계속되는 기온의 하강에 마지막 육아중인 유충에 피해가 없도록 최선을 다하고 있을때이다.<br>
				                                이러할때 월동사양을 10월중순 이후 늦게까지 계속 시킨다던가 꿀벌들이 안정을 유지하지 못하고 계속 많은 활동을 하도록 하면 급격한 체력소모로 인해 꿀벌들의 수명이 단축되게 되므로 봉군세가 약군으로 전락하게 될뿐만 아니라 월동에 실패하는 원인이 되기도 한다.<br>
				                                뿐만 아니라 10월에 들어와서도 많은 산란을 하도록 방치하거나 밤낮의 기온차가 심할 때 봉군주변에 유밀이 되는 밀월식물이 있어 꿀벌들의 활동이 심하게되면 오히려 월동에 심각한 피해를 입게 될 수도 있다.</p>
				                            <p>지금부터 12년전 강원도 연천군에 집단으로 자생하고 있던 외뢰식물인 연백초가 현재는 전국으로 퍼져있어 10월말까지 만개되고 있는데 개화기간이 늦고 늦게까지 개화됨으로 인해 꿀벌에게 도움을 주기보다는 오히려 피해를 줄 우려가 많아 양봉인들이 싫어하는 밀원식물로 전락되고 있다. 10월 및 11월의 기온이 계속해서 높을때에는 꿀벌에 도움이되는 밀원식물이 되겠으나 그렇지 못한
				                                금년도와 같은 기온조건에서는 피해가 예상됨으로 연백초가 없는곳으로 옮기는 것이 좋을것으로 생각된다. </p>
				                            <p>월동준비군의 봉군은 지금부터는 안정을 유지한 가운데 많은 활동을 하지 않는 상태에서 조용한 가운데 월동을 맞이하는 것이 가장좋은 관리방법이라고 하겠다. 봉충이 많아 이들이 출방한 후 많은 공방이 생겼을 때에는 10월중순 이후에는 사양을 시켜서는 안되므로 다른 저밀소비로 교환해주거나 소비를 뽑아내어 축소시켜주는 것이 좋다.<br>
				                                첫 추위가 온후 통상 외부 월동포장을 하게되는데 외부 월동포장전에는 소상내부는 보온격리판 등을 이용해서 내부포장을 해주는 것이 좋다. 겨울 월동기간에도 꿀벌은 다른 동물과는 달리 동면<span class="ffdotum">(冬眠)</span>을 하지않고 활동을 중단한체 평소와 같이 집단생활을 하고 있다. 다만 기온의 저하로 산란, 육아, 수밀작업등 모든 활동을 일시 정지하고 있는 것 뿐이다.<br>
				                                여왕봉이 산란을 중단하고 육아작업이 끝나 키우는 유충이 없게되면 꿀벌진드기의 숫놈은 스스로 죽어버리고 암놈만 살아남게 되는데 이때를 이용해서 마지막 진드기 구제작업을 해줄 필요가 있다. 금년도는 가을철의 계속된 가뭄으로 해충들에 의한 피해가 많은 해였다고 생각된다. 특히 대추벌이나 밀원식물들의 가지나 잎사이에 작은 거미줄을 치고사는 작은 개미의 피해가 그 어느해 보다도
				                                피해가 많으므로 계속 주의를 해야하겠다.</p>
				                            <p>봉장주위에 이러한 작은 거미줄이 많을 때에는 거미줄을 제거시켜 주어야하고 거미는 찾아서 모두 죽여야한다. 거미는 살려두고 거미줄만 제거시키면 밤사이에 다시 거미줄을 만들어 놓으므로 꿀벌의 피해를 줄일수가 없다.<br>
				                                특히 추위가 빨리 찾아 올것으로 예상되는 금년겨울은 10월중순에 만개가되어 피고있는 연백초는 꿀벌의 월동에 많은 피해가 예상되므로 연백초가 없는 지역으로 월동장소를 옮겨주는 것도 생각해볼 문제라고 판단된다.</p>
				
				                            <p>월동에 적합한 봉군의 기준</p>
				
				                            <p>월동에 적합한 봉군은 젊은 유봉이 많은 강군이여야 함은 당연한 원칙일 것이다. 그렇다고 젊은 유봉을 많이 양성하고 확보하기 위해 늦은가을인 10월에도 산란을 유도하거나 방치해서는 안된다. 늦게 출방되는 꿀벌들은(10월하순 이후) 꿀벌의 3대요소의 하나인 자연적인 출방이 아니기 때문에 허약체질의 꿀벌로 태어나므로 새로히 출방되는 꿀벌들에 의한 도움보다는 기출방되어 있는
				                                꿀벌들에게 과중한 체력소모만을 시켜 수명단축을 시키는 결과만을 초래하게 되어 오히려 피해가 많게 된다.<br>
				                                여왕벌이 늦게까지 산란을 하는 것은 월동사양의 지연이나 부족이 원인이므로 충분한 월동사양을 적기에 시켜 월동에 사용되는 모든소비는 월동식량으로 충만하게하여 여왕봉이 산란할수 있는 여백을 주지 않도록 하면된다.</p>
				                            <p>월동준비기의 젊은 벌이란 반드시 출방한지 얼마되지 않는 유봉만을 의미하는 것이 아니다. 꿀벌들의 수명은 그들의 체력소모와 직결되므로 출방한 날자는 큰 문제가 되지 않는다. 출방일령보다는 수명이 많이 남아있는 꿀벌을 젊은 꿀벌이라고 보면된다.<br>
				                                즉 꿀벌은 출방한 시기가 언제이며 출방한후 체력소모를 얼마나 했느냐에 따라 젊은벌과 늙은벌로 구분할 수가 있다. 꿀벌들이 출방에서 죽을때까지 꿀벌의 3대요소인 자연, 자유, 습성에 얼마나 적합한 가운데 생활했느냐에 따라 달라진다고 본다. 월동기간 중 일벌의 수명은 다른시기에 비하여 현저하게 길어진다. 통상적으로 체력소모를 적게하는 월동기간에는 6개월은 생존한다. </p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				            <li class="event">
				                <input type="radio" name="tl-group" id="s3-3_002">
				                <label class="radio_b" for="s3-3_002">02</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_002" class="h_label">
				                            <h3>월동군의 자격군 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>월동을 무사히 마칠수 있는 봉군의 자격기준을 어디에 두느냐 하는것에 대해서는 양봉가의 경력 및 기술정도에 따라 여러 가지 이론이 있을수 있겠으나 양봉경험이 많지 안은 초보자에게는 매우 어렵고 궁금한 사항이 아닐수 없다.<br>
				                                꿀벌은 대자연의 기후조건 속에서 많은 밀원식물을 상대로 생활하는 곤충이므로 간단하게 월동군의 자격기준을 설정할 수는 없다고 하겠다. 그러나 양봉산업의 성공요소는 100군의 약군보다는 1군의 강군이 필요하다는 말과같이 강군유지에 있으므로 성공적으로 월동을 마칠수 있는 조건과 기준은 강군유지에 있다는 것을 명심해야 한다.<br>
				                                봉군세가 강하면 강할수록 월동을 더욱더 성공적으로 마칠수 있으나 약세군은 그렇지 못하기 때문이다.</p>
				                            <p>때문에 월동군의 자격기준은 꿀벌의 군세가 최소한 그만하면 되겠다고 느낄 수 있는 소비4∼5매 착봉군 이상을 기준으로 삼아야한다. 그러나 반드시 강군이라야만 월동을 시킬수 있다는 것은 절대아니다. 적절한 보호와 관리를 병행해주면 2매 착봉군 정도의 약군이라도 월동을 무사히 마칠수는 있다. 그러나 약군의 벌들로 월동을 한다는 것은 단지 여왕벌을 내년 봄까지 확보하는 의미 외에는
				                                별다른 의미가 없으며 이러한 봉군들은 아카시아 유밀기까지 채밀군으로 양성하기가 어려우므로 다량의 채밀은 기대할 수가 없게된다.</p>
				                            <p>양봉에 경험이 많지 않은 초보단계에서는 월동이후에까지 미치는 제반문제점들을 파악하지 못할뿐아니라 약군은 여왕벌을 죽이고 합봉을 시켜야 하는데 봉군의 수에만 집착을 한 나머지 많은 봉군수만을 월동시키려고 노력하는 경우를 많이 볼수 있다. <br>
				                                현대 양봉산업의 경영은 강군육성의 관리로 아카시아 벌꿀을 최대한 많이 생산하는데 있으므로 외형상의 많은 군수에만 집착하여 약군을 많이 보유하는 양봉을 해서는 안된다.<br>
				                                또한 우수한 여왕벌을 보유해야 하는데 금년도에 양성된 신왕봉이어야 한다.</p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				            <li class="event">
				                <input type="radio" name="tl-group" id="s3-3_003">
				                <label class="radio_b" for="s3-3_003">03</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_003" class="h_label">
				                            <h3>봉군의 축소 및 합봉 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>월동군의 봉군은 어느정도 밀착을 시켜 착봉소비권(소방의 구멍이 많이 보이지 않을정도의 착봉상태)외의 소비는 모두 뽑아내어야 한다.<br>
				                            </p>
				                            <p>뽑아내는 소비는 화분이 많이 저장되어 있는 소비는 절대 뽑아 내어서는 안된다. 봉군을 착봉소비권에 맞추어 축소시킨 다음 3매군이하의 봉군은 월동후 조춘번식의 자력군이 되지 못하므로 월동전에 모두 합봉을 시켜주는 것이 좋다. 약군을 합봉시킬 때에는 약군의 여왕봉을 죽여 버리고 봉군은 강하게 밀착시킨 다음 4매군이상의 월동자격군에 1매∼2매씩 보충시켜 주면 된다. 이때에는
				                                별다른 합봉법은 없으나 약소군끼리의 합봉은 해서는 안되며 약군을 강군에 보충시키는 방법으로 합봉을 시켜야 한다. 약군끼리의 합봉은 합봉당시에는 강군으로 만들어 진 것으로 보이나 얼마가지 않아 다시 약군으로 전환되어 버리기 때문이다. 합봉작업시 저밀소비의 무단방치등으로 도봉이 발생되지 않도록 주의해야하며 합봉작업은 신속하게 이루어져야하고 작업시에는 반드시 훈연기를 자주
				                                사용하는 것이 좋다.</p>
				                            <p>뽑아낸 저밀소비는 공소비와 혼합하여 보관하지 말고 별도로 보관해 두어야하며 월동포장직전이나 조춘 봉군 번식시에 사용하기 편리하도록 저밀상태 별로 구분하여 보관해 두는 것이 좋다.<br>
				                                가을철에 접어들면서부터 월동직전에 이르기까지 봉군의 군세가 점차 약군으로 전환되는 것은 가을철 및 월동준비군의 관리부주의의 원인도 있겠으나 근본적 원인은 밤꽃 유밀기 이후 화분의 부족에서부터 여름철의 봉군관리에 소홀히한 원인이더 많다고 볼수있다.</p>
				
				                            <p>월동시기에 봉군이 약군으로 변모되는 원인은 다음과 같다.<br>
				                                가. 아카시아 유밀기이후 대용화분을 가을까지 계속 공급해주지 않았을 때<br>
				                                나. 농약 및 오염된 물에 의한 피해방지 대책을 소흘히하여 봉군에 많은 피해가 발 생되었을 때<br>
				                                다. 진드기 구제 및 봉병 예방약제 처리를 하지않았을 때<br>
				                                라. 삼복더위에 봉군을 나무 그늘 밑이나 벌통에 그늘을 지워주지 않고 태양광선에 계속 방치해 두었을 때<br>
				                                마. 먹이를 충분히 공급하지 않고 가끔씩 절양을 시켰을 때<br>
				                                바. 월동사양을 늦게 시켰을 때<br>
				                                사. 해충이나 해적 등에 의한 피해가 많았을 때<br>
				                                아. 10월 하순까지 유밀이 잘되는 밀원식물이 개화되어 있을 때<br>
				                                자. 월동사양시나 가을에 도봉이 발생되었을 때</p>
				
				                            <p>소상에서 뽑아낸 소비는 저밀소비와 공소비로 구분하여 비닐주머니를 만들어 빈벌통에 10매단위로하여 비닐주머니 속에 소비를 넣고 이류화탄소를 약30cc정도 비닐주머니에 직접 부은다음 밀봉시켜 보관해야 한다.</p>
				                            <p>공소비의 보관은 적은 수량 단위 (10매 단위)로 포장하여 보관하는 것이 좋다.<br>
				                                내년봄 공소비를 사용하기위해 비닐주머니를 개봉했을 때 남은 소비가 있을때는 다시 이류화탄소를 재주입해야 하기 때문이다. 한번 이류화탄소를 주입하게되면 비닐주머니에 작은 구멍이라도 생기지 않는다면 5∼6개월은 소충의 피해없이 보관이 가능하다. 저밀이 있는 소비는 공소비보다 이류화탄소를 30%정도만 주입해도 된다.<br>
				                                이류화탄소는 희발성이 휘발유보다 훨씬 빠르므로 사용할 때에는 특히 불조심을 해야한다.<br>
				                                사용하고 남은 이류화탄소는 용기에 반드시 물을 부어 놓아야만 증발되지 않고 보관이 가능하다. </p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				            <li class="event">
				                <input type="radio" name="tl-group" id="s3-3_004">
				                <label class="radio_b" for="s3-3_004">04</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_004" class="h_label">
				                            <h3>월동에 적합한 장소 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>월동에 알맞은 장소는 외부날씨의 변화에 크게 영향을 받지 않는 음지가 양지보다 좋다. 하지만 이른봄 번식시에는 음지보다는 따뜻한 양지가 훨씬 좋기 때문에 월동에도 좋고 봄철에도 좋은곳을 월동장소로 선택하는 것이 좋다.<br>
				                                겨울철의 강한 찬바람을 막을수 있는 곳과 지면의 높고 낮은곳이 없는 평평한 곳이어야하며 습기가 없는 건조한 곳이어야 한다. 배수가 잘되어야하고 봉장주변은 차량이 많이 다니는 곳에서 떨어져 차량의 진동이 느껴지지 않는곳이어야하며 월동기간동안 도로공사나 기타작업이 계속되어 소음과 진동이 없는곳이어야 한다.<br>
				                                10월 하순까지도 개화가 계속되어 유밀이 잘되는 밀월식물이 있는 곳은 피해야 한다. 월동장소는 월동장소에서 내년 봄 번식까지 계속 관리하는 경우와 월동만을 시키고 봄번식은 다른장소에 옮겨 관리하는 경우의 두가지를 생각할 수가 있다. </p>
				                            <p><br>가. 월동장소에서 내년 봄번식까지 같은 장소에서 관리하는 경우 <br>
				                                동일한 장소에서 월동과 봄 관리를 같이할 경우에는 특히 월동 장소의 선택에 주의를 해야한다. 이때에는 월동과 봄관리중 봄관리에 치중해서 장소를 선택하고 월동조건에 맞지 않는 부분은 월동포장이나 월동군에 적합한 봉군관리 방법을 동원해서 월동중에 발생될 수 있는 피해를 최소화 할수 있도록 해야한다.<br>
				                                봄 번식에 편리한 양지바른곳에 월동을 시키게 되면 겨울내내 벌들의 활동이 계속되게 되므로 이를 방지하기 위해 월동포장에 세심한 주의를 기울여야 한다.</p>
				
				                            <p><br>나. 월동만을 시키고 봄번식은 다른장소로 옮길 경우 <br>
				                                월동만을 시킬 경우에는 양지보다 음지에 봉군의 월동장소를 선택하면 꿀벌들은 월동기간 동안 활동이 적게되므로 월동에 도움이 된다.<br>
				                                대신 월동포장시 추위에 대한 대비를 잘 해줄 필요가 있다.</p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				            <li class="event">
				                <input type="radio" name="tl-group" id="s3-3_005">
				                <label class="radio_b" for="s3-3_005">05</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_005" class="h_label">
				                            <h3>월동포장의 시기 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>꿀벌의 월동에 대비한 월동포장은 내부포장과 외부포장의 두종류로 구분할 수가 있으며 통상 내부포장을 먼저한다음 외부포장을 하게된다.</p>
				                            <p><br><strong>가. 꿀벌의 내부포장시기</strong> <br>
				                                꿀벌의 내부포장은 월동사양이 끝나고 난다음 사양시킨 먹이를 꿀벌들이 숙성시킨 이후부터 해주는 것이 좋다. 10월중순 이전에 마지막 정리사양까지 모두 끝나게 되므로 10월중순 이후 봉군을 축소시키면서 내부포장을 하면된다. 내부포장은 편리하고 간단하게 할 수 있는 방법을 선택하는 것이 좋다. <br>
				                                20∼30m/m정도 두께의 스치로폴 양면에 합판을 부착하여 광식사양기와 같은 모양(스치로폴을 모두 합판과 목재로 완전 포장시킨 것)의 보온격리판을 사용해서 축소시킨 착봉소비 양면에 보온격리판을 밀착시켜 놓으면 내부포장으로는 충분하다.<br>
				                                스치로폴만을 그대로 사용하는 것은 내부포장용으로는 적합하지 못하다.</p>
				
				                            <p><br><strong>나. 꿀벌의 외부포장 시기</strong> <br>
				                                꿀벌의 외부포장은 기온이 영하로 떨어지는 철 추위가 왔을 때 실시한다. 때문에 외부포장의 시기는 지역에 따라서 포장하는 시기가 다르다. 첫추위가 오기전에 미리 실시하는 경우도 있으나 이것은 꿀벌의 외부활동을 촉진시키는 결과가 될 수도 있으므로 가능한 조기 외부포장은 하지 않는 것이 좋다. <br><br>
				
				                                꿀벌은 봉병예방이 잘된 건강한 봉군일 경우 월동포장을 하지않아 추위에 피해를 당하는 경우는 절대 없다. 그러나 월동이 끝나고 이른봄철 육아작업이 시작될 때부터 봉군에 보온이 절대적으로 필요하므로 겨울 월동포장은 겨울철 외부의 심한 추위를 면할수 있을정도로 해둔다음 이른봄에 완벽한 포장을 다시 하는 것이 원칙이다.</p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				            <li class="event">
				                <input type="radio" name="tl-group" id="s3-3_006">
				                <label class="radio_b" for="s3-3_006">06</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_006" class="h_label">
				                            <h3>겨울철 스치로폴 소상을 이용한 봉군의 월동 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>최근에는 스치로폴소상의 편리함을 이용하여 봉군의 월동에 목재소상대신 스치로폴 소상을 사용하는 경우가 많은데 꿀벌의 월동용으로는 스치로폴 소상이 적합하지 못하다. 꿀벌의 겨울철 월동기간에는 소상내에서 발생되는 습기에 의해 많은 피해가 파생될수 있으므로 습기발생에 주의를 해야한다.<br>
				                                스치로폴 소상은 보온에는 이상이 없으나 꿀벌들의 봉구온도 및 열기에 의해 자연적으로 발생되는 습기를 제거할수 있는 자정능력이 없으므로 봉군에 피해가 발생될 수가 있다. 그러나 월동을 끝내고 이른봄 봉군의 번식시기에 스치로폴 소상을 적절히 사용하면 봉군의 번식에 많은 도움이 되며 조기봉군의 증식에도 유리한 면이 있다. 이른봄철 봉군의 육아에는 어느정도의 습도가 절대적으로
				                                필요하기 때문이다. 화분 매개용으로 사용되는 비닐하우스용 꿀벌의 관리시에도 스치로폴 소상의 이점은 많다.</p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				            <li class="event">
				                <input type="radio" name="tl-group" id="s3-3_007">
				                <label class="radio_b" for="s3-3_007">07</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_007" class="h_label">
				                            <h3>월동 포장의 종류 및 방법 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>지역에 따라 기온이 영하로 내려가게 되면 봉군의 겨울철 월동 포장을 해야할때이므로 봉군의 월동 포장을 위한 준비는 물론 월동 포장 전에 해야 할 마지막 봉군 관리에 주력해야 한다.<br>
				                                각 봉군별 내검 사항을 기록해두면 이른봄 봉군관리에 도움이 되므로 착봉수, 저밀상태, 화분저장상태, 왕봉상태 등을 기록해 둘 필요가 있다.<br>
				                                월동 포장의 종류 및 방법에는 지역 및 양봉 경력에 따라 여러종류의 다양한 방법이 있을수 있겠으나 월동포장을 하는 근본 목적이 월동기간 동안 꿀벌들이 봉군내에서 4℃∼5℃의 안정된 온도를 계속 유지할수 있도록 하는데 있다.<br>
				                                이러한 봉군내의 안정된 온도유지는 외부 기온의 변화에 따라 쉽게 달라지지 않도록 해주어야 하기 때문에 월동포장을 하는 중요한 목적도 최적의 안정된 온도 유지에 있다고 하겠다.<br>
				                                봉군이 월동기간 동안 봉군내의 안정된 온도 유지를 하기위해서는 외부 월동포장에 앞서 봉군의 마지막 내부 관리에도 세심한 주의를 기울여야 한다. </p>
				
				                            <p><br><strong>가. 봉군의 내부 포장 관리</strong> </p>
				                            <p>----봉군의 내부 포장관리에 대해서는 다음의 사항들에 유의해야 한다.<br><br>
				                                &lt;개포 및 보온상피의 사용&gt;<br>
				                                월동용 개포는 여름철에 사용하는 망사형 엷은 개포는 사용하지 않는 것이 좋으며 두꺼운 면개포로서 공기가 잘 유통되는 천이어야 한다. <br>
				                                통상 개포외에 보온용 상피를 한겹 더 덮어주면 좋다.<br>
				                                보온을 위해 개포위에 신문지나 설탕포대용 종이를 덮어두는 경우가 있는데 이는 공기 유통이 잘 되지 않으므로 권장할 방법이 되지 못한다.<br>
				                                만약 신문지 등을 개포위에 덮을 경우에는 전부 덮지말고 한쪽 모서리는 접어서 소상 내부의 공기가 환기될수 있도록 해주어야 한다.<br>
				                                뀰벌은 월동기간 중에도 열을 발생시키기 위해 계속 꿀을 섭취하게되고 이에따라 가스(탄산가스)와 수분을 배출하기 때문에 월동기간중 환기는 매우 중요하다. <br><br>
				
				                                &lt;소비광 상단의 통로 설치&gt;<br>
				                                소비광 상단에 꿀벌들이 쉽게 넘어 다닐수 있도록 약 1㎝ 두께의 졸대를 4-5개 걸쳐주면 꿀벌들의 통로를 만들어 줌과 동시에 봉군 내부 전체의 온도를 일정하게 유지하도록 해줄 수 있다. 봉구권을 형성하고 있는 벌들이 저밀의 소비에 따라 옆의 저밀소비로 이동할 때 소비하단은 소비 상단보다 냉기가 심하므로 소비상단부에 통로가 없으면 옆의 저밀권 소비면으로 이동을 하지 못하고
				                                부분 아사하는 경우가 생길수도 있다. <br>
				                                졸대 대신에 참나무 숯을 잘게 쪼개어 소비 상단에 걸쳐주면 월동기간내에 봉군에서 자연 발생되는 습기를 숯이 흡수하게되고 봉군내부의 공기를 맑게해주므로 월동에 많은 도움이 되며 월동벌의 수명 연장에도 도움이 된다.<br><br>
				
				                                &lt;소상 내부 공간 처리&gt;<br>
				                                착봉소비를 소상 중앙에 위치시키거나 한쪽으로 위치시킨후 내부 공간을 여러가지 보온재료(짚, 솜, 왕겨, 기타)를 사용하여 채워주기도 하고 공간으로 남겨두는 방법이 있다.<strong></strong>
				                                근본적인 방법에 있어서는 공간을 모두 보온물로 채워주는 것이 원칙이나 많은 봉군을 모두 내부공간을 채워주는 것은 현실적으로 어려우므로 착봉소비 양면 또는 공간쪽면에 격리판이나. 사양기대신 보온 격리판을 사용하는 것으로 대신하면 된다.<strong></strong>
				                                월동에 미치는 효과면에 있어서도 과거와 같은 혹한이 최근 지구의 온난화로 많지 않기 때문에 오히려 내부 공간을 보온물로 채우지 않는 것이 채워줄때보다 월동기간중 꿀벌의 외부 활동을 줄일수 있어 효과적이라고 할수 있다. <strong></strong>
				                                다만 번거러운 면은 있지만 이른 봄철 봉군관리시에 내부 공간을 보온물로 채워준다면 조춘봉군 번식에 많은 도움이 될 수 있다. </p>
				
				                            <p><br><strong>나. 외부 월동 포장 방법</strong></p>
				                            <p>봉군의 외부 월동포장 방법으로는 다음의 2가지로 크게 분류할수 있다.<br>
				                                1) 노지에서 벌들의 출입을 자유로운 상태로 두고 월동 포장을 하는 방법<br>
				                                2) 기존 농산물 보관창고(담배잎 건조창고, 또는 감자 저장창고 등)를 일부 보완하거나 월동사를 별도로 만들어 실내 창고에 봉군을 3-4단으로 적재하여 소문만을 개방시킨채 월동하는 방법<br>
				                                등의 2가지 방법을 생각해 볼수 있다.<br>
				                                현재 활용되고 있는 월동포장방법중 90%이상이 벌들의 출입을 자유로운 상태로두고 노지에서 월동포장을 하는 방법을 활용하고 있으며 그외는 월동사를 만들어 실내에서 월동을 시키거나 지역에 맞는 노지 월동포장과 실내월동법을 절충시킨 노지에서 벌들의 출입을 차단시키고 봉군전면까지 차단시켜 월동포장하는 방법을 일부 활용하고 있는 실정이다. 노지 월동포장에 있어서는 지면 바닥에
				                                비닐을 깔아 습기가 소상내부로 침투하는 것을 막아 주어야하며 외부로부터 물이 스며들지 않도록 포장을 하되 비닐등에의해 복사열이 발생되지 않도록 주의해야 한다.<br>
				                                소상전면은 혹한기를 제외하고는 덮지 않는 것이 좋으나 전면을 덮을 필요가 있을 때에는 소문을 평소보다 배이상 열어주여야 한다.<br>
				                                실내창고 월동에 있어서도 꿀벌들이 발생하는 가스를 배출시킬수 있는 환기 장치에 이상이 없도록하고 실내 온도 변화에도 세심한 주의를 해야한다.</p>
				
				                            <p><br><strong>다. 월동포장이 월동중의 꿀벌에 미치는 영향 </strong></p>
				                            <p>월동중의 꿀벌들은 개별적으로는 생존할수 없지만 집단하여 봉구를 형성하게되면 봉구온이 유지되게되어 영하의 추운날씨에도 꿀벌은 생존할 수 있다.<br>
				                                기온이 영하로 떨어지게되면 꿀벌들은 겨울을 지나는데 절대적으로 필요한 온도를 유지하기 위해서 벌들이 한덩어리가되어 뭉치게 되는데 이것을 봉구<span class="ffdotum">(蜂球)</span>라고한다.<br>
				                                꿀벌들이 봉구를 형성하게되면 봉구내부의 꿀벌들은 꿀을 먹고 열을 발산하게된다.<br>
				                                봉구 외부의 꿀벌과 내부의 꿀벌은 서로 교대해가면서 꿀을 먹고 열을 발산하게되는데 봉구 외부 및 내부의 꿀벌들이 교대하는시간과 꿀벌들의 저밀소비의 량은 월동포장의 상태여하에 따라서 달라지게 된다.<br>
				                                즉 월동포장 및 내부포장이 적절하여 외부 온도에 심한 영향을 받지 않을 정도로 완벽하면 봉구 내·외부의 벌들이 서서히 교대하는 정도로 위치를 바꾸어가면서 많은 먹이를 먹지도 않고 열을 발산하지도 않은채 일정한 온도만을 유지한채 휴면상태에서 조용하게 지나지만 월동포장이 허술하거나 조건이 맞지않아 소상내부의 온도가 외부 온도의 변화에따라 많은 변화가 생길때는 봉구 내부에있는
				                                꿀벌들은 많은 량의 저밀을 소비하게 되고 열을 발생하거나 소동등으로 인해 체력소모가 많게된다.<br>
				                                이러한 상태의 봉군은 다행이 월동을 무사히 마쳤다고해도 이른봄이되면 일시에 노쇠현상이 일어나 많은 꿀벌들이 일찍 죽게되어 약군이 되므로써 조춘 봉군번식에 실패하게 된다.</p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				            <li class="event">
				                <input type="radio" name="tl-group" id="s3-3_008">
				                <label class="radio_b" for="s3-3_008">08</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_008" class="h_label">
				                            <h3>월동군의 관리 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p><br><strong>가. 봉군의 안정 </strong></p>
				                            <p>월동기간중의 봉군에게는 안정을 유지하도록하는 것이 매우 중요하다.<br>
				                                극심한 온도의 변화는 물론 월동봉장의 크고작은 소음과 진동등은 봉군에게 자극을 주게되고 월동중의 꿀벌들이 자극을 받게되면 소동을 일으키게 된다.<br>
				                                월동중에 꿀벌들이 소동을 일으키게 되면 저밀의 소비가 많아지게 되고 꿀벌들이 휴면을 취하지 못하게되므로 체력 소모가 많아져 수명이 단축되게 된다.<br>
				                                또한 꿀벌들이 소동을 일으키므로서 봉구권이 2-3개로 분할되거나 봉구권에서 분리되는 꿀벌이 발생되게되고 이탈된 꿀벌들은 다시 봉구권으로 모여들지 못하고 동사하게 된다.<br>
				                                때문에 월동중에는 봉군을 내검하거나 벌들을 자극 시킬수 있는 어떠한 행위도 해서는 안되며 어떠한 원인으로든 꿀벌이 자극을 받지 않도록 주의해야 한다.</p>
				                            <p><br><strong>나. 양봉장의 감시</strong></p>
				                            <p>월동기간중에는 꿀벌들이 심한 활동을 삼가고 조용히 휴면하고 있다고해서 월동봉장의 감시에 소홀히해서는 안된다.<br>
				                                강풍이나 기타 여러가지 외부요인으로인해 월동포장에 손상을 입게되어 비와 눈에 벌통이 젖게되거나 심한 경우 소상내부에까지 빗물이 스며들어 봉군에 심각한 피해를 입힐수가있기 때문이다.<br>
				                                특히 실내 월동의 경우 실내 내부온도의 상승으로 인해 봉군의 피해를 당하는 경우가 많으므로 수시로 월동사를 감시해야 한다.<br>
				                                노지 월동봉장에서는 들쥐가 소상내부로 침투하여 봉군에 피해를 입히는 경우도 많으므로 이로인한 피해가 발생되지 않도록 주의해야한다. </p>
				                        </div>
				                    </div>
				                </div>
				            </li>
				
				        </ul>
				    </section>
				</div>
				           
            <!--// sub_con END -->
            
			<jsp:include page="inc/partner.jsp" />
			
        </div>
        <!--// sub_contents END -->
	</div>
    <!--// sub_wrap END -->
</div>
<!--// sub_wrap_main END -->

<jsp:include page="inc/footer.jsp" />


<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>