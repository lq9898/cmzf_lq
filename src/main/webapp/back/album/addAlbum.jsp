<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form action="" id="addAlbumForm" enctype="multipart/form-data"  METHOD="post">
        <div style="margin-top: 50px">
            名称:<input type="text" class="easyui-textbox" name="title">
        </div>

        <div style="margin-top:10px">
            评论:<input type="text" class="easyui-textbox" name="star">
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
            封面:<input type="text" class="easyui-filebox" name="albumImg">
        </div>
    </form>
</div>