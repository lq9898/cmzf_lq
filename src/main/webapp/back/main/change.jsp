<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
    $.extend($.fn.validatebox.defaults.rules, {
        confirmPwd: {
            validator: function(value,param){
                return value == $(param[0]).val();
            },
            message: '两次密码不一致'
        }
    });
</script>
<form class="easyui-form" id="openChangePwd">
	<input type="hidden" name="id" value="${sessionScope.Admin.id}">
	<div style="text-align: center;margin-top: 50px">
		旧密码:<input type="text" name="oldPwd"  class="easyui-passwordbox" >
	</div>
	<div style="text-align: center;margin-top: 50px">
		新密码:<input type="text" name="password"  class="easyui-passwordbox" id="pwd" data-options="required:true">
	</div>
	<div style="text-align: center;margin-top: 50px">
		确认密码:<input type="text" name="reqPwd" required="required" class="easyui-passwordbox" data-options="validType:'confirmPwd[\'#pwd\']'">
	</div>

</form>
