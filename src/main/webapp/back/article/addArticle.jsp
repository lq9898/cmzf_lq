<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
    $(function () {
        $("#se").combobox({
            url:'${pageContext.request.contextPath}/Guru/findAllName',
            valueField:'id',
            textField:'name',
            method:'post',
            formatter:function (ROW) {
                return ROW.name;
            },
        })
    })
</script>
<form class="easyui-form" id="addArticleForm" enctype="multipart/form-data" method="post">
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
        所属上师:<input class="easyui-combobox"  data-options="width:159" id="se" name="guru_id">
    </div>
</form>

