<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>harmony_wisdom</title>
<%@ include file="/page/commons/common_include.jsp"%>
<script src="${pageContext.request.contextPath}/page/outstore/js/outstore.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/outstore/css/outstore.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_style.css">
</head>
<body>
	<div class="div_title">
		<div class="div_title_img"><img src="/ssh_shipinchang_sys/image/img/tb.gif" width="14" height="14" /></div>
		<div class="div_title_name">当前操作：出库管理</div>
	</div>
	
	<div class="toolbar">
		<button id="addB">增加</button>
		<button id="editB">修改</button>
		<button id="deleteB">删除</button>
		<button id="refreshB">刷新</button>
		<!-- <button id="testB">测试</button> -->
	</div>
	<table id="outstoreTable" style="background-color: #065A93;width: 100%;" cellpadding="1" cellspacing="1"></table>
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
		<form id="outstoreForm" method="post">
			<input type="hidden" id="id" name="id"/>
			<table border="0">
				<tr>
					<td style="width: 60px;">出库商品:</td>
					<td style="width: 170px;"><select id="goodsId" name="goodsId" style="width: 164px;"></select></td>
					<td style="width: 60px;">出库数量:</td>
					<td style="width: 170px;"><input type="text" id="amount" name="amount"/></td>
				</tr>
				<tr>
					<td>出库单价:</td>
					<td><input type="text" id="price" name="price" /></td>
					<td>消费者:</td>
					<td><select id="consumerId" name="consumerId" style="width: 164px;"></select></td>
				</tr>
				<tr id="outstore_hidden_tr" >
					<td>出库时间:</td>
					<td><input type="text" id="outDate" name="outDate" /></td>
					<td>操作人员:</td>
					<td><input type="text" id="userId" name="userId" /></td>
				</tr>
				<tr>
					<td valign="top" style="padding-top: 2px;">备注信息:</td>
					<td colspan="3"><textarea rows="4" id="note" name="note" style="width: 398px;"></textarea></td>
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
