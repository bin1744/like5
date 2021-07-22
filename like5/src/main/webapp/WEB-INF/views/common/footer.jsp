<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        /* 푸터 배열 */
        .footer{
            width:1200px; height:150px; margin:auto;
            background-color:gainsboro;
            color:white;
            text-align:center;
        }
        .footer>div{width:100%; margin:15px 5px 5px 5px; float:left;}
        #footer_left{width:20%;}
        #footer_middle{width:60%; height:100%;}
        #footer_right{width:20%;}
        #footer_top{height:30%; margin: 5px 0px 0px 0px;}
        #footer_bottom{height:70%;}
        div[id$=link]{float:left; width:25%;}

        #footer_top a{text-decoration:none; font-weight:bold; font-size:17px;}
        #footer_top a:hover{color:black;}
        #footer_bottom{font-size:12px;}
</style>
</head>
<body>
        <!-- 전체를 감싸는 div -->
       <div class="footer">
            <!-- 세로 3등분 div -->
            <div id="footer_left"></div>
            <div id="footer_middle">
                <!-- 가로 2등분 div  -->
                <div id="footer_top">
                    <!-- 세로 4등분 여기에 아이콘+약관3종-->
                    <div id="footer_top_link"><a href="">이용약관</a></div>
                    <div id="footer_top_link"><a href="">법적고지</a></div>
                    <div id="footer_top_link"><a href="">개인정보처리방침</a></div>
                    <div id="footer_top_link"><a href="">GitHub</a></div>
                </div>
                <div id="footer_bottom">
                    <p>
                        소재지 : 서울시 강남구 테헤란로 156<br>
                        사업자등록번호 : 123-45-67890<br>
                        통신판매업신고 : 제2021-서울강남-0701호<br>
                        Copyrightⓒ 2021 LIKE5 All Rights Reserved
                    </p>
                </div>
            </div>
            <div id="footer_right"></div>
        </div>  
</body>
</html>