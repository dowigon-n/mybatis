<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<!-- Main Content -->
	<section class="content">
		<div class="row">
		<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h1>게시글 등록</h1>
					</div>
					<!-- /.box-header -->
					<form role="form" method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">Title</label>
								<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Content</label>
								<textarea class="form-control" name="content" rows="3" placeholder="내용을 입력하세요."></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Writer</label>
								<input type="text" class="form-control" name="writer" placeholder="작성자를 입력하세요." />
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col (left) -->
		</div>
		<!-- /.row -->
	</section>
	
	<%@include file="../include/footer.jsp"%>
	
	
	
	
	
	
	
	
	