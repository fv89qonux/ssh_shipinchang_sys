$(function() {
	var loginState = $("#loginState").val();
	if (loginState != null && loginState !== "nologin" && loginState !== "null") {
		$("#login_status").html(loginState);
	} else {
		$("#login_status").html("欢迎登录!");
	}
});

function changevcode() {
	var img = document.getElementById("img_vcode");
	img.src = "image.jsp?flag=" + Math.random();
}

function validateLogin() {
	var u_regExp = /^[a-zA-Z0-9_]{1,19}$/;// 验证用户名格式正则
	var p_regExp = /^[a-zA-Z0-9_]{1,20}$/;// 验证密码格式正则
	var v_regExp = /^[0-9]{4}$/;// 验证码格式
	if (!u_regExp.test($("#username").val())) {
		$("#login_status").html("账号格式不对，要求4-19位只能有数字字母下划线构成!");
		$("#username").focus();
		return false;
	} else if (!p_regExp.test($("#password").val())) {
		$("#login_status").html("密码格式不对，要求4-19位只能有数字字母下划线构成!!");
		$("#username").focus();
		return false;
	} else if (!v_regExp.test($("#vcode").val())) {
		$("#login_status").html("验证码错误!");
		$("#vcode").val("").focus();
		return false;
	}
	$("#logining").show();
	return true;
}

$(function() {
	$("#test").click(function() {
		$("#logining").hide();
		// alert("123");
	});
});