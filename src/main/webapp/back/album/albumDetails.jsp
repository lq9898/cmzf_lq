<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#albumDetailsForm").form('load','${pageContext.request.contextPath}/Album/findById?id=${param.id}');
    })

</script>
<div style="text-align: center">
    <form action="" id="albumDetailsForm" enctype="multipart/form-data"  METHOD="post">

        <img style="width:100px;height:60px;text-align: center;margin-top: 10px;" src="${pageContext.request.contextPath}/${param.img}">
        <div style="margin-top: 50px">
            标题:<input type="text" class="easyui-textbox" name="title" data-options="labelWidth:100">
        </div>
        <div style="margin-top:10px">
            数量:<input type="text" class="easyui-textbox" name="count">
        </div>
        <div style="margin-top:10px">
            星级:<input type="text" class="easyui-textbox" name="star">
        </div>
        <div style="margin-top:10px">
            作者:<input type="text" class="easyui-textbox" name="author">
        </div>
        <div style="margin-top:10px">
            播音:<input type="text" class="easyui-textbox" name="broadCast">
        </div>
        <div style="margin-top:10px">
            简介:<input type="text" class="easyui-textbox" name="brief">
        </div>
        <div style="margin-top:10px">
            日期:<input type="text" class="easyui-datebox" name="publishDate">
        </div>
    </form>
</div>