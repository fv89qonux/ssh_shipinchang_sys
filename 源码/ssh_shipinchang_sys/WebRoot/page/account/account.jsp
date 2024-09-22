<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>harmony_wisdom</title>
<%@ include file="/page/commons/common_include.jsp"%>
<script src="${pageContext.request.contextPath}/page/account/js/account.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/account/css/account.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_style.css">
</head>
<body>
	<div class="div_title">
		<div class="div_title_img"><img src="/ssh_shipinchang_sys/image/img/tb.gif" width="14" height="14" /></div>
		<div class="div_title_name">当前操作：用户管理</div>
	</div>
	
	<div class="toolbar">
		<button id="addB">增加</button>
		<button id="editB">修改</button>
		<button id="deleteB">删除</button>
		<button id="refreshB">刷新</button>
		<!-- <button id="testB">测试</button> -->
	</div>
	<table id="accountTable" style="background-color: #065A93;width: 100%;" cellpadding="1" cellspacing="1"></table>
	<hr />
	<div class="div_foot">
		<div class="div_foot_left" style="font-size: 14px;">
			总共有 <strong id="resultCount" style="color:#F81055;">0</strong> 条记录,
			当前第 <strong id="currentPage" style="color:#F81055;">0</strong> 页,
			共 <strong id="pageCount" style="color:#F81055;">0</strong> 页
		</div>
		<div class="div_foot_center" id="pageStatus"></div>
		<div class="div_foot_right">
			<table border="0" align="right" cellpadding="0" cellspacing="0" height="22px">
				<tr>
					<td width="42">
						<a href="javascript:void(0);" id="first"><img src="/ssh_shipinchang_sys/image/img/first.gif" /></a>
					</td>
					<td width="48">
						<a href="javascript:void(0);" id="pre"><img src="/ssh_shipinchang_sys/image/img/pre.gif" /></a>
					</td>
					<td width="48">
						<a href="javascript:void(0);" id="next"><img src="/ssh_shipinchang_sys/image/img/next.gif" /></a>
					</td>
					<td width="42">
						<a href="javascript:void(0);" id="last"><img src="/ssh_shipinchang_sys/image/img/last.gif" /></a>
					</td>
					<td width="37" class="STYLE22"><div align="center">转到</div></td>
					<td width="42px;">
						<select id="page_select">
							<option value="10">10</option>
						</select>
					</td>
					<td width="22" class="STYLE22"><div align="center">页</div></td>
					<td width="37" align="left">
						<a href="javascript:void(0);" id="go"><img src="/ssh_shipinchang_sys/image/img/go.gif" /></a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- ******************************** 新建或编辑窗口 ******************************** -->
	<div id="addDialog" style="display: none;margin: 0;padding: 0 0 0 0;">
	<div class="formarea">
		<form id="accountForm" method="post">
			<input type="hidden" id="id" name="id"/>
			<table border="0" id="formTable">
				<tr>
					<td style="width: 60px;">登录账号:</td>
					<td style="width: 170px;"><input type="text" id="userName" name="" /></td>
					<td style="width: 60px;">登录密码:</td>
					<td style="width: 170px;"><input type="password" id="pwd1" name="" /></td>
				</tr>
				<tr>
					<td>真实姓名:</td>
					<td><input type="text" id="realName" name="realName" /></td>
					<td>确认密码:</td>
					<td><input type="password" id="pwd2" name="" /></td>
				</tr>
				<tr>
					<td>性别:</td>
					<td>
						<select id="sex" style="width: 164px;">
							<option value="-1">-- 请选择 --</option>
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</td>
					<td>年龄:</td>
					<td><input type="text" id="age" name="age" /></td>
				</tr>
				<tr>
					<td>身份证号:</td>
					<td><input type="text" id="idCard" name="idCard" /></td>
					<td>联系电话:</td>
					<td><input type="text" id="linkPhone" name="linkPhone" /></td>
				</tr>
				<tr>
					<td>联系地址:</td>
					<td colspan="3"><input type="text" id="address" name="address" style="width: 398px;" /></td>
				</tr>
				<tr>
					<td>系统角色:</td>
					<td>
						<select id="roleLevel" style="width: 164px;">
							<option value="-1">-- 请选择 --</option>
							<option value="系统管理员">系统管理员</option>
							<option value="仓库管理员">仓库管理员</option>
							<option value="普通管理员">普通管理员</option>
						</select>
					</td>
					<td>账号状态:</td>
					<td>
						<select id="state" style="width: 164px;">
							<option value="启用">启用</option>
							<option value="禁用">禁用</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;color: red;">
						<span id="errorMsg"></span>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
	
</body>
</html>
