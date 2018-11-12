<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="text-align: center">
    <form action="" id="addUserForm" enctype="multipart/form-data"  METHOD="post">
        <div style="margin-top: 50px">
            username:<input type="text" class="easyui-textbox" name="username">
        </div>
        <div style="margin-top:10px">
            phoneNum:<input type="text" class="easyui-textbox" name="phoneNum">
        </div>
        <div style="margin-top:10px">
            password:<input type="text" class="easyui-textbox" name="password">
        </div>
        <div style="margin-top:10px">
            headPic:<input type="text" class="easyui-filebox" name="userImg">
        </div>
        <div style="margin-top:10px">
            province:<input type="text" class="easyui-textbox" name="province">
        </div>
        <div style="margin-top:10px">
            city:<input type="text" class="easyui-textbox" name="city">
        </div>
        <div style="margin-top:10px">
            nickName:<input type="text" class="easyui-textbox" name="nickName">
        </div>
        <div style="margin-top:10px">
            sex:<select class="easyui-combobox" name="sex"  data-options="width:159">
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
        </div>
        <div style="margin-top:10px">
            sign:<input type="text" class="easyui-textbox" name="sign">
        </div>
        <div style="margin-top:10px">
            <input type="hidden" class="easyui-textbox" name="status" value="y">
        </div>
    </form>
</div>