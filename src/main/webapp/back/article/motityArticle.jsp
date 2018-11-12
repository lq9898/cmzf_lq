<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
</script>
<form class="easyui-form" id="motityArticleForm" enctype="multipart/form-data" method="post">
    <div style="text-align: center;margin-top: 50px">
        标题:<input type="text" class="easyui-textbox" name="title" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        路径:<input type="text" class="easyui-filebox" name="ipt" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        内容:<input type="text" class="easyui-textbox" name="content" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        所属上师:<select class="easyui-combobox" name="sex"  data-options="width:159">
        <option value="男">男</option>
        <option value="女">女</option>
    </div>
</form>

