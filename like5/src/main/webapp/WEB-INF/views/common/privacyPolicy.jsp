<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>privacy policy</title>

<!-- teamAskMe.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teamAskMe.css" />
	
</head>

<body>
	<!-- 메뉴바 -->
	<jsp:include page="header.jsp" />
	
	<!-- [한솔] footer.jsp에서 넘어오는 페이지 : 개인정보처리방침 -->
	<div class="innerOuter">
		<!-- 전체를 감싸는 div -->
		<div class="aboutMain">
			<!-- 페이지 상단 -->
			<div class="pageTop"><h2><b>LEGAL NOTICE</b></h2></div>
			<!-- 페이지 상단 끝 -->

			<!-- 페이지 하단부 -->
			<div class="pageBottom">
				<!-- 좌측 사이드바 영역 -->
				<div class="pageLeft">
					<div class="sideBar">
						<!-- Team AskMe -->
						<div class="askMe"><a href="teamAskMe.me""><h4 class="barName">Team AskMe</h4></a></div>

						<div class="divider"></div>

						<!-- Legal Notice -->
						<div class="legal">
							<div><h4 class="barName">Legal Notice</h4></div>
							<ul>
								<li><a href="terms.me">이용약관</a></li>
								<li><a href="legal.me">법적고지</a></li>
								<li><a href="privacy.me">개인정보처리방침</a></li>
							</ul>
						</div>

						<div class="divider"></div>

						<!-- Contact Us -->
						<div class="contact">
							<div class="contactUs"><h4 class="barName">Contact Us</h4></div>	
								<ul>
									<li><a href="https://github.com/hansololiviakim/like5">GitHub</a></li>
								</ul>
						</div>
					</div>
				</div>
				<!-- 좌측 사이드바 영역 끝 -->

				<!-- 우측 본문 영역 -->
				<div class="pageRight">
					<!-- 본문 -->
					<div class="w3-search" id="content">
						<!-- 약관 Content를 감싸는 div -->
						<div class="mainContent">
							<!-- 본문 상단 -->
							<div id="content_top" >
								<div id="content_top3"><h4><b>개인정보처리방침</b></h4></div>
								<div id="content_top4">시행일 : 2021년 8월 1일</div>
							</div>
							<!-- 본문 하단 -->
							<div id="content_bottom">
								<p>
									LIKE5는 이용자들의 개인정보를 철저히 보호하며 불법적인 정보사용, 정보유출 등으로 인한 피해가 발생하지 않도록 노력하고 있으며, 
									개인정보와 관련된 법령상의 개인정보보호 규정을 준수하고 있습니다.
									<br><br>
									<b>1. 수집하는 개인정보 항목 및 수집방법</b><br>
									1) 수집항목 <br>
									　* 필수항목: 이메일 <br>
									　* 필수항목: 닉네임 <br>
									2) 개인정보 수집방법 <br>
									　* 홈페이지를 통한 회원가입
									<br><br><br>
									<b>2. 개인정보의 수집 및 이용목적</b><br>
									사이트는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br><br>
									1) 회원 관리 <br>
									회원제 서비스 이용에 따른 개인 식별, 불량 회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달 <br>
									2) 신규 서비스 개발 및 마케팅 및 광고에 활용 <br>
									신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공, 서비스 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회제공, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계
									<br><br><br>
									<b>3. 개인정보의 보유 및 이용기간</b><br>
									사이트는 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다. <br>
									이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 
									단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br>
									* 보존 항목: 이메일,닉네임 <br>
									* 보존 근거: 서비스 이용의 혼선 방지, 불법적 사용자에 대한 관련 기관 수사협조 <br>
									* 보존 기간: 6개월
									<br><br><br>
									<b>4. 개인정보의 파기절차 및 방법</b><br>
									사이트는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. <br><br>
									[파기절차] <br>
									　* 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다. <br>
									　* 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다. <br><br>
									[파기방법] <br>
									　* 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. <br>
									　* 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
									<br><br><br>
									<b>5. 개인정보 제공 및 공유</b><br>
									사이트는 이용자들의 개인정보를 "2. 개인정보의 수집 및 이용목적"에서 고지한 범위내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
									<br><br>
									1) 이용자들이 사전에 동의한 경우 <br>
									개인정보 제공 이전에 개인정보 제공자, 개인정보 제공 목적, 제공하는 개인정보의 항목 및 보유기간을 별도로 알리고 동의절차를 거치며, 이에 이용자가 동의하지 않을 경우에는 제 3자에게 이용자의 개인정보를 제공하지 않습니다. <br>
									2) 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
									<br><br><br>
									<b>6. 개인정보취급 위탁</b><br>
									사이트는 개인정보 취급 업무를 외부 전문업체에 위탁하여 운영하고 있지 않습니다.
									<br><br><br>
									<b>7. 이용자 및 법정대리인의 권리와 그 행사방법</b><br>
									이용자 및 법정대리인(본인의 위임을 받지 않고도 법률의 규정에 의하여 대리권의 효력이 발생하는 자로 미성년자에 대한 친권자나 후견인 등을 말함)은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.  <br>
									이용자 혹은 만 14세 미만 아동의 개인정보 조회/수정을 위해서는 '개인정보변경'(또는 '회원정보관리' 등)을 통하여 가능하며, 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. <br>
									<br>
									또는 개인정보관리책임자에게 서면, 또는 이메일로 연락하시면 지체 없이 조치하겠습니다. <br>
									<br>
									이용자가 개인정보의 오류에 대한 정정을 요청한 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.  <br>
									사이트는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "3. 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
									<br><br><br>
									<b>8. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항</b><br>
									LIKE5는 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.
									<br><br><br>
									<b>9. 개인정보의 기술적, 관리적 보호 대책</b><br>
									사이트는 이용자의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안정성 확보를 위하여 다음과 같은 기술적, 관리적 대책을 강구하고 있습니다. <br><br>
									1) 개인정보 암호화 <br>
									이용자의 개인정보는 비밀번호에 의해 보호되며, 중요한 데이터는 파일 및 전송 데이터를 암호화하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 통해 보호 하고 있습니다. <br>
									2) 해킹 등에 대비한 기술적 대책 <br>
									LIKE5는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다. <br>
									3) 개인정보처리시스템 접근 제한 <br>
									사이트는 개인정보를 처리할 수 있도록 체계적으로 구성한 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소 등에 관한 기준을 수립하고 비밀번호의 생성 방법, 변경 주기 등을 규정 운영하며 기타 개인정보에 대한 접근통제를 위해 필요한 조치를 다하고 있습니다. <br>
									4) 개인 닉네임과 비밀번호 관리 <br>
									이용자가 사용하는 닉네임과 비밀번호는 원칙적으로 이용자만이 사용하도록 되어 있습니다. 사이트는 이용자의 개인적인 부주의로 닉네임, 비밀번호, 이메일 등 개인정보가 유출되어 발생한 문제와 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다. <br>
									비밀번호에 대한 보안 의식을 가지고 비밀번호를 자주 변경하며 공용PC에서의 로그인시 개인정보가 유출되지 않도록 각별한 주의를 기울여 주시기 바랍니다.
									<br><br><br>
									<b>10. 개인정보에 관한 민원 서비스</b><br>
									사이트는 이용자의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보관리책임자를 지정하고 있습니다. <br>
									이용자는 사이트의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자에게 신고하실 수 있습니다. 사이트는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
									<br><br>
									* 개인정보 관리책임자 <br>
									* 성명: 김한솔 <br>
									* 메일: like5@like5.com
									<br><br>
									기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
									<br><br>
									* 개인정보침해신고센터 (www.118.or.kr / 118) <br>
									* 정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4) <br>
									* 대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000) <br>
									* 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)
									<br><br><br>                  
									부칙(2021년 7월 1일 공고)
									<br><br>
									본 약관은 2021년 8월 1일부터 적용합니다.
								</p>
							</div>
						</div>
					</div>
					<!-- 본문 끝 -->
				</div>
				<!-- 우측 본문 영역 끝 -->
			</div>
			<!-- 페이지 하단부 끝 -->	
		</div>
		<!-- 전체를 감싸는 div 끝-->

	<!-- 위로가기 아이콘 -->
	<a href="#header"><i class="fas fa-chevron-up" id="toTheTop">&nbsp;TOP</i></a>
	</div>
	<!--페이지 영역 끝 -->
	
	<!-- 푸터바 -->
	<jsp:include page="footer.jsp" />
</body>
</html>