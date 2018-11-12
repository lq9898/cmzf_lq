<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<script>
    $(function () {
        $("#motityBannerForm").form('load','${pageContext.request.contextPath}/Banner/findById?id=${param.id}');
    })
</script>
<form class="easyui-form" id="motityBannerForm" method="post" enctype="multipart/form-data">
    <input type="hidden" class="easyui-textbox" name="id" >
    <div style="text-align: center;margin-top: 50px">
        标题:<input type="text" class="easyui-textbox" name="title" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        路径:<input type="text"  class="easyui-filebox" name="img" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        详情:<input type="text" class="easyui-textbox" name="descs" >
    </div>
    <div style="text-align: center;margin-top: 10px">
        状态:<input type="text" class="easyui-textbox" name="status" >
    </div>

</form>

