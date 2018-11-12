<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#cbx").combobox({
            url:'${pageContext.request.contextPath}/Album/findAllName',
            valueField:'id',
            textField:'title',
            method:'post',
            formatter:function (ROW) {
                console.log(ROW.id);
                return ROW.title;
            },
        })
    })
</script>
<div style="text-align: center">
    <form action="" id="addChapterForm" method="post" enctype="multipart/form-data">
        <div style="margin-top: 50px">
            章节名称:<input type="text" class="easyui-textbox" name="title">
        </div>

        <div style="margin-top: 10px">
            章节路径:<input type="text" class="easyui-filebox" name="chapterImg">
        </div>

        <div style="margin-top:10px">
            所属专辑:<input type="text" class="easyui-combobox" id="cbx" name="album_id">
        </div>
    </form>
</div>