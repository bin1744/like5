<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community</title>
	  <style>
	      
	      a { text-decoration:none !important } a:hover { text-decoration:none !important }
	  
	      .main{
	          height: 60em;
	          width: 55em;
	          margin-top: 100px;;
	      }
	      
	      .community-header{
	          display: inline;
	      }
	  
	      .aTags>*, .aTags{text-decoration: none;color: black;}
	  
	      .aTags :hover{
	          color: rgb(220, 53, 69);
	      }
	  
	      #searchForm >*{
	              float:left;
	              margin:5px;
	      }
	      
	      .form-control{width: 300px; height: 30px;}
	      
	      .select-area{float: right;}
	      .select-area>*{margin: 4px;}
	      #communityList>*{margin: auto;}
	  
	      .TalkBoxItem .talk-box-wrapper{
	          padding:10px 10px 5px 10px;
	          display: flex;
	      }
	
	      .talk-box-wrapper:hover{cursor: pointer; background-color: rgba(224, 224, 224, 0.3);}
	      .TalkBoxItem .talk-box-col__content{
	          width:100%;
	      }
	  
	  
	      .TalkBoxItem .talk-box-col__thumbnail>img{
	          margin-left: 5px;
	          width : 100px;
	          height:100px;
	          overflow: hidden;
	      }
	      
	      .TalkPageHeaderModule .talk-filter-box-wrapper .talk-filter-box-inner{
	          display: flex;
	          border:1px solid #d3d3d3;
	          border-radius:5px;
	          width:93%;
	      }
	      
	      .talk-filter-box-inner>div{
	          padding:5px 20px;
	          text-align: center;
	          cursor: pointer;
	      }
	  
	  
	      .talk-filter-box-inner .on{
	          background-color: rgb(220, 53, 69);
	          color: white;
	      }
	  
	      .talk-filter-box-inner {
	          color: black;
	      }
	  
	      .talk-box-row__info{margin-top: 30px;}
	      
	      
	      .category-tag-header-wrapper {
	          margin-bottom: 1%;
	          margin-left: 30px
	      }
	  
	      .sidebar-item-wrapper {
	          float: right;
	      }
	      .category-list-wrapper>*{
	          margin: 5px;
	          padding-left:30px;
	      }
	
	      .search-item-wrapper {display: flex; justify-content: space-between;}
	
	      .search-item-wrapper>*{margin-left: 10px;}
	  
	      textarea.form-control:focus, input:focus, input[type]:focus, .uneditable-input:focus {
	            border-color: rgba(224, 224, 224, 0.3);
	            box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(224, 224, 224, 0.3);
	            outline: 0 none;
	        }
	  </style>
