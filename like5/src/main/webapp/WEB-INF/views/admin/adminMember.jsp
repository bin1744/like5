<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    aside{
        float: left;
        margin-right: 50px;
    }
    .aside-title{
        padding: 30px 10px;
    }
    aside ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 130px;
        /* background-color: #f1f1f1; */
    }
    aside li{
        border: 1px lightgray solid;
    }

    aside li a {
        display: block;
        color: #000;
        padding: 8px 16px;
        text-decoration: none;
        text-align: center;
    }

    aside li a.active {
        background-color: rgb(220, 53, 69);
        color: white;
        text-decoration: none;
    }

    aside li a:hover:not(.active) {
        background-color: rgb(220, 53, 69);
        color: white;
        text-decoration: none;
    }

    .input-search{
        border: 1px solid #ced4da;
        border-radius: .25rem;
        height: 38px;
    }

    table{
        text-align: center;
    }
    form{
        display: flex;
    }
    .pagination{
        text-align: center;
        margin: auto;
    }
    .pagination li a.page-link{
        color: rgb(220, 53, 69);
    }
    .pagination .active a {
        background-color: rgb(220, 53, 69) !important;
        border: 1px solid white !important;
    }
    .page-link:hover{
        color: white !important;
    }
    #alreadyDelBtn{
        background-color:  lightgray
        color: white;
        border: 1px solid  lightgray;
        border-radius: 3px;
    }
    #delBtn{
        background-color:  rgb(220, 53, 69);
        color: white;
        border: 1px solid  rgb(220, 53, 69);
        border-radius: 3px;
    }
    aside-title{margin-top:30px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<br><br><Br>

    <div class="outer">
	
        <div class="aside-title">
            <i class="fi fi-spinner-cog fi-spin"></i>
            <i class="fi fi-acrobat-reader"></i>

            <h3>통합관리</h3>
            <h6>&gt; 회원관리 라고 넣어주는 건 어떨지</h6>
        </div>

        <aside>
            <ul>
                <li>
                    <a class="active" href="">회원관리</a>
                </li>
                <li>
                    <a href="">게시글관리</a>
                </li>
                <li>
                    <a href="">고객센터</a>
                </li>
                <li>
                    <a href="">후원관리</a>
                </li>
                <li>
                    <a href="">공간대여관리</a>
                </li>
            </ul>
        </aside>

        <article>
            <form id="searchBar" action="">
                <select class="selectpicker">
                    <option value="all" name="all">전체</option>
                    <option value="writer" name="wrtier">회원명</option>
                    <option value="title" name="title">아이디</option>
                  </select>
                <input type="text" class="form-control w-25">
                <button class="btn btn-outline-danger">검색</button>
            </form>

            <br><br>

            <table class="table-bordered table-sm" id="memTable">
                <thead>
                    <tr class="table-danger">
                        <th>No</th>
                        <th width=100px;>회원명</th>
                        <th width=80px;>닉네임</th>
                        <th width=200px;>이메일</th>
                        <th width=150px;>은행이름</th>
                        <th width=160px;>계좌번호</th>
                        <th width=100px;>회원상태</th>
                        <th width=100px;>회원삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1103</td>
                        <td>김망고</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>43</td>
                        <td>채부기</td>
                        <td>turtle</td>
                        <td>turtle0115@naver.com</td>
                        <td>카카오뱅크</td>
                        <td>3333083929482</td>
                        <td>N</td>
                        <td><button id="alreadyDelBtn" onclick="deleteMem();" disabled>삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="alreadyDelBtn" onclick="deleteMem();" disabled>삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="alreadyDelBtn" onclick="deleteMem();" disabled>삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김망고</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>43</td>
                        <td>채부기</td>
                        <td>turtle</td>
                        <td>turtle0115@naver.com</td>
                        <td>카카오뱅크</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김망고</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>43</td>
                        <td>채부기</td>
                        <td>turtle</td>
                        <td>turtle0115@naver.com</td>
                        <td>카카오뱅크</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김망고</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="alreadyDelBtn" onclick="deleteMem();" disabled>삭제</button></td>
                    </tr>
                    <tr>
                        <td>43</td>
                        <td>채부기</td>
                        <td>turtle</td>
                        <td>turtle0115@naver.com</td>
                        <td>카카오뱅크</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김아무개</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>김망고</td>
                        <td>mango</td>
                        <td>mango1103@naver.com</td>
                        <td>신한</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                    <tr>
                        <td>43</td>
                        <td>채부기</td>
                        <td>turtle</td>
                        <td>turtle0115@naver.com</td>
                        <td>카카오뱅크</td>
                        <td>3333083929482</td>
                        <td>Y</td>
                        <td><button id="delBtn" onclick="deleteMem();">삭제</button></td>
                    </tr>
                </tbody>
            </table>

            <br><br>

            <!-- <nav aria-label="Page navigation example"> -->
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
            <!-- </nav> -->

            <br><br>


        </article>
        <script>
            function deleteMem(){
                // 여기에 모달 창 띄워서 ok누르며는 회원상태 N으로 변경되도록 할거임
                if(!confirm("해당 회원을 정말로 삭제 및 탈퇴 처리 하시겠습니까?")){
                    // 그냥 해당 페이지가 보여지도록
                    // 그럼 아무것도 안해두 되낭? 아니면 새로고침되게라도 해줘야 하남

                }else{
                    // 진짜 확인하는 process진행
                }
            }
        </script>

    </div>
</body>
</html>