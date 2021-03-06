<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="${basePath }img/title_cloud.png" />
<title>应用发布</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<jsp:include page="../js.jsp"></jsp:include>
<link rel="stylesheet" href="${basePath}css/user/container.css" />
<script src="${basePath }ace/assets/js/jquery.validate.min.js"></script>
<script src="${basePath }ace/assets/js/additional-methods.min.js"></script>
<script src="${basePath }ace/assets/js/jquery.maskedinput.min.js"></script>
<script src="${basePath }ace/assets/js/select2.min.js"></script>
<script src="${basePath }js/bootstrap-paginator.min.js"></script>
<script src="${basePath }ace/assets/js/fuelux/fuelux.wizard.min.js"></script>
<script src="${basePath }js/console/appreleasedetail.js"></script>
<c:set var="authButton" value='${buttonsAuth}'></c:set>

</head>
<body class="no-skin">
	<jsp:include page="../header.jsp"></jsp:include>
	<c:if test="${fn:contains(authButton,'containerTrash')}">
		<input type="hidden" id="delete_container">
	</c:if>
	<c:if test="${fn:contains(authButton,'containerStop')}">
		<input type="hidden" id="stop_container">
	</c:if>
	<c:if test="${fn:contains(authButton,'containerStart')}">
		<input type="hidden" id="start_container">
	</c:if>
	<%-- <c:if test="${fn:contains(authButton,'containerSync')}">
		<input type="hidden" id="sync_container">
	</c:if> --%>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<jsp:include page="../nav.jsp">
			<jsp:param value="pushapp_admin" name="page_index" />
		</jsp:include>
		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a
							href="${basePath}index.html"><strong>首页</strong></a></li>
						<li class="active"><b>应用发布</b></li>
						<li class="active"><b>&nbsp;<span id="application_name"></span>&nbsp;实例列表
						</b></li>
					</ul>
				</div>
				<div id="mask" class="mask">
					<div id="spinner-message" class="spinner-message">
						<font></font>
					</div>
					<i id="spinner"
						class="spinner ace-icon fa fa-spinner fa-spin white"></i>
				</div>
				<input id="appId" type="hidden" value="${appId}">
				<input id="imageId" type="hidden" value="${imageId}">
				<input id="balanceId" type="hidden" value="${balanceId}">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="well well-sm">
								<button class="btn btn-sm btn-danger btn-round"
									onclick="window.location.href='/apprelease/index.html'">
									<i class="ace-icon fa fa-arrow-left bigger-125"></i><b>返回</b>
								</button>
								<div class="btn-group">
									<button data-toggle="dropdown"
										class="btn btn-primary btn-round btn-sm dropdown-toggle">
										<i class="ace-icon fa fa-wrench  bigger-110 icon-only"></i> <b>更多操作</b>
										<i class="ace-icon fa fa-angle-down icon-on-right"></i> <input
											id="conIds" type="hidden">
									</button>
									<ul class="dropdown-menu dropdown-primary dropdown-menu-left">
										<c:if test="${fn:contains(authButton,'containerStart')}">
											<li><a class="btn-forbidden" id="start"><span
													class="glyphicon glyphicon-play"></span>&nbsp;批量启动</a></li>
										</c:if>
										<c:if test="${fn:contains(authButton,'containerStop')}">
											<li><a class="btn-forbidden" id="stop"><span
													class="glyphicon glyphicon-stop"></span>&nbsp;批量停止</a></li>
										</c:if>
										<c:if test="${fn:contains(authButton,'containerTrash')}">
											<li><a class="btn-forbidden" id="trash"><span
													class="glyphicon glyphicon-trash"></span>&nbsp;批量删除</a></li>
										</c:if>
										<!-- <li><a id="sync"><span
													class="glyphicon glyphicon-repeat"></span>&nbsp;容器同步</a></li> -->
									</ul>
								</div>
								<button class="btn btn-sm btn-danger btn-round"
									onclick="showAllContainers()">
									<i class="ace-icon fa fa-list-alt bigger-125"></i><b>显示全部</b>
								</button>
								<div class="col-xs-12 col-sm-4" style="float: right">
									<c:if test="${fn:contains(authButton,'appReleaseList')}">
										<div class="input-group">
											<input id="search_name" type="text"
												class="form-control search-query" placeholder="请输入实例标识模糊查询">
											<span class="input-group-btn">
												<button id="search" type="button"
													class="btn btn-primary btn-round btn-sm"
													onclick="SearchContainerIns()">
													查找 <i
														class="ace-icon fa fa-search icon-on-right bigger-110"></i>
												</button>
											</span> <span class="input-group-btn"> &nbsp; </span> <span
												class="input-group-btn">
												<button id="detailSearch" type="button"
													class="btn btn-warning btn-round btn-sm"
													onclick="ASContainerIns()">
													更多 <i
														class="ace-icon fa fa-search icon-on-right bigger-110"></i>
												</button>
											</span>
										</div>
									</c:if>
								</div>
							</div>
							<div>
								<c:if test="${fn:contains(authButton,'containerList')}">
									<table id="container_list"></table>
									<div id="container_page"></div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%--advanced search modal begin --%>
	<div class="modal fade" id="advanSearchCIModal" tabindex="-1"
		role="dialog" aria-labelledby="containerModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="containerModalLabel">高级搜索</h4>
				</div>
				<div class="modal-body">
					<div class="left">
						<div class="item">
							<label><b>列名称</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
								style="margin-left: 42px;"><b>搜索参数</b></label>
						</div>
						<form class='form-horizontal' role='form'
							id='advanced_search_ci_frm'>
							<div class="item">
								<ul class="ci_params" id="ci_params"
									style="list-style-type: none; margin: 0px 0px 10px 0px;">
									<li class="ci_params" style="margin-top: 10px;">
										<div class="select-con"
											style="height: 33px; width: 100px; float: left;">
											<select class="dropdown-select param-meter" name="ci_meter"
												id="ci_meter">
												<option value='0'>请选条件</option>
												<option value='1'>实例标识</option>
												<option value='2'>运行状态</option>
												<option value='3'>健康状态</option>
												<option value='4'>监控状态</option>
												<option value='5'>端口占用</option>
												<option value='6'>备注信息</option>
											</select>
										</div> <input class="short-input" type="text" name="ci_param_value"
										id="ci_param_value" placeholder="输入查询值..." value=""
										style="width: 73%; border: 1px solid #ccc; height: 30px">
										<a href="#" id="ci_remove-param" style="display: none;"> <span
											class="glyphicon glyphicon-remove delete-param"></span>
									</a>
									</li>
								</ul>
								<a class="btn btn-primary" id="ci_add-param" type="button"
									style="color: #fff; width: 87px;">
									<div style="margin: -7px -7px -7px -10px;">
										<span class="glyphicon glyphicon-plus"></span> <span
											class="text">添加条件</span>
									</div>
								</a>
							</div>
						</form>

						<div class="modal-footer">
							<button id="ci_advanced_cancel" type="button"
								class="btn btn-danger btn-round">取消</button>
							<button id="ci_advanced_search" type="button"
								class="btn btn-success btn-round">查询</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--advanced search modal end --%>
</body>
</html>
