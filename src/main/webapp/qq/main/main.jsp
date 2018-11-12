<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/qq/themes/black/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/qq/themes/IconExtension.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/qq/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/qq/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/qq/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/qq/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/qq/js/datagrid-detailview.js"></script>

<script type="text/javascript">
    var login="${sessionScope.admin}";
    if(login==""){
        window.location.href="${pageContext.request.contextPath}/qq/login.jsp";
    }
    $(function () {
        //页面加载完成之后显示菜单数据
        $.post("http://localhost:8989/cmfz_lkn/menu/queryAll",function (menu) {
            //通过accordion的添加方法追加菜单
            console.log(menu);
            //遍历一级菜单
            $.each(menu,function (index,m) {
                //遍历二级菜单
                var content = "<div style='text-align: center;'>";
                $.each(m.menus,function(idx,child){
                    content += "<a onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%;margin:10px 0px; border: 2px #00ee00 solid;' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.name+"</a><br>";
                });
                content += "</div>"
                //添加菜单
                $("#menu").accordion('add',{
                    title:m.name,
                    iconCls:m.iconCls,
                    content:content,
                })
            });
        });
    });

    //点击菜单追加选项卡
    function addTabs(title,iconCls,href){
        //添加以前先判断tabs中是否存在这个选项卡
        if(!$("#tabs").tabs('exists',title)){
            $("#tabs").tabs('add',{
                title:title,
                iconCls:iconCls,
                closable:true,
                fit:true,
                href:"${pageContext.request.contextPath}/"+href,
            });
        }else{
            $("#tabs").tabs('select',title);
        }
    }
    function upde(id) {
        $("#upbox").dialog({
            href:'${pageContext.request.contextPath}/qq/change.jsp?id=${sessionScope.admin.id}&password=${sessionScope.admin.password}',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:function () {
                    var psd0='${sessionScope.admin.password}';
                    console.log(psd0);
                    var psd1=$("#pwd1").val();
                    console.log(psd1);
                    var psd2=$("#pwd2").val();
                    var psd3=$("#pwd3").val();
                    if(psd0!=psd1){
                        $.messager.show({title:'提示',msg:'和原密码不一致'});
                    }else if(psd2!=psd3){
                        $.messager.show({title:'提示',msg:'两次密码不一致'});
                    }   //提交信息
                     else{
                        $("#update_form").form('submit',{
                            //发送请求
                            url:'${pageContext.request.contextPath}/admin/update',
                            success:function (result) {//响应的一定是json格式字符串   使用应该先转为js对象
                                $("#upbox").dialog('close');
                                //刷新datagrid(信息)
                                $("#tb").datagrid('reload');
                                /*$.messager.show({title:'消息提示',msg:'修改成功'});*/
                                window.location.href="${pageContext.request.contextPath}/admin/quit";
                            },
                        })
                    }
                    }
                },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function () {
                    $("#upbox").dialog('close');
                }
            },]
        });
    }
</script>

</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.admin.username} &nbsp;<a href="javascript:" class="easyui-linkbutton" onclick="upde()" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/quit" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
    </div>   
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>

    <div data-options="region:'west',title:'系统菜单',split:false" style="width:200px;">
        <div id="menu" class="easyui-accordion" data-options="fit:true"></div>
    </div>

    <div data-options="region:'center'">
    	<div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>  
    </div>
    <%--更新用户对话框--%>
    <div id="upbox" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'"></div>
</body> 
</html>