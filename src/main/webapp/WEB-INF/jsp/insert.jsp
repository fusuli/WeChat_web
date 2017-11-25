<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>学生管理系统</title>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.css" />
		<!--<link rel="stylesheet" type="text/css" href="../../../resources/static/css/bootstrap.css" />-->
	</head>

	<body>
		<div class="container">
			<h1 class="page-header">添加学生信息</h1>
			<ul class="nav nav-pills">
				<li class="disabled">
					<a href="">添加</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/stm/index">查询</a>
				</li>
			</ul>

			<c:if test="${error!=null && error!=''}">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
					<strong>Warning!</strong> ${error }
				</div>
			</c:if>
			<form action="${pageContext.request.contextPath }/stm/insertSubmit" method="post" id="insert-form">

				<div class="form-group">
					<label for="stuNumber" class="col-sm-2 control-label">学号：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="stuNumber" value="${student.stuNumber }" name="stuNumber" placeholder="学生学号" data-trigger="manual" data-toggle="tooltip" data-placement="left" title="学号为9位数字" />
					</div>
				</div>

				<input type="text" value="${uuid }" name="uuid" style="display: none" />

				<div class="form-group">
					<label for="stuName" class="col-sm-2 control-label">姓名：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="${student.stuName }" name="stuName" placeholder="学生姓名" data-trigger="manual" data-toggle="tooltip" data-placement="left" title="输入正确的姓名" />
					</div>
				</div>
				<div class="form-group">
					<label for="stuPhone" class="col-sm-2 control-label">性别：</label>
					<div class="col-sm-10">
						<c:if test="${student == null }">
							<div class="input-group">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									性别 <span class="caret"></span>
								</button>
									<ul class="dropdown-menu">
										<li>
											<a href="javascript:void(0)" data-sex="男">男</a>
										</li>
										<li>
											<a href="javascript:void(0)" data-sex="女">女</a>
										</li>
									</ul>
								</div>
								<input type="text" class="form-control input-stusex" value="男" readonly="readonly">
								<input type="text" name="stuSex" style="display: none;" value="1">
							</div>
						</c:if>
						<c:if test="${student != null }">
							<div class="input-group">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									性别 <span class="caret"></span>
								</button>
									<ul class="dropdown-menu">
										<li>
											<a href="javascript:void(0)" data-sex="男">男</a>
										</li>
										<li>
											<a href="javascript:void(0)" data-sex="女">女</a>
										</li>
									</ul>
								</div>
								<!-- /btn-group -->
								<c:if test="${student.stuSex == 0 }">
									<input type="text" class="form-control input-stusex" value="女" readonly="readonly">
									<input type="text" name="stuSex" style="display: none;" value="0">
								</c:if>
								<c:if test="${student.stuSex == 1 }">
									<input type="text" class="form-control input-stusex" value="男" readonly="readonly">
									<input type="text" name="stuSex" style="display: none;" value="1">
								</c:if>
							</div>
						</c:if>
					</div>
				</div>

				<div class="form-group">
					<label for="stuPhone" class="col-sm-2 control-label">手机号：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="${student.stuPhone }" name="stuPhone" placeholder="学生手机号" data-trigger="manual" data-toggle="tooltip" data-placement="left" title="输入正确的手机号码" />
					</div>
				</div>
				<div class="form-group">
					<label for="stuClass" class="col-sm-2 control-label">班级：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="${student.stuClass }" name="stuClass" placeholder="学生班级" />
					</div>
				</div>
				<input type="button" class="btn btn-info btn-add" value="添加">
			</form>

		</div>

		<script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<!--	<script src="../../../resources/static/js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../../resources/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
-->
		<script type="text/javascript">
			//用于性别的改变
			function selectSex() {
				var sex = $(this).html();

				$(".input-stusex").val(sex);
				if(sex == '男') {
					$("input[name=stuSex]").val("1");
				} else {
					$("input[name=stuSex]").val("0");
				}
			}

			$(".dropdown-menu a").on("click", selectSex);
			$(function() {
				$('[data-toggle="tooltip"]').tooltip()
			})

			//对所填写的各项信息进行验证，验证完全后再确定是否提交
			$(".btn-add").on("click", function() {

				var isSubmit = true;
				//学号验证
				var pattern = /^[0-9]{9}$/,
					str = $("input[name=stuNumber]").val();
				if(!pattern.test(str)) {
					$('input[name=stuNumber]').tooltip('show');
					isSubmit = false;
				} else {
					$('input[name=stuNumber]').tooltip('hide');
				}
				//姓名验证
				str = $("input[name=stuName]").val();
				if(str == '' || str == null) {
					$('input[name=stuName]').tooltip('show');
					isSubmit = false;
				} else {
					$('input[name=stuName]').tooltip('hide');
				}

				//手机号验证
				pattern = /^[0-9]{11}$/;
				str = $("input[name=stuPhone]").val();
				if(!pattern.test(str)) {
					$('input[name=stuPhone]').tooltip('show');
					isSubmit = false;
				} else {
					$('input[name=stuPhone]').tooltip('hide');
				}

				if(isSubmit) {
					$("#insert-form").submit();
				}
			})
		</script>
	</body>

</html>