</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../../common/header.jsp" />   
   

    <!--전체 감싸는 div-->
    <div class="innerOuter" style="padding:5% 10%;">

           
        <!--카테고리 시작-->
        <div class="community-header"> 
            <div class="sidebar-item-wrapper">
                <div class="category-tag-header-wrapper" align="center">
                    <button class="btn btn-danger" style="width: 100%;margin-bottom: 15px;" onclick="test1();">글작성</button>
                    <h4 class="item-header">카테고리 📚</h4>
                    
                    <script>
                    	function test1(){
                    		location.href="comEnrollForm.bo";
                    	}
                    
                    </script>
                    
                    <hr>
                </div>
                <div class="category-list-wrapper">
                    <ul><a href="" class="aTags">📖전체 </a></ul>
                    <ul><a href="" class="aTags">📕일상 </a></ul>
                    <ul><a href="" class="aTags">📕스터디모집 </a></ul>
                </div>
            </div>
        <!--카테고리 끝--> 
        </div>

        <div class="TalkPageHeaderModule header">
            <div class="talk-filter-box-wrapper"  style="width: 280px;" >
                <div><h2 class="content-header"><b>전체</b> &nbsp;&nbsp;</h2></div>
                <div class="talk-filter-box-inner" id="selectOption">
                    <div class="talk-filter-item on">최신순</div>
                    <div class="talk-filter-item " >조회순</div>
                    <div class="talk-filter-item ">좋아요순</div>
                </div>
            </div>
        </div>

  
        <!--메인 시작-->
        <div class="main" id="communityList">
            
            <div class="talk-count-box" style="height: 100px; padding-top: 30px;">
                <h3><b>126개의 게시물</b></h3>
            </div>

            <!--반복적으로 생성될 요소들-->
            <div class="TalkBoxItem" id="test1">
                <input type="hidden" value="test1">
                <hr>
                <!--하나의 컨텐츠 감쌀 영역-->
                <div class="talk-box-wrapper">
                    <!--content 영역-->
                    <div class="talk-box-col__content">
                            <div class="talk-box-row__title">
                                <h5 class="post-title">안녕하세요
                                    <label class="post-commentcount">[0]</label>
                                </h5>
                            </div>
                        <!--게시글 정보 (카테고리, 작성일, 작성자)-->
                        <div class="talk-box-row__info">
                            <label class="talk-box-label">일상 | </label>
                            <label class="talk-box-label">2021 - 07 - 12 | </label>
                            <label class="talk-box-label">작성자 닉네임</label>
                        </div>
                    </div>
                    <!--thumbnail영역-->
                    <div class="talk-box-col__thumbnail">
                        <img src="">
                    </div>
                </div>
            
            </div>

            <!--샘플-->
            <!--반복적으로 생성될 요소들-->
            <div class="TalkBoxItem">
                <hr>
                <!--하나의 컨텐츠 감쌀 영역-->
                <div class="talk-box-wrapper">
                    <!--content 영역-->
                    <div class="talk-box-col__content">
                        <a href="" class="aTags">
                            <div class="talk-box-row__title">
                                <h5 class="post-title">안녕하세요
                                    <label class="post-commentcount">[0]</label>
                                </h5>
                            </div>
                        </a>
                        <!--게시글 정보 (카테고리, 작성일, 작성자)-->
                        <div class="talk-box-row__info">
                            <label class="talk-box-label">일상 | </label>
                            <label class="talk-box-label">2021 - 07 - 12 | </label>
                            <label class="talk-box-label">작성자 닉네임</label>
                        </div>
                    </div>
                    <!--thumbnail영역-->
                    <div class="talk-box-col__thumbnail">
                        <img src="">
                    </div>
                </div>
            </div>
            <!--메인 끝-->
        </div>

        <script>
            /*조회 기준(최신순,조회순,좋아요순) 클릭시 배경색 변경되는 JS*/
            $(document).on("click","#selectOption>div",function(){
                $(this).toggleClass('on');
                $(this).siblings().removeClass('on');
            })  
            
            $(function(){
                $("#test1").click(function(){
                    //console.log($(this).children("input[type=hidden]").val());
                    // 반복문으로 생성된 게시글의 글 번호 받아오기 (ex.bno)
                    location.href="?="+$(this).children("input[type=hidden]").val();
                })
            })
        </script>

     
        <div style="display: inline-block; margin-left: 20%;" >
            <div id="search-area" >
                <!--키워드 검색-->
                <form id="searchForm" action="" method="Get">
                    <!--카테고리 시작-->
                    <div class="community-header" > 
                        <div class="search-item-wrapper">
                            <div class="category-tag-header-wrapper"  >
                                <select class="selectpicker radius">
                                    <option>제목+내용</option>
                                    <option>제목만</option>
                                    <option>글작성자</option>
                                </select>
                            </div>
                            <input type="search" class="form-control" name="keyword"  placeholder="원하는 정렬 기준으로 검색해보세요!">
                            <a><i class="fas fa-search"></i></a>
                            
                        </div>
                    <!--카테고리 끝--> 
                    </div>
                </form>
                <!--검색 끝-->
            </div>
            <div style="display:inline-block; margin-left: 150px; margin-top: 50px;">
                <!--🔥페이징바 컬러 변경 예정🔥-->
                <!--페이징 시작-->
                <div id="pagingArea">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--페이징 끝-->
            </div>
        </div>
        




    <!--전체 감싸는 div-->
    </div>

     

    <!--푸터바 들어올 자리 -->


</body>
</html>
