<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="addzjform" class="easyui-form" method="post" enctype="multipart/form-data">
        <div>
            <input type="hidden" name="id" class="easyui-textbox" >
        </div>
        <div style="margin-top: 70px;">
            标题: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            作者: <input type="text" name="author" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
           封面:  <input  name="filename" class="easyui-filebox">
        </div>
        <div style="margin-top: 20px;">
            时间: <input type="text" name="publishDate" class="easyui-datebox">
        </div>
    </form>
</div>
