<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- W3.CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/1e56433357.js" crossorigin="anonymous"></script>

    <!-- 공통 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <style>
        /* 세부 페이지마다 공통적으로 유지할 스타일 */
        .content{width:80%;}
        .innerOuter{width:1200px; margin:auto; padding:5% 5%; margin-top: 50px;}

        /* 공통 폰트 */
        *{font-family: 'Noto Sans KR', sans-serif;}
        div{box-sizing:border-box;}

        /* 헤더 배열 */
        .header{width:1200px; height:100%; padding-top:20px; margin:auto;}
        .header>div{width:100%; float:left;}
        #header_logo{width:10%;}
        #header_navi{width:75%;}
        #header_user{width:15%; height:50px;}

        /* 메뉴바 배열 */
        #menu{display:flex; list-style-type:none; margin:0; padding:0; height:50px;}
        #menu>li{float:left; width:100%; height:100%; text-align:center;}

        /* a태그 스타일 */
        #menu a{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:900;
        height:100%;
        width:100%;
        display:block;
        line-height:50px;
        }
        #header_user a{text-decoration:none; color:black;}

        /* 로그인 배열 */
        div[id$=login] {font-size:13px; margin: 13px 0px 5px 0px;}
        #after_login{margin:5px 10px 5px 10px;}

        /* 페이지 실제 연결 시 활성화시킬 코드 아직 사용X
        방문하지 않은 링크
        #menu a:link{color: black;}
        방문한 링크
        #menu a:visited{color: black;}
        링크를 활성화 할 때
        #menu>a:active{color: black;} */

        #menu>li a:hover{color:rgb(220, 53, 69); border-bottom:5px solid rgb(220, 53, 69);}
        .underline{border:1px solid lightgrey;}
    </style>
</head>

<body>
    <div class="header">
        <!-- 로고 -->
        <div id="header_logo" align=center>
            <a href="">
                <img src="https://i.imgur.com/5WiLp9Y.jpg" style="width:85px; height:50px;">
            </a>
        </div>

        <!-- 메뉴 -->
        <div id="header_navi">
            <ul id="menu">
                <li><a href="">LIKE5?</a></li>
                <li><a href="">QnA</a></li>
                <li><a href="bMain.bk">공간대여</a></li>
                <li><a href="">커뮤니티</a></li>
                <li><a href="">칼럼</a></li>
                <li><a href="">IT뉴스</a></li>
            </ul>
        </div>

        <!-- 로그인 -->
        <div id="header_user" style="text-align:center;">
            <!-- 로그인 전
            <div id="before_login">
                <a href="">로그인&nbsp;</a> | <a href="">&nbsp;회원가입</a>
            </div> -->

            <!-- 로그인 후 -->
            <div id="after_login">
                <div class="w3-dropdown-hover w3-center">
                    <!-- 사용자 닉네임 한글 기준 11자까지 배열에 딱 맞음 -->
                    <button class="w3-button w3-white">사용자 닉네임</button>
                    <div class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
                    <a href="" class="w3-bar-item w3-button">마이페이지</a>
                    <a href="" class="w3-bar-item w3-button">내 프로필 보기</a>
                    <a href="" class="w3-bar-item w3-button">1:1문의</a>
                    <a href="" class="w3-bar-item w3-button">로그아웃</a>
                    </div>
                </div>
            </div>
        </div>
	    <!-- 메뉴바 아래 회색 밑줄 -->
	    <div class="underline"></div>
    </div>


</body>
</html>