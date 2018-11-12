<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
</script>
<form class="easyui-form" id="motityGuruForm" enctype="multipart/form-data" method="post">
    <div style="text-align: center;margin-top: 50px">
        标题:<input type="text" class="easyui-textbox" name="name" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        头像:<input type="text" class="easyui-filebox" name="pic" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        性别: <select class="easyui-combobox" name="sex"  data-options="width:159">
        <option value="男">男</option>
        <option value="女">女</option>
    </select>
    </div>


</form>

