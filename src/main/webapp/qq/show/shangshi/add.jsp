<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="ssaddform" class="easyui-form" method="post" enctype="multipart/form-data">
        <div>
           <input type="hidden" name="id" class="easyui-textbox" >
        </div>
        <div style="margin-top: 70px;">
            上师名字: <input type="text" name="name" class="easyui-textbox">
        </div>

        <div style="margin-top: 20px;">
           图片:  <input  name="filename" class="easyui-filebox">
        </div>

        <div style="margin-top: 20px;">
            性别: <input type="text" name="sex" class="easyui-textbox">
        </div>
    </form>
</div>
