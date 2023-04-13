<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="../include/header.jsp"%>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
	
			<form id="jobForm">
				<input type="hidden" name="page" value="${pageMaker.cri.page}" />
				<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" />
			</form>
	
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">BOARD LIST</h3>
				</div>
				
					<div class="box-body">
						<select name="searchType">
							<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>> ----------------- </option>
							<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
							<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
							<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>
							<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목/내용</option>
							<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용/작성자</option>
							<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목/내용/작성자</option>
						</select>
							
						<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" />
						<button id="searchBtn">검색</button>
						<button id="newBtn">글 작성</button>
			 	</div>
		 	</div>
				
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>
						<c:forEach items="${list}" var="boardVO">
						<tr>
							<td>${boardVO.bno}</td>
							<%-- <td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a></td> --%>
							<td><a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a></td>
							<td>${boardVO.writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
							<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box-footer -->
			<div class="text-center">
				<div class="d-flex justify-content-center">
					<ul class="pagination">
						<!-- JSTL의 c:if 는 boolean으로 나오는 결과를 확인하므로 ${pageMaker.prev}를 이용해서 이전 페이지로 가는 링크가 있어야 하는지를 판단함. -->
						<c:if test="${pageMaker.prev}">
							<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:if>
							
						<!-- 각 페이지 번호의 출력 -->
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li 
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.col (left) -->
	</div>
</section>

<script>
$(document).ready(function() {
			
	$('#searchBtn').on("click",	function(event) {
		self.location = "list" + '${pageMaker.makeQuery(1)}'
		+ "&searchType=" + $("select option:selected").val()
		+ "&keyword=" + encodeURIComponent($('#keywordInput').val()); 
	});
	
	$('#newBtn').on("click", function(evt){
		self.location = "register";
	});
});
</script>

		
<script>
	$(".pagination li a").on("click", function(event) {
		
		event.prevenDefault;
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/board/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>

<script>
	var result = '${msg}';
	
	if(result == 'SUCCESS'){
		alert("정상적으로 처리되었습니다.");
	}
</script>    		
		
<%@include file="../include/footer.jsp"%>
