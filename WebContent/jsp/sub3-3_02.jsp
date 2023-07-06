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
				        <li class="on"><a href="/jsp/sub3-3_02.jsp" target="_self">가을철의 봉군관리</a></li>
				        <li><a href="/jsp/sub3-3_03.jsp" target="_self">월동준비 및 봉군관리</a></li>
				    </ul>
				    
				    <ul class="tab_list grid_2 ver_m">
                        <li><a href="/jsp/sub3-3.jsp" target="_self">봄철의 꿀벌관리</a></li>
                        <li><a href="/jsp/sub3-3_01.jsp" target="_self">여름철의 봉군관리</a></li>
                        <li class="on"><a href="/jsp/sub3-3_02.jsp" target="_self">가을철의 봉군관리</a></li>
                        <li><a href="/jsp/sub3-3_03.jsp" target="_self">월동준비 및 봉군관리</a></li>
                    </ul>
				
				
				
				    <h3 class="title_txt">가을철의 봉군관리</h3>
				
				    <section>
				        <ul class="timeline">
				            <li class="event">
				                <input type="radio" name="tl-group" checked="" id="s3-3_001">
				                <label class="radio_b" for="s3-3_001">01</label>
				                <div class="content-perspective">
				                    <div class="content">
				                        <label for="s3-3_001" class="h_label">
				                            <h3>봉군의 밀착 및 산란의 밀집 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>여름철 혹서기가 지나고나면 가을철을 맞이하게 되는 것은 자연의 섭리라고 하겠다.<br>
				                                봉군관리에 있어 가을은 혹서기가 끝나는 8월중순 이후부터 월동포장 전까지를 가을철 봉군관리 시기라고 보면 된다.<br>
				                                가을철 봉군관리에서 우선 먼저 생각해야할 사항은 봉군의 월동 즉 겨울철이 임박했다는 사실일 것이다. 때문에 이때부터는 봉군관리를 월동에 목표를 두고 관리해주어야 한다.<br>
				                                봄철 및 여름철과는 달리 번식력도 점차 저하되기 시작하므로 자연의 밀원과 대용화분 및 사양을 통해 최대한으로 산란을 촉진시킬수 있도록 관리해야 한다. 최종채밀은 늦어도 9월초순까지는 끝내고 월동식량 공급에 임해야한다.</p>
				                            <p>계속해서 해충(특히 대추벌), 해적에 의한 피해방지에 노력해야하며 진드기 구제에도 만전을 기해야 한다. <br>
				                                지금까지는 번식 위주의 관리를 해옴으로써 인공분봉이나 무리증소를 시켜 봉군세 확장에 주력해 왔으나 가을철을 맞이하게 되면 우선 소비를 축소시켜 꿀벌들을 밀착시킴으로서 점차적으로 착봉상태가 좋도록 해주어야 한다.<br>
				                                그렇게 하므로서 가을철의 산란역시도 봄철때와 같이 가능한 전면 산란에 가깝도록 산란이 밀집되도록 해주어야한다. 소비수가 착봉벌의 수량에 비해 과도하게 많게되면 여왕봉이 산란을 소비마다 일정부분에만 분산하여 산란을 하게된다.</p>
				                            <p>때문에 산란이 분산되지 않고 밀집되도록 꿀벌을 밀착시켜 주어야한다.<br>
				                                여름철 혹서기가 끝난후 8월하순경부터 산란이 되지 않은 소비는 격리판이나 사양기 넘으로 넘겨놓거나 그렇지 않으면 소상밖으로 뽑아내는것도 좋다.<br>
				                                그러나 이러한 시기를 놓쳐 매소비장마다 부분적인 산란육아 소비가 있어 소비축소에 어려움이 있을때는 출방이 임박한 봉충소비를 사양기 뒤로 옮겨놓아 축소를 유도할수도 있다.<br>
				                                물론 이때에는 사양기 뒤에는 1매벌 이상의 벌들이 밀집될수 있도록 해야한다.<br>
				                                봉군의 번식은 봄철과는 비교가 안될만큼 떨어진다.</p>
				                            <p>봄철에는 낮은온도에서도 산란이 잘가며 육아작업도 순조롭지만 가을철에는 20 이하의 기온으로 내려가면서 기온이 3∼4 더 떨어지게 되면 키우던 유충을 봅아버리는 경우도 발생하게 된다.<br>
				                                때문에 여름철 나무그늘 밑이나 그늘을 지워준 봉군은 화분이 많이 반입되는 곳으로 옮겨 햇빛을 받게하는 것이 좋다.<br>
				                                9∼10월에 출방하는 벌들과 산란된 벌들이 월동을 넘기고 다음해 봄까지 살아남아 세대교체를 이룩할때까지 봄벌육성 임무를 담당하게 된다.<br>
				                                그러므로 9∼10월에 출방 및 산란된 벌들이 건강하게 육아되고 과도한 체력소모를 하지 않도록 해주어야만 월동을 무사히 마칠수가 있게된다.<br>
				                                가을에는 육아작업 보다는 저밀작업에 더욱더 민감하게 활동하므로 여름철에비해 많은 차이가 있다.</p>
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
				                            <h3>가을철의 채밀 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>가을철에는 밤낮의 기온차이가 심하고 기온도 내려가게 되므로 꿀벌들의 수밀작업에 어려움이 많을뿐 아니라 꿀벌들의 활동시간도 많이 단축된다.<br>
				                                옛날과 같이 메밀, 싸리, 뜰깨 등의 밀원이 그런데로 많을 때에는 봄철 아카시아에 못지않게 가을철에도 다량의 채밀을 할수도 있었으나 지금은 그러한 밀원식물들이 많지 않기 때문에 많은 채밀을 기대할 수가 없다.<br>
				                                그러나 다행이 잡초꽃등에서 기대이상의 유밀이 되었을때는 채밀을 할수 있다.<br>
				                                이때에는 완전채밀보다는 부분채밀로 육아소비는 피하고 저밀소비만을 골라 채밀하는 것이 좋으며 채밀은 가능한 9월초순까지 끝내는 것이 좋다.<br>
				                                간혹 9월하순까지 늦게까지 자연유밀이 많이 되는 경우가 있는데 이러할 경우 꿀벌의 월동성적에는 오히려 피해가 될 수도 있다.</p>
				                            <p>수밀작업에 과도한 체력소모가 뒤따르게 되므로 꿀벌들의 수명을 단축하게하는 원인이 되기 때문이다.<br>
				                                가을철 봉군관리를 위한 정리채밀이나 부분채밀은 봉아육성을 위해 필요하기도 하겠으나 무리한 채밀은 봉군세의 약화를 초래하게 된다.<br>
				                                또한 가을채밀은 도봉발생을 유발하기 쉬우며 가을철에 발생된 도봉은 근절시키기가 어려워 봉군에 많은 피해를 주게되기도 한다.<br>
				                                자연유밀이 많이 되었다고 하더라도 9월중순 이후의 채밀은 신중히 생각해서 해야하며 이는 꿀과 꿀벌을 서로 교환하리만큼 봉군에 피해가 심각해 질수도 있다.<br>
				                                때문에 9월초순 이후의 늦은 채밀은 가급적 하지않는 것이 좋다.<br>
				                                다만 유밀이 잘되어 산란권을 압박할 정도로 저밀방이 많은 경우에는 신속하게 부분채밀을하여 산란권을 넓혀줄 필요가 있다.</p>
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
				                            <h3>월동식량의 공급시기 및 방법 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p><strong>① 사양시킨 당액의 충분한 전화작업의 시간필요</strong></p>
				                            <p>사양시킨 당액을 꿀벌들이 충분한 시간을 가지고 수분을 증발시키면서 전화를 시켜 성숙된 먹이로 만들어야 하기 때문에 사양시킨 당액을 벌들이 소방으로 옮겨 놓았다고해서 월동사양 이 완성되었다고 생각해서는 안된다.<br>
				                                가을철에는 기온의 변화가 심하므로 기온이 갑자기 20 이하로 내려가면 꿀벌들은 사양시킨 당액의 전화작업을 충분히 할수 없게되어 불량한 먹이를 그대로 저장하게되고 이것을 겨울동 안 먹게 되므로서 꿀벌들에게 여러 가지 질병을 발생하게 하는 원인이 된다.<br>
				                                때문에 월동사양은 기온이 20 이하로 떨어지기 전에 완료 해야하며 이러한 점들을 고려할 때 9월은 월동사양의 적기라고 보면 된다. </p>
				                            <p><strong>② 초기 월동사양시 산란권 압박에 주의</strong></p>
				                            <p>9월은 월동사양의 적기이면서도 마지막 월동벌들을 양성해야할 중요한 시기이므로 9월중순 까지는 월동사양시 산란권을 압박하지 않도록 주위할 필요가 있다.<br>
				                                산란권을 압박하지 않도록 하기 위해서는 월동사양 초기에는 소량으로(4合미만) 사양시키되 사양횟수의 간격도 4∼5일 정도 간격을 두고 하는것이 좋다.</p>
				                            <p><strong>③ 월동사양액의 제조</strong></p>
				                            <p>월동사양액을 만들때는 도봉에 주의해야하기 때문에 설탕은 정백을 사용하는 것이 좋으며 물 의 배합량은 15kg설탕 1포를 물 5되∼5.5되에 용해시키는 것이 좋다.<br>
				                                물의 량을 필요이상으로 많게 하게 되면 수분을 증발 시키기위해 꿀벌들의 체력소모를 가중 시키게 되거나 충분한 수분증발을 시키지 못한채 먹이로 사용하게 되면 꿀벌들에게 많은 피 해를 주게되고 반대로 물의 량을 너무 적게해도 전화작업에 지장을 초래하게되어 역시 피해 를 주게된다.<br>
				                                설탕을 용해시 여름철 사양외에는 물을 먼저 끓인다음 불을 끄고 뜨거운 물에 설탕을 희석하 여 완전 용해시켜야한다.</p>
				                            <p>용해시킨 당액을 몇시간 방치했을 때 바닥에 설탕의 침전이 없어야만 완전용해된 것이라고 할수 있으므로 완전 용해여부를 반드시 확인해 보아야한다.<br>
				                                사양액이 완전 용해되지 않았다고해서 다시 끓여서는 절대로 안된다.(약간의 열을 가하여 온 도를 높이는 것은 가능함)<br>
				                                설탕을 용해시킨 당액을 끓이게되면 꿀벌들이 소화를 시킬수가 없게되므로 많은 피해가 발생 된다.<br>
				                                월동사양은 사용당일 용해시켜 사용하기보다는 몇일전이나 최소 한 하루전에 용해시켜 놓았 다가 사용하는 것이 좋다.</p>
				                            <p><strong>④ 월동사양을 통한 여왕봉의 산란중단</strong></p>
				                            <p>조기월동사양의 또다른 중요한 목적의 하나는 불필요한 시기에도 계속되고 있는 여왕봉의 산 란을 중단시키기 위한 수단으로 월동사양을 빨리 끝마쳐야하는 이유가있다.<br>
				                                월동을 지날 벌들이 늦게 출방하면 그만큼 내년봄 늦게까지 생존한다는 생각은 크게 잘못된 생각이다.<br>
				                                즉 11월에 출방하는 벌들은 10월에 출방된 벌들보다 한달가량 늦게 출방하였으므로 월동이 끝난 내년봄에도 그만큼 더 오래살것으로 생각하기가 쉬우나 그렇지 않다는 것을 알아야한다.<br>
				                                대체로 10월중순 이후의 육아작업은 봉군의 번식 및 월동에 전혀 도움이 되지 못할뿐아니라 오히려 이들 육아 작업으로 꿀벌들의 수명만을 단축시키는 나쁜 결과를 초래하게 되므로 주의해야 한다.<br>
				                                때문에 여왕봉의 이러한 불필요한 산란을 중단시켜 주어야 하는데 월동사양은 이를 해결할수 있는 좋은 수단이 된다.</p>
				                            <p>꿀벌들은 저밀을 소비에 저장할 때 봄철 및 여름철에는 소비상단에서부터 저밀을 저장하기 시작해서 점차 소비중앙부와 하단으로 내려오면서 저장하게 되나 가을철에는 바로 소비중앙부에서부터 저밀을 저장하게 되므로 쉽게 여왕봉의 산란을 중단 시킬수가 있다.<br>
				                                여왕봉의 산란을 중단시켜야 할 시기가 되었을때(9월중순 이후)에는 월동사양을 다량으로 집 중해서(매일 또는 2∼3일 간격)시키게되면 소방은 저밀로 충만하게되어 자연 여왕봉은 산란 할 소방이 없게되므로 산란중단을 하게된다.</p>
				                            <p><strong>⑤ 월동사양과 예방약품의 사용</strong></p>
				                            <p>월동사양시에는 필히 봉병예방약품을 사양액에 희석하여 급이해주어야 한다.<br>
				                                월동의 성공요인은 첫째 충분한 월동식량의 확보, 둘째 충분한 자연화분의 확보, 셋째 봉병 예방 약품의 적절한 사용 및 건강한 강세군의 유지, 넷째 도봉발생 억제 등이라고 할수있다.<br>
				                                봉병이 이미 발생되어 있는 봉군에는 4∼5회 약품을 투여하여 질병을 치료해 주어야하고 그 렇지 않은 봉군에는 2∼3회 예방약품을 조기에 사용하여 봉병에 감염되지 않도록 해주어야한다. </p>
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
				                            <h3>가을철의 화분 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>화분은 벌꿀에 못지 않게 월동기간중의 꿀벌에 중요한 식량인 동시에 영양원이 된다.<br>
				                                월동을 지날 벌들의 수명을 최대한 연장시켜주는 활력소가 바로 화분인 만큼 월동기간에도 굴벌들은 꿀과 화분을 같이 급이해야만 내년봄까지 살아남아 조춘봉군번식의 임무를 원활히 수행할 수가 있게된다.<br>
				                                때문에 가을철 화분저장 소비의 확보는 월동의 성공여부를 가름할 수 있는 중요한 요인이 될수있다. </p>
				                            <p>월동사양기간 동안 몇차례 소비의 축소과정을 거치면서 월동사양을 끝내게 되는데 이때 화분이 저장된 소비를 최대한 확보해야하며 화분저장소비를 뽑아내는 일이 없도록 해야한다.<br>
				                                화분저장소비없이 꿀로서만 충분한 월동식량이 확보된 봉군은 월동은 지날 수 있겠으나 화분고갈로 인한 수명단축으로 월동이 끝남과 동시에 모두 일찍 죽게되므로 봉군의 번식이 불가능하게 된다.<br>
				                                꿀벌들은 월동사양시 화분이 저장된 소방에 숙성시킨 량질의 꿀을 채워 봉개하게 되는데 이러한 소비가 많을수록 월동성적이 좋을뿐만 아니라 조춘 봉군 번식에도 많은 도움이 된다.</p>
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
				                            <h3>도봉발생의 주의 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>가을철에는 꿀벌들이 본능적으로 육아작업 보다는 수밀작업에 치중하게 되어 약간의 부주의에 의한 봉군관리의 허점도 그냥 지나침이 없이 도봉이 발생하게 된다.<br>
				                                월동사양시나 소비의 발췌 또는 내검시 사소한 부주위도 용납될수 없으므로 세심한 주의가 필요하다.<br>
				                                도봉은 봉군을 내검한후에 발생하는 경우가 많으므로 내검시에는 아침 저녁으로 벌들의 출입이 적은 시간대를 활용하여 빠른시간내에 봉군의 내검을 끝내도록 해야하며 한 번에 많은 군수를 내검하기 보다는 적은 군수로 나누어 내검하므로서 도봉발생을 막을수 있다.</p>
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
				                            <h3>말벌(대추벌) 피해방지 </h3>
				                        </label>
				                        <div class="content-inner">
				                            <p>가을철에 봉군에 많은 피해를 주는 것중에 하나가 말벌에 의한 피해가 될 수 있다.<br>
				                                말벌의 피해가 많은 봉장에서는 계속 봉장을 감시하여 말벌을 퇴치하여야하며 계속 감시가 어려운 봉장은 호봉망(어망)이나 철망을 사용하여 피해를 당하지 않도록 관리하여야 한다.<br>
				                                말벌에 의한 피해를 당했거나 또는 전멸된 봉군이 발생시에는 즉시 합봉을 시키거나 육아중인 소비는 다른 봉군에 넣어주어 도봉이 발생되지 않도록 관리 해야한다. </p>
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
