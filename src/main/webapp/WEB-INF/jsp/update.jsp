<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生管理系统</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/css/bootstrap.css" />
</head>

<body>
	<div class="container">
		<h1 class="page-header">修改学生信息</h1>
		<ul class="nav nav-pills">
			<li><a href="${pageContext.request.contextPath }/stm/insert">添加</a></li>
			<li><a href="${pageContext.request.contextPath }/stm/index">查询</a></li>
		</ul>
		<c:if test="${error!=null && error!=''}">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Warning!</strong> ${error }
			</div>
		</c:if>
		<form action="${pageContext.request.contextPath }/stm/updateSubmit"
			method="post" id="update-form">
			<table
				class="table table-hover table-responsive table-striped table-bordered">
				<tr>
					<th>id</th>
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>手机号</th>
					<th>班级</th>
					<th>编辑</th>
				</tr>
				<tr>
					<td><input type="text" class="form-control"
						value="${student.stuId }" name="stuId" placeholder="学生id" readonly></td>
					<td><input type="text" class="form-control"
						value="${student.stuNumber }" name="stuNumber" placeholder="学生学号"
						data-trigger="manual" data-toggle="tooltip"
						data-placement="bottom" title="学号为9位数字"></td>
					<td><input type="text" class="form-control"
						value="${student.stuName }" name="stuName" placeholder="学生姓名"
						data-trigger="manual" data-toggle="tooltip"
						data-placement="bottom" title="输入正确的姓名"></td>

					<td id="td-stusex">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									性别 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="javascript:void(0)" data-sex="男">男</a></li>
									<li><a href="javascript:void(0)" data-sex="女">女</a></li>
								</ul>
							</div>
							<!-- /btn-group -->
							<c:if test="${student.stuSex == 0 }">
								<input type="text" class="form-control input-stusex" value="女"
									readonly="readonly">
								<input type="text" name="stuSex" style="display: none;"
									value="0">
							</c:if>
							<c:if test="${student.stuSex == 1 }">
								<input type="text" class="form-control input-stusex" value="男"
									readonly="readonly">
								<input type="text" name="stuSex" style="display: none;"
									value="1">
							</c:if>
						</div> <!-- /input-group -->
					</td>

					<td><input type="text" class="form-control"
						value="${student.stuPhone }" name="stuPhone" placeholder="学生手机号"
						data-trigger="manual" data-toggle="tooltip"
						data-placement="bottom" title="输入正确的手机号码"></td>
					<td><input type="text" class="form-control"
						value="${student.stuClass }" name="stuClass" placeholder="学生班级"></td>
					<td><input type="button" class="btn btn-info btn-update"
						value="修改"></td>
				</tr>

			</table>
		</form>

	</div>

	<script
		src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath }/static/js/bootstrap.js"
		type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		//用于性别的改变
		function selectSex() {
			var sex = $(this).html()

			$("#td-stusex .input-stusex").val(sex);
			if (sex == '男') {
				$("input[name=stuSex]").val("1");
			} else {
				$("input[name=stuSex]").val("0");
			}
		}

		$("#td-stusex .dropdown-menu a").on("click", selectSex);

		//对所填写的各项信息进行验证，验证完全后再确定是否提交
		$(".btn-update").on("click", function() {

			var isSubmit = true;
			//学号验证
			var pattern = /^[0-9]{9}$/, str = $("input[name=stuNumber]").val();
			if (!pattern.test(str)) {
				$('input[name=stuNumber]').tooltip('show');
				isSubmit = false;
			} else {
				$('input[name=stuNumber]').tooltip('hide');
			}
			//姓名验证
			str = $("input[name=stuName]").val();
			if (str == '' || str == null) {
				$('input[name=stuName]').tooltip('show');
				isSubmit = false;
			} else {
				$('input[name=stuName]').tooltip('hide');
			}

			//手机号验证
			pattern = /^[0-9]{11}$/;
			str = $("input[name=stuPhone]").val();
			if (!pattern.test(str)) {
				$('input[name=stuPhone]').tooltip('show');
				isSubmit = false;
			} else {
				$('input[name=stuPhone]').tooltip('hide');
			}

			if (isSubmit) {
				$("#update-form").submit();
			}
		})
	</script>
</body>

</html>