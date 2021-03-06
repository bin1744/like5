<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        
        div{
            box-sizing:border-box;
            
            font-family: 'Noto Sans KR', sans-serif;
        }
        #body{width:1200px; height:1000px; margin: auto;}
        #body>div{float: left;}

        #info{width: 100%; height: 4%;}
        #pageinfo{width:100%; height: 100%;}
        #pageinfo h3{margin:0; padding-top:10px; padding-left: 5px;}
        #line{width: 100%; height: 2px; background-color: lightgrey;}

        #content{width:100%; height: 95%;}
        #content>form>div{width: 700px; height: 650px; border: 3px solid rgb(220, 53, 69); margin-left: 250px; margin-top: 50px;}
        #content img{width:150px; height:150px; border-radius: 70%; margin-left: 15px; margin-top: 12px;}
        
    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="body">
      
      <div id="info">
        <div id="pageinfo">
            <h3>회원가입</h3>
        </div>
          <div id="line">
        </div>
      </div>
        
      <div id="content">
      	<form id="enrollForm" action="insert.me" method="post" enctype="multipart/form-data">
	        <div>
	          <div style="margin-left:250px">
	            <div>
			    <img src="https://i.imgur.com/pO4OGIl.jpg" alt="">
	            </div>
	            <div><input id="upfile" name="upfile" type="file"></div>
	            <div>*이름 : </div>
	            <input id="memName" name="memName" type="text" required>
	            <div>*닉네임 : </div>
	            <input id="nickName" name="nickName" type="text" required>
	            <div>*이메일 : </div>
	            <input id="email" name="email" type="email" required>
	            <div>*비밀번호 : </div>
	            <input id="memPwd" name="memPwd" type="password"required>
	            <div>*비밀번호 확인 : </div>
	            <input type="password">
	            <div>은행 : </div>
	            <select name="bankName" id="bankName">
			    	<option value="kb">국민은행</option>
			        <option value="shin">신한은행</option>
			        <option value="we">우리은행</option>
			        <option value="kko">카카오뱅크</option>
			        <option selected>은행</option>
			    </select>
	            <div>계좌번호 :</div>
	            <input type="text" id="accountNum" name="accountNum" value="">
	            <div style="margin-top: 40px;">
	              <button type="button" onclick="location.href='/like5'" style="margin-left:35px; border: 2px solid rgb(220, 53, 69); background-color: white; color: rgb(220, 53, 69); border-radius:3px;">취소</button>
	              <button type="submit" style="border: 2px solid rgb(220, 53, 69); background-color:rgb(220, 53, 69); color: white; border-radius:3px;">가입하기</button>
	            </div>
	          </div>
	        </div>
        </form>
      </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>