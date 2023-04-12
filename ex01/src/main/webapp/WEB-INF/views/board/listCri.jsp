<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
    
    <%@include file="../include/header.jsp"%>
    
<section class="content">
	<div class="row">
	
		<!-- left column -->
		<div class="col-md-12">
			
			<!-- form -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Board List</h3>
				</div>
				
				<div class="box-body">
					<select name="searchType">
						<option value="n" <c:out value="${cri.searchType == null ? 'selected' :''}"/>>---</option>
						<option value="t" <c:out value="${cri.searchType eq 't' ? 'selected' :''}" />>Title</option>
						<option value="c" <c:out value="${cri.searchType eq 'c' ? 'selected' :''}" />>Content</option>
						<option value="w" <c:out value="${cri.searchType eq 'w' ? 'selected' :''}" />>Writer</option>
						<option value="tc" <c:out value="${cri.searchType eq 'tc' ? 'selected' :''}" />>Title or Content</option>
						<option value="cw" <c:out value="${cri.searchType eq 'cw' ? 'selected' :''}" />> Content or Writer</option>
						<option value="tcw" <c:out value="${cri.searchType eq 'tcw' ? 'selected' :''}" />> Title or Content or Writer</option>
					</select>
					<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" />
					
					<button id="searchBtn">Search</button>
					<button id="newBtn">New Board</button>
					
				</div>
			</div>
			
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
							<td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
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
		</div>
	</div>
	<!-- /.col (left) -->
</section>
    
<script>
	var result = '${msg}';
	
	if(result == 'success'){
		alert("정상적으로 처리되었습니다.");
	}
</script>    
    
    
    
    
    <%@include file="../include/footer.jsp"%>