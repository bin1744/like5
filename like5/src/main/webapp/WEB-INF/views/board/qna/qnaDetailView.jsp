<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[QnA] 게시글 상세보기</title>

<!-- qnaDetailView.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaDetailView.css" />
	
</head>

<body>
	<!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp" />

	<!-- [한솔] QnA 게시글 상세 페이지 -->
	<div class="innerOuter">
		<!-- 전체를 감싸는 div -->
		<div class="qnaMain">
			<!-- 페이지 상단 이름/질문하기 버튼 영역 -->
			<div class="qnaTop">
				<div class="qnaTop1"><h2><b>QnA</b></h2></div>
				<div class="qnaTop2">
					<c:choose>
						<c:when test="${!empty loginUser}">
							<button type="button" class="btn btn-danger"><a href="qnaEnrollForm.bo">질문하기</a></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-danger" onClick="loginAlert()">질문하기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- 페이지 상단 이름/질문하기 버튼 영역 끝 -->
			
			<script>
			// 비로그인 시 질문하기 클릭 제한
			function loginAlert(){
				alertify.alert(" 로그인 후 이용해주세요. ")
			}
			</script>

			<!-- 페이지 중단 게시글 디테일 영역 -->
			<div class="qnaMiddle">
				<!-- 게시글 정보 영역 -->
				<div class="qnaInfo">
					<table>
						<tr class="qnaInfo1">
							<td class="tableBlank" rowspan="2"></td>
							<td class="qnaTitle"><!-- 게시글 제목 -->${ b.title }</td>
							<td class="qnaLike1"><i class="far fa-thumbs-up"></i></td>
							<td class="qnaLike2"><!--좋아요 수 데이터 값 -->${ b.like }</td>
							<td class="qnaReply1"><i class="far fa-comment-dots"></i></td>
							<td class="qnaReply2"><!--답변 수 데이터 값 -->${ b.reply }</td>
							<td class="qnaView1"><i class="far fa-eye"></i></td>
							<td class="qnaView2"><!--조회수 데이터 값 -->${ b.count }</td>
							<td class="tableBlank" rowspan="2"></td>
						</tr>
						<tr class="qnaInfo2">
							<td class="qnaTag">
								<c:choose>
									<c:when test="${ empty b.tag }">
										<p id="noTag">no tag attached</p>
									</c:when>
									<c:otherwise>
										<c:forTokens var="tags" items="${ b.tag }" delims=" ">
											<button class="w3-button w3-white w3-border w3-border-red w3-round-xxlarge w3-hover-red w3-tiny">
												<!-- 클릭 시 tagDatail 페이지로 이동 -->
												<a href="tagDetail.ad"><c:out value="${ tags }"/></a>
											</button>
										</c:forTokens>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="qnaUser1"><i class="far fa-user-circle"></i></td>
							<td class="qnaUser2" colspan="3">${ b.nickname }</td>
							<td class="qnaUser3" colspan="2">${ b.enrollDate }</td>
						</tr>
					</table>
				</div>
				<!-- 게시글 정보 영역 끝 -->

				<!-- 게시글 상세 영역 -->
				<div class="qnaDetail">
					<!-- 좌측 게시글 본문 -->
					<div class="qnaContent">
						<div class="contentData">
							<!-- 본문 내용 데이터값 -->${ b.content }
						</div>
					</div>
					<!-- 좌측 게시글 본문 끝 -->

					<!-- 우측 아이콘 옵션 -->
					<div class="qnaIcon">
						<!-- 글 작성자와 로그인한 회원이 불일치할 경우 -->
						<c:choose>
							<c:when test="${ loginUser.memNo ne b.mno }">
								<table>
									<tr><td></td></tr>
									<c:choose>
										<c:when test="${!empty loginUser}">
											<tr>
												<td class="icon"><i class="far fa-thumbs-up" id="like"></i>
													<i class="fas fa-thumbs-up" id="selected-like" style="display: none; color: rgb(220, 53, 69);"></i>
												</td>
											</tr>
											<tr><td class="iconName">좋아요</td></tr>
											<tr>
												<td class="icon"><i class="far fa-bookmark" id="scrap"></i>
													<i class="fas fa-bookmark" id="selected-scrap" style="display: none; color: rgb(220, 53, 69);"></i>
												</td>
											</tr>
											<tr><td class="iconName">스크랩</td></tr>
											<tr>
												<td class="icon"><i class="far fa-thumbs-down" data-toggle="modal" data-target="#report-modal"></i></td>
											</tr>
											<tr><td class="iconName">신고하기</td></tr>
										</c:when>
										<c:otherwise>
											<!-- 비회원일 경우 -->
											<tr onClick="loginAlert()">
												<td class="icon"><i class="far fa-thumbs-up" id="like"></i></td>
											</tr>
											<tr><td class="iconName">좋아요</td></tr>
											<tr onClick="loginAlert()">
												<td class="icon"><i class="far fa-bookmark" id="scrap"></i></td>
											</tr>
											<tr onClick="loginAlert()"><td class="iconName">스크랩</td></tr>
											<tr onClick="loginAlert()">
												<td class="icon"><i class="far fa-thumbs-down"></i></td>
											</tr>
											<tr><td class="iconName">신고하기</td></tr>
										</c:otherwise>
									</c:choose>
									<!-- 서버 연동할 경우 그 후에 작업 (로컬로 url 파싱 불가) -->
									<tr><td class="icon"><i class="fas fa-share-alt" data-toggle="modal" data-target="#url-modal"></i></td></tr>
									<tr><td class="iconName">URL 공유</td></tr>
									<tr><td></td></tr>
								</table>
							</c:when>
							<c:otherwise>		
								<!-- 글 작성자와 로그인한 회원이 일치할 경우 -->
					            <table>
					              <tr><td></td></tr>
					              <tr><td class="icon"><i class="fas fa-sync-alt" onclick="contentSubmit(1)"></i></td></tr>
					              <tr><td class="iconName">수정하기</td></tr>
					              <tr><td class="icon"><i class="fas fa-share-alt" data-toggle="modal" data-target="#url-modal"></i></td></tr>
					              <tr><td class="iconName">URL 공유</td></tr>
					              <tr><td class="icon"><i class="far fa-trash-alt" data-toggle="modal" data-target="#delete-modal"></i></td></tr>
					              <tr><td class="iconName">삭제하기</td></tr>
					              <tr><td></td></tr>
					            </table>
					    	</c:otherwise>
						</c:choose>
						
						<form id="submitForm" method="post">
							<input type="hidden" name="bno" value="${ b.bno }">
						</form>
						
						<script>
						function contentSubmit(num){
							if(num == 1){
								location.herf="qnaUpdateForm.bo?bno=" + $("${b.bno}")
							}else{
								$("#sumitForm").attr("action", "qneDelete.bo").submit();
							}
						}
						</script>
						
					</div>
					<!-- 우측 아이콘 옵션 끝 -->
				</div>
				<!-- 게시글 상세 영역 끝 -->
			</div>
			<!-- 페이지 중단 게시글 디테일 영역 끝 -->
			
			<script>
			//좋아요 아이콘 클릭 시 아이콘 변경
			$('[class$=fa-thumbs-up]').click(function() {
				if ($('#selected-like').css('display') == 'none') {
					$('#selected-like').css('display', '');
					$('#like').css('display', 'none');
				} else {
					$('#selected-like').css('display', 'none');
					$('#like').css('display', '');
				}
			})
	
			//스크랩 아이콘 클릭 시 아이콘 변경
			$('[class$=fa-bookmark]').click(function() {
				if ($('#selected-scrap').css('display') == 'none') {
					$('#selected-scrap').css('display', '');
					$('#scrap').css('display', 'none');
				} else {
					$('#selected-scrap').css('display', 'none');
					$('#scrap').css('display', '');
				}
			})
			</script>
		
			<!-- 페이지 하단 댓글 디테일 영역 -->
			<div class="qnaBottom">
				<!-- 답변 갯수 안내 -->
				<div class="replyGuide"><b><!-- 게시글 답변 개수 -->N개의 답변</b></div>

				<!-- 원댓글 영역 -->
				<div class="replyLv1">
					<!-- 답변자 정보 영역 -->
					<!-- 채택된 답변일 경우, 내가 작성한 댓글일 경우 → .replyInfo 배경색 변경 -->
					<div class="replyInfo">
						<table>
							<tr class="replyInfo1">
								<td class="tableBlank" rowspan="2"></td>
								<td class="replyUser1" rowspan="2"><i class="far fa-user-circle"></i></td>
								<td class="replyUser2">답변작성자A</td>
								<td class="replyAdoption" rowspan="2">
									<!-- 글 작성자와 로그인한 회원이 일치할 경우 채택하기 버튼 보여짐 -->
									<c:choose>
										<c:when test="${loginUser.memNo eq b.mno}">
											<button type="button" class="btn text-muted btn-lg" data-toggle="modal" data-target="#adoption-modal">
												<i class="far fa-check-square text-muted"></i>&nbsp;&nbsp;&nbsp;채택하기
											</button>
										</c:when>
									</c:choose>
								</td>
								<!-- 로그인 한 회원만 대댓글 달기 버튼 활성화 가능 -->
								<td class="reReply" rowspan="2">
									<c:if test="${!empty loginUser}">
										<button type="button" class="btn text-muted btn-lg">
											<i class="far fa-plus-square text-muted"></i>&nbsp;&nbsp;&nbsp;대댓글 달기
										</button>
									</c:if>
								</td>
								<td class="tableBlank" rowspan="2"></td>
							</tr>
							<tr class="replyInfo2">
								<td class="replyUser3">2021-06-06</td>
							</tr>
						</table>
					</div>
					<!-- 답변자 정보 영역 끝 -->
					
					<script>
					// 대댓글 달기 클릭 시 나타나는 작성 영역 슬라이드 업&다운
			        $(function(){
			            $('.reReply').click(function(){
								if($('#writeReReply').css('display') == "none"){
			                    $('#writeReReply').slideDown();
			                }else{
			                    $('#writeReReply').slideUp();
			                }
			            })
			        })
			        </script>

					<!-- 답변 상세 영역 -->
					<div class="replyDetail">
						<!-- 좌측 답변 본문 -->
						<div class="replyContent">
							<div class="replyContentData">
								<!-- 답변 내용 데이터값 -->답변 내용 데이터 일치시켜서 가져오기
							</div>
						</div>
						<!-- 좌측 답변 본문 끝 -->

						<!-- 우측 아이콘 옵션 -->
						<div class="replyIcon">
							<c:choose>
								<c:when test="${ loginUser.memNo ne b.mno }">
									<!-- 답변 작성자와 로그인한 회원이 불일치할 경우 -->
									<table>
										<tr><td class="rIcon"></td></tr>
										<c:choose>
											<c:when test="${!empty loginUser}">
												<tr>
													<td class="rIcon"><i class="far fa-heart" data-toggle="modal" data-target="#sponsorship-modal"></i></td>
												</tr>
												<tr><td class="rIconName">후원하기</td></tr>
												<tr>
													<td class="rIcon"><i class="far fa-thumbs-down" data-toggle="modal" data-target="#report-modal"></i></td>
												</tr>
												<tr><td class="rIconName">신고하기</td></tr>
											</c:when>
											<c:otherwise>
												<tr onClick="loginAlert()">
													<td class="rIcon"><i class="far fa-heart"></i></td>
												</tr>
												<tr><td class="rIconName">후원하기</td></tr>
												<tr onClick="loginAlert()">
													<td class="rIcon"><i class="far fa-thumbs-down"></i></td>
												</tr>
												<tr><td class="rIconName">신고하기</td></tr>
											</c:otherwise>
										</c:choose>
										<tr><td></td></tr>
									</table>
								</c:when>
								<c:otherwise>
									<!-- 답변 작성자와 로그인한 회원이 일치할 경우 -->
					                <table>
						                <tr><td class="rIcon"><i class="far fa-trash-alt" data-toggle="modal" data-target="#delete-modal"></i></td></tr>
						                <tr><td class="rIconName">삭제하기</td></tr>
					                </table>
					        	</c:otherwise>
			                </c:choose>
						</div>
						<!-- 우측 아이콘 옵션 끝 -->
					</div>
					<!-- 답변 상세 영역 끝 -->
				</div>
				<!-- 원댓글 영역 끝 -->
				
				<!-- 원댓글에 대댓글 달기 / 대댓글 작성 취소하기 -->
				<div class="writeReReply" id="writeReReply" style="display:none;">
					<!-- 대댓글 작성자 정보 영역 -->
					<div class="userInfo">
						<table>
							<tr class="loginUserInfo">
								<td class="tableBlank"></td>
								<td class="userInfo1"><i class="far fa-user-circle"></i></td>
								<td class="userInfo2">${ b.nickname }</td>
								<td class="userInfo3">
									<button type="button" class="btn btn-danger" onclick="return validate();"><a href="">작성하기</a></button>
								</td>
							</tr>
						</table>
					</div>
					
					<!--  대댓글 작성 영역 -->
					<div class="userWrite1">
						<!-- 마크다운 API가 들어올 자리 -->
						<div>
							<textarea class="form-control" rows="5"></textarea>
						</div>
						<!-- 마크다운 API가 들어올 자리 끝-->
					</div>
					<!-- 답변 상세 영역 끝  -->
				</div>
				<!-- 원댓글에 대댓글 달기 / 대댓글 작성 취소하기 끝 -->

				<!-- 대댓글 영역 -->
				<div class="replyLv2">
					<!-- 답변자 정보 영역 -->
					<div class="replyInfo">
						<table>
							<tr class="replyInfo1">
								<td class="tableBlank" rowspan="2"></td>
								<td class="replyUser1" rowspan="2"><i class="far fa-user-circle"></i></td>
								<td class="replyUser2">답변작성자B</td>
							</tr>
							<tr class="replyInfo2">
								<td class="replyUser3">2021-06-06</td>
							</tr>
						</table>
					</div>
					<!-- 답변자 정보 영역 끝 -->

					<!-- 답변 상세 영역 -->
					<div class="replyDetail">
						<!-- 좌측 답변 본문 -->
						<div class="replyContent">
							<div class="replyContentData">
								<!-- 답변 내용 데이터값 -->답변 내용 데이터 일치시켜서 가져오기
							</div>
						</div>
						<!-- 좌측 답변 본문 끝 -->

						<!-- 우측 아이콘 옵션 -->
						<div class="replyIcon">
							<!-- 답변 작성자와 로그인 한 회원이 불일치할 경우 -->
							<table>
								<tr><td class="rIcon"></td></tr>
								<c:choose>
									<c:when test="${!empty loginUser}">
										<tr>
											<td class="rIcon"><i class="far fa-heart" data-toggle="modal" data-target="#sponsorship-modal"></i></td>
										</tr>
										<tr><td class="rIconName">후원하기</td></tr>
										<tr>
											<td class="rIcon"><i class="far fa-thumbs-down" data-toggle="modal" data-target="#report-modal"></i></td>
										</tr>
										<tr><td class="rIconName">신고하기</td></tr>
									</c:when>
									<c:otherwise>
										<tr onClick="loginAlert()">
											<td class="rIcon"><i class="far fa-heart"></i></td>
										</tr>
										<tr><td class="rIconName">후원하기</td></tr>
										<tr onClick="loginAlert()">
											<td class="rIcon"><i class="far fa-thumbs-down"></i></td>
										</tr>
										<tr><td class="rIconName">신고하기</td></tr>
									</c:otherwise>
								</c:choose>
								<tr><td></td></tr>
							</table>

							<!-- 답변 작성자와 로그인 한 회원이 일치할 경우
			                <table>
			                <tr><td></td></tr>
			                <tr><td class="rIcon"><i class="fas fa-angle-up"></i></td></tr>
			                <tr><td class="rLikeNum">답변 좋아요 데이터 값</td></tr>
			                <tr><td class="rIcon"><i class="fas fa-angle-down"></i></td></tr>
			                <tr><td class="rIconName">좋아요</td></tr>
			                <tr><td class="rIcon"><i class="far fa-trash-alt"></i></td></tr>
			                <tr><td class="rIconName">삭제하기</td></tr>
			                </table> -->
						</div>
						<!-- 우측 아이콘 옵션 끝 -->
					</div>
					<!-- 답변 상세 영역 끝 -->
				</div>
				<!-- 대댓글 영역 끝-->
			</div>
			<!-- 페이지 하단 댓글 디테일 영역 끝 -->

			<!-- 답변을 작성할 수 있는 영역(항상 보여짐) -->
			<div class="writeReply">
				<!-- 답변 작성 안내 -->
				<div class="replyGuide">
					<div class="replyGuide1"><b>답변 달기</b></div>
					<div class="replyGuide2">⭐ 답변 작성 시 유의사항 안내 
						<span class="tooltiptext">
							LIKE5의 질문에 답변해주셔서 감사합니다 👍<br>
							답변을 달기 전, 아래의 유의사항을 확인해주세요!<br><br>
							＊ 질문과 관련된 답변인지 확인해주세요<br>
							＊ 답변이 정확한 정보인지 확인해주세요<br>
							＊ 답변이 등록되면 수정이 불가능해요<br>
							＊ 내용에 오·탈자가 없는지 확인해주세요
						</span>
					</div>
					<div class="replyGuide3"></div>
				</div>
				<!-- 답변 작성 안내 끝 -->

				<!-- 로그인한 회원 정보 영역 -->
				<div class="userInfo">
					<table>
						<tr class="loginUserInfo">
							<td class="tableBlank"></td>
							<td class="userInfo1"><i class="far fa-user-circle"></i></td>
							<c:choose>
								<c:when test="${!empty loginUser}">
									<td class="userInfo2">${ b.nickname }</td>
								</c:when>
								<c:otherwise>
									<td class="userInfo2">GUEST</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
				</div>
				<!-- 답변자 정보 영역 끝 -->

				<!-- 답변 상세 영역 -->
				<div class="userWrite1">
					<!-- 마크다운 API가 들어올 자리 -->
					<c:choose>
						<c:when test="${!empty loginUser}">
							<div>
								<textarea class="form-control" rows="5"></textarea>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<textarea class="form-control" rows="5" placeholder=" 로그인 후 이용해주세요. " disabled></textarea>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 답변 상세 영역 끝  -->

				<!-- 답변달기 관련 하단부 -->
				<div class="userWrite2">
					<c:choose>
						<c:when test="${!empty loginUser}">
							<button type="submit" class="btn btn-danger" onclick="return validate();">
								<a href="">답변달기</a>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-danger" onClick="loginAlert()">답변달기</button>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 답변달기 버튼 끝 -->
			</div>
			<!-- 답변달기 관련 하단부 끝 -->
		</div>
		<!-- 답변을 작성할 수 있는 영역(항상 보여짐) 끝 -->


		<!-- 신고하기 모달창 -->
		<div class="modal fade" id="report-modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">🚨 <b>신고하기</b></h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="report-user"><b>작성자 : </b> 글/댓글 작성자 닉네임</div>
						<div class="modal-choice">
							<table>
								<tr>
									<td style="font-size: 14px; padding-right: 10px;"><b>사유선택 :</b></td>
									<td rowspan="2" style="font-size: 13px; padding-bottom: 18px;">
										&nbsp;여러 사유에 해당되는 경우,<br>&nbsp;대표 사유를 선택해주세요.
									</td>
								</tr>
								<tr><td rowspan="5"></td></tr>
								<tr>
									<td><input type="radio" id="f-option" name="selector">
										<label for="f-option">홍보성 게시글</label></td>
								</tr>
								<tr>
									<td><input type="radio" id="s-option" name="selector">
										<label for="s-option">욕설 및 비방</label></td>
								</tr>
								<tr>
									<td><input type="radio" id="t-option" name="selector">
										<label for="t-option">명예훼손 및 사생활 침해</label></td>
								</tr>
								<tr>
									<td><input type="radio" id="o-option" name="selector">
										<label for="o-option">기타</label></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">신고하기</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 신고하기 모달창 끝 -->


		<!-- 후원하기 모달창 -->
		<div class="modal fade" id="sponsorship-modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">💌 <b>후원하기</b></h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<br>답변이 마음에 드셨다면<br>해당 작성자에게 후원할 수 있습니다.<br>후원하시겠어요?
						<br><br>
						<p style="font-size: 9px;">(OK 버튼 클릭 시 결제창으로 이동합니다.)</p>
					</div>
					<div class="modal-footer" style="justify-content: center;">
						<button type="submit" class="btn btn-danger btn-block">OK</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 후원하기 모달창 끝 -->


		<!-- 채택하기 모달창 -->
		<div class="modal fade" id="adoption-modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">👍 <b>채택하기</b></h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<br>답변이 마음에 드셨다면<br>해당 답변을 채택할 수 있습니다.<br>채택하시겠어요?
						<br><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">채택하기</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 채택하기 모달창 끝 -->
		
		
		<!-- 삭제하기 모달창 -->
		<div class="modal fade" id="delete-modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">🚫 <b>삭제하기</b></h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<br>해당 글을 삭제하게되면<br>질문에 대한 답변을 받을 수 없어요😥<br>정말 삭제하시겠어요?
						<br><br>
						<p style="font-size: 9px;">(삭제하기 버튼 클릭 시 글이 삭제됩니다.)</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal" onclick="contentSubmit(2)">삭제하기</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 삭제하기 모달창 끝 -->
		
		<!-- URL 공유 모달창 -->
		<div class="modal fade" id="url-modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">📢 <b>URL 공유하기</b></h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						추후 URL 공유 작업 예정
					</div>
				</div>
			</div>
		</div>
		<!-- URL 공유 모달창 끝 -->

	</div>
	<!-- 전체를 감싸는 div 끝 -->


	<!-- 위로가기 아이콘 -->
	<a href="#header"><i class="fas fa-chevron-up" id="toTheTop">&nbsp;TOP</i></a>

	
	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>