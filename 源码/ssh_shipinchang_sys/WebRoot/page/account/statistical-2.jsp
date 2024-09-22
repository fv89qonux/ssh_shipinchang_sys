<%@ page language="java" pageEncoding="UTF-8"%>
<div style="padding-top: 3px;">
	<div>
		<table id="monthInTable" border="0" width="49%" style="text-align: center; background-color: #287EC7;color: #113965; float: left;" cellpadding="1" cellspacing="2"></table>
		<table id="monthOutTable" border="0" width="49%" style="text-align: center; background-color: #287EC7;color: #113965;float: right;" cellpadding="1" cellspacing="2"></table>
	
		<div style="width: 100%;float: left;height: 10px;"></div>
		<table border="0" width="100%" style="text-align: center; background-color: #287EC7;color: #113965; float: left;" cellpadding="1" cellspacing="2">
			<tr style="font-size: 20px;font-weight: bold; background-color: #DCF1FC;">
				<td colspan="5">本月盘点</td>
			</tr>
			<tr style="font-size: 16px;font-weight: bold; background-color: #F2F2F2;">
				<td rowspan="2">入库</td>
				<td>入库(次)</td>
				<td>支出(元)</td>
			</tr>
			<tr style="font-size: 14px;font-weight: bold; background-color: #FFF;color: green;">
				<td id="tdInTimes2">0</td>
				<td id="tdInPay2">0</td>
			</tr>
			<tr style="font-size: 16px;font-weight: bold; background-color: #F2F2F2;">
				<td rowspan="2">出库</td>
				<td>出库(次)</td>
				<td>收入(元)</td>
			</tr>
			<tr style="font-size: 14px;font-weight: bold; background-color: #FFF;color: red;">
				<td id="tdOutTimes2">0</td>
				<td id="tdOutPay2">0</td>
			</tr>
			<tr style="font-size: 16px;font-weight: bold; background-color: #FFF;color: blue;">
				<td colspan="2">本月盈亏(元)</td>
				<td id="tdPay2">0</td>
			</tr>
		</table>
	</div>
</div>