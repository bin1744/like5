<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- W3.CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/1e56433357.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
/* 세부 페이지마다 공통적으로 유지할 스타일 */
.innerOuter{width:70%; margin:auto;}

/* 공통 폰트 */
*{font-family:'Noto Sans KR', sans-serif; color:#424242;}
div{box-sizing:border-box;}

/* 헤더 배열 */
.header{width:70%; margin:auto; display:flex; border-bottom:2px solid #DEDEDE;}
.header>div{width:100%; float:left; margin-bottom:-2px;}
#header_logo{width:10%;}
#header_navi{width:75%;}
#header_user{width:15%; height:73px;}

/* 메뉴바 배열 */
#menu{display:flex; list-style-type:none; margin:0; padding:0; height:50px;}
#menu>li{float:left; width:100%; height:100%; text-align:center;}

/* a태그 스타일 */
#menu a{text-decoration:none; font-size:1.1rem; font-weight:900; height:100%; width:100%; display:block; line-height:50px;}
#header_user a{text-decoration:none;}
#header_user a:hover{color:rgb(220, 53, 69);}
#menu>li a:hover{color:rgb(220, 53, 69); border-bottom:5px solid rgb(220, 53, 69);}

/* 로고 이미지 */
.headerImg{width:85px; height:50px;}
.headerImg:hover{opacity:0.6;}

/* 로그인 배열 */
#before_login{font-size:13px; margin-top:35px; text-align:center;}
#after_login{font-size:13px; margin-top:30px; text-align:center;}

/* 페이지 실제 연결 시 활성화시킬 코드 아직 사용X
방문하지 않은 링크
#menu a:link{color: black;}
방문한 링크
#menu a:visited{color: black;}
링크를 활성화 할 때
#menu>a:active{color: black;} */

/* 바로가기버튼 마진 */
#explanation{margin:7% 0% 10% 0%;}

/* to the top */
#toTheTop{display:scroll; position:fixed; bottom:1.5rem; right:2rem; color:grey;}
</style>
</head>

<body>

	<!-- [한솔] 메뉴바 : 헤더 스타일 및 배열 초기버전에서 일부 수정 -->
	<div class="header" id="header">
		<!-- 로고 -->
		<div id="header_logo" align=center>
			<br><a href=""><img src="https://i.imgur.com/vhEZ5DJ.png" class="headerImg"></a>
		</div>

		<!-- 메뉴 -->
		<div id="header_navi">
			<br><ul id="menu">
				<li><a href="">LIKE5?</a></li>
				<li><a href="qList.bo">QnA</a></li>
				<li><a href="bMain.bk">공간대여</a></li>
				<li><a href="">커뮤니티</a></li>
				<li><a href="">칼럼</a></li>
				<li><a href="">IT뉴스</a></li>
			</ul>
		</div>

		<!-- 로그인 -->
		<div id="header_user">
			<c:choose>
				<c:when test="${ empty loginUser }">
					<!-- 로그인 전 -->
					<div id="before_login">
						<a data-toggle="modal" href="#myModal">로그인&nbsp;</a> | <a href="">&nbsp;회원가입</a>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 일반 사용자 로그인 후 -->
					<c:choose>
						<c:when test="${ loginUser.userStatus eq 'N' }">
							<div id="after_login">
								<div class="w3-dropdown-hover w3-center">
									<button class="w3-button w3-white">${ loginUser.memName }</button>
									<div class="w3-dropdown-content w3-bar-block w3-border">
										<a href="" class="w3-bar-item w3-button">마이페이지</a>
										<a href="" class="w3-bar-item w3-button">내 프로필 보기</a>
										<a href="" class="w3-bar-item w3-button">1:1문의</a>
										<a href="logout.me" class="w3-bar-item w3-button">로그아웃</a>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 관리자 로그인 후 -->
							<div id="after_login">
								<div class="w3-dropdown-hover w3-center">
									<button class="w3-button w3-white">${ loginUser.memName }</button>
									<div class="w3-dropdown-content w3-bar-block w3-border">
										<a href="member.ad" class="w3-bar-item w3-button">통합관리</a>
										<a href="logout.me" class="w3-bar-item w3-button">로그아웃</a>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 메뉴바 끝 -->


	<!-- [동규] 로그인 모달  -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<img style="width: 138px; height: 70px;" src="https://i.imgur.com/5WiLp9Y.jpg" alt="">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="login.me" method="post">
					<!-- Modal body -->
					<div class="modal-body">
						<div style="margin-left: 80px;">
							이메일 : <input type="email" id="email" name="email" style="margin-left: 17px;"><br>
							비밀번호 : <input type="password" id="memPwd" name="memPwd" style="margin-left: 3px;">
							<button type="button" style="border: 0px solid white; background-color: white;">
								<img src="https://i.imgur.com/CsKaQmk.png" alt="">
							</button>
							<button type="button" style="border: 0px solid white; background-color: white;">
								<img src="https://i.imgur.com/X4fyiID.png" alt="">
							</button>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal"
							style="border: 2px solid rgb(220, 53, 69); background-color: white; color: rgb(220, 53, 69);">취소</button>
						<button type="submit" class="btn btn-secondary"
							style="background-color: rgb(220, 53, 69); color: white; margin-right: 170px;">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>