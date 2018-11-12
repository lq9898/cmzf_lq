<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
</script>
<form class="easyui-form" id="addCourseForm" enctype="multipart/form-data" method="post">
    <div style="text-align: center;margin-top: 50px">
        标题:<input type="text" class="easyui-textbox" name="title" >
    </div>
    <div style="text-align: center;margin-top: 10px">
      <%--  状态:<select type="text" class="easyui-combobox" name="flag" data-options="width:159,height:30">
            <option value="X">选修</option>
            <option value="Y">必修</option>
        </select>--%>
          <input type="hidden" class="easyui-textbox" name="flag"  value="Y">
    </div>

</form>

