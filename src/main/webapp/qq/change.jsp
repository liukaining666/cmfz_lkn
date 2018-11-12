<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>

<script>
	$(function () {
		//alert(${param.password});
    })
</script>
<form id="update_form" class="easyui-form" method="post">
	<div style="text-align: center;margin-top: 50px">
		<input type="hidden" name="id" value="${param.id}" class="easyui-textbox" >
	</div>
	<div style="text-align: center;margin-top: 20px">
		旧&nbsp;密&nbsp;码:<input type="text" id="pwd1" class="easyui-passwordbox" >
	</div>
	<div style="text-align: center;margin-top: 20px">
		新&nbsp;密&nbsp;码:<input type="text" id="pwd2" class="easyui-passwordbox">
	</div>
	<div style="text-align: center;margin-top: 20px">
		确认新密码:<input type="text" name="password" id="pwd3" class="easyui-passwordbox">
	</div>


</form>
