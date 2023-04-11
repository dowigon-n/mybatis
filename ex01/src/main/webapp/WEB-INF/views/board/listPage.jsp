<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	
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



	<form id="jobForm">
		<input type="hidden" name="page" value=${pageMaker.cri.page} />
		<input type="hidden" name="perPageNum" value=${pageMaker.cri.perPageNum} />
	</form>

	<div class="container">    
		<div class="box">
			<div class="box-header with-border">
						<h3 class="box-title">List Paging</h3>
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
								<td>
									<a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a>
								</td>
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
	
	<!-- UriComponentsBuilder 사용 방식 -->
<%-- 	<div class="d-flex justify-content-center">
			<ul class="pagination">
				<!-- JSTL의 c:if 는 boolean으로 나오는 결과를 확인하므로 ${pageMaker.prev}를 이용해서 이전 페이지로 가는 링크가 있어야 하는지를 판단함. -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>
				
				<!-- 각 페이지 번호의 출력 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li class="page-item"
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a class="page-link" href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
				</c:if>
			</ul>
		</div> --%>
	<!-- UriComponentsBuilder 사용 방식 -->
	
		<div class="d-flex justify-content-center">
			<ul class="pagination">
				<!-- JSTL의 c:if 는 boolean으로 나오는 결과를 확인하므로 ${pageMaker.prev}를 이용해서 이전 페이지로 가는 링크가 있어야 하는지를 판단함. -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">&laquo;</a></li>
				</c:if>
					
				<!-- 각 페이지 번호의 출력 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li class="page-item"
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a class="page-link" href="${idx}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>