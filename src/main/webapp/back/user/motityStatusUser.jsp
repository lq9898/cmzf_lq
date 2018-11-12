<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="text-align: center">
    <form  id="motityStatusUserForm"   METHOD="post">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top:10px">
            状态：<select name="status" class="easyui-combobox">
                <option value="F">删除</option>
                <option value="X">冻结</option>
                <option value="Y">解结</option>
            </select>
        </div>
    </form>
</div>