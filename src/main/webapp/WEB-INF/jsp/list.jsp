<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>学生管理系统</title>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.css" />
	</head>

	<body>
		<div class="container">
			<h1 class="page-header">学生管理</h1>
			<ul class="nav nav-pills">
				<li role="presentation">
					<a href="${pageContext.request.contextPath }/stm/insert">添加</a>
				</li>
				<li role="presentation" class="disabled">
					<a href="">查询</a>
				</li>
			</ul>
			<form action="${pageContext.request.contextPath }/stm/queryStudents" method="post">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="根据学号搜索..." name="tStudent.stuNumber"> <span class="input-group-btn">
					<button class="btn btn-default btn-search" type="button">
						<span class="glyphicon glyphicon-search"></span>
					</button>
					</span>
				</div>
				<!-- /input-group -->
			</form>

			<hr>
			<table class="table table-hover table-responsive table-striped table-bordered">
				<tr>
					<th>id</th>
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>手机号</th>
					<th>班级</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="student" varStatus="status">
					<tr>
						<td>${student.stuId }</td>
						<td>${student.stuNumber }</td>
						<td>${student.stuName }</td>
						<c:if test="${student.stuSex == 0 }">
							<td>女</td>
						</c:if>
						<c:if test="${student.stuSex == 1 }">
							<td>男</td>
						</c:if>
						<td>${student.stuPhone }</td>
						<td>${student.stuClass }</td>
						<td>
							<a href="${pageContext.request.contextPath }/stm/updateQuery/${student.stuId }" class="btn btn-info">修改</a>
						</td>
						<td><button type="button" class="btn btn-primary btn-delete" data-stuid="${student.stuId }">删除</button></td>
					</tr>
				</c:forEach>

			</table>
			<div class="text-center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li>
							<a href="${pageContext.request.contextPath }/stm/queryStudents/${pageInfo.prePage }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach items="${pageInfo.navigatepageNums }" var="num">

							<c:if test="${num == pageInfo.pageNum }">
								<li class="active">
									<a href="${pageContext.request.contextPath }/stm/queryStudents/${num}">${num }</a>
								</li>
							</c:if>
							<c:if test="${num != pageInfo.pageNum }">
								<li>
									<a href="${pageContext.request.contextPath }/stm/queryStudents/${num}">${num }</a>
								</li>
							</c:if>

						</c:forEach>

						<li>
							<a href="${pageContext.request.contextPath }/stm/queryStudents/${pageInfo.nextPage }" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>

		</div>

		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
						<h4 class="modal-title" id="myModalLabel">提示！</h4>
					</div>
					<div class="modal-body">确定删除？</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary btn-delete-sure">删除</button>
					</div>
				</div>
			</div>
		</div>

		<script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>

		<script type="text/javascript">
			$(".btn-search").on("click", function() {
				$(this).parents("form").submit();
			})

			//将要删除的学生信息的id放到模态框中，点击确认删除后即可删除
			$(".btn-delete").on("click", function() {
				$('#deleteModal').data("stuid", $(this).data("stuid"));
				$('#deleteModal').modal("show");
			})
			$(".btn-delete-sure").on("click", function() {
				var stuid = $("#deleteModal").data("stuid");
				window.location.href = "http://localhost:8080/stm/deleteStudent/" + stuid;
			})
		</script>

	</body>

</html>