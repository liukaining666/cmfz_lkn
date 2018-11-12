<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="addform" class="easyui-form" method="post" enctype="multipart/form-data">
        <div>
           <input type="hidden" name="id" class="easyui-textbox" >
        </div>
        <div style="margin-top: 70px;">
            标题: <input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            状态: <input type="text" name="status" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
           图片:  <input  name="filename" class="easyui-filebox" data-options="buttonAlign:'right'            ">
        </div>

        <div style="margin-top: 20px;">
            时间: <input type="text" name="times" class="easyui-datebox">
        </div>
    </form>
</div>
