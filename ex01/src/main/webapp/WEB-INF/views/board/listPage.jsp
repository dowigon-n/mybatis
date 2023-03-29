<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

<div class="text-center">
	<ul class="pagination">
		<!-- JSTL의 c:if 는 boolean으로 나오는 결과를 확인하므로 ${pageMaker.prev}를 이용해서 이전 페이지로 가는 링크가 있어야 하는지를 판단함. -->
		<c:if test="${pageMaker.prev}">
			<li><a href="listPage?page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		
		<!-- 각 페이지 번호의 출력 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx? 'class=active' : ''}"/>>
				<a href="listPage?page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="listPage?page=${pageMaker.endPage + 1}">&raquo;</a></li>
		</c:if>
	</ul>
</div>