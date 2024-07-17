<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../head.jsp"%>
<title>수정하기</title>
<style>
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div id="main_content">
		<%@ include file="../searchHeader.jsp"%>

		<form id="updateForm" method="post"
			action="${hpath }/notice/update.do" enctype="multipart/form-data">
			<div class="card-body">
			 <input type="hidden" id="fileNoDel" name="fileNoDel" value="" />
			<input type="hidden" id="noticeNo" name="noticeNo" value="${notice.noticeNo }" />
				<div class="form-group">
					<label for="noticeTitle">제목</label> <input type="text"
						class="form-control" id="noticeTitle" name="noticeTitle"
						value="${notice.noticeTitle}" required>
				</div>
				<div class="form-group">
					<label for="noticeCategory">분류</label> <select class="form-control"
						id="noticeCategory" name="noticeCategory">
						<option value="general"
							<c:if test="${notice.noticeCategory == 'general'}">selected</c:if>>일반</option>
						<option value="event"
							<c:if test="${notice.noticeCategory == 'event'}">selected</c:if>>이벤트</option>
						<option value="service"
							<c:if test="${notice.noticeCategory == 'service'}">selected</c:if>>서비스</option>
						<option value="etc"
							<c:if test="${notice.noticeCategory == 'etc'}">selected</c:if>>기타</option>
					</select>
				</div>
				<label for="files">파일 변경하기</label>
				<div id="files" class="file-list">
					<c:if test="${not empty notice.files}">
					<ol type="1">
						<c:forEach var="file" items="${notice.files}">
						
							<li>파일: </li>
							<div>
								 <a
									href="${path0}/${file.changedName}"
									download="${file.originalName}">
									${fn:escapeXml(file.originalName)} </a>
								<button type="button" class="fileDelBtn"
									value="${file.nfileNo}">삭제</button>
							</div>
						</c:forEach>
						<c:if test="${fn:length(notice.files) < 3}">
                            <c:forEach var="i" begin="${fn:length(notice.files)}" end="2">
                            <li>파일: </li>
                                <input type="file" class="form-control-file border" name="updatefile" />
                            </c:forEach>
                        </c:if>
						</ol>
					</c:if>
					<c:if test="${empty notice.files}">
						<input type="file" class="form-control-file border"
							name="updatefile" />
						<input type="file" class="form-control-file border"
							name="updatefile" />
						<input type="file" class="form-control-file border"
							name="updatefile" />
					</c:if>
				</div>
				<div class="form-group">
					<label for="noticeContent">내용</label>
					<textarea class="form-control" rows="5" id="noticeContent"
						name="noticeContent" style="resize: none;" required>${notice.noticeContent}</textarea>
				</div>
				<a class=" button btn" href="${path0}/sqlrecord/notices"
					style="background-color: #ff52a0; height: 40px; color: white; border: 0; opacity: 0.8">닫기</a>
				<button type="submit" class="btn"
					style="background-color: red; height: 40px; color: white; border: 0; opacity: 0.8">작성하기</button>
			</div>
		</form>
		

	</div>

	<script>
	 var fileNoArry = [];

     $(document).on('click', '.fileDelBtn', function() {
         var fileNo = $(this).val();
         fileNoArry.push(fileNo);
         $('#fileNoDel').val(fileNoArry.join(',')); // Join array as comma-separated string
         $(this).parent().remove();
         console.log( $('#fileNoDel').val());
     });
		
		</script>
	<script src="${hpath }/resources/js/forHeader.js?after1"></script>
	<%@ include file="../footer.jsp"%>

</body>
</html>