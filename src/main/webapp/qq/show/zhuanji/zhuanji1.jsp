<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    $('#zj').treegrid({
        url:'${pageContext.request.contextPath}/album/findAll',
        idField:'id',
        treeField:'title',
        toolbar:'#zhuanji',//顶部添加工具
        fit:true,
        fitColumns:true,

        columns:[[
            {field:'title',title:'名字',width:60,},
            {field:'downPath',title:'下载路径',width:80},
            {field:'size',title:'章节大小',width:80},
            {field:'duration',title:'章节时长',width:80},
        ]]
    });
    function xiangqing(id) {
        /*查看信息*/
        var row = $('#zj').treegrid('getSelected');

        $("#xqssbox").dialog({
            href:'${pageContext.request.contextPath}/qq/show/zhuanji/show.jsp?id='+row.id,
            buttons:[{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#xqssbox").dialog('close');
                    console.log("关闭");
                }
            }]
        });
    }

    //添加专辑
    function addzj() {
        $("#addzjbox").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler: savezjForm
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#addzjbox").dialog('close');
                    console.log("关闭");
                }
            }]
        });
    }
    function savezjForm(){
        //保存用户信息
        // $("#addform").form('disableValidation');

        $("#addzjform").form('submit',{
            url:'${pageContext.request.contextPath}/album/add',
            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                var resultObj = $.parseJSON(result);
                console.log(result);
                if(resultObj.success){
                    //提示信息
                    $.messager.show({title:'提示',msg:"用户添加成功!!!"});

                }else{
                    //提示信息
                    $.messager.show({title:'提示',msg:resultObj.message});
                }
                //关闭对话框
                $("#addzjbox").dialog('close');
                //刷新datagrid
                $("#zj").treegrid('reload');
            }
        });
    }

    /*添加章节*/
    function addzj1() {
        var row = $('#zj').treegrid('getSelected');
        console.log(row);
        if(row==null){
            $.messager.show({title:'提示',msg:"请选择你要添加的专辑!!!"});
        }else{
            $("#addzj1box").dialog({
                href:'${pageContext.request.contextPath}/qq/show/zhuanji/addzhangjie.jsp?id='+row.id,
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler: savezj1Form
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#addzj1box").dialog('close');
                        console.log("关闭");
                    }
                }]
            });
        }
        }

    function savezj1Form(){
        //保存用户信息
        // $("#addform").form('disableValidation');

        $("#addzj1form").form('submit',{
            url:'${pageContext.request.contextPath}/chapter/add',
            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                var resultObj = $.parseJSON(result);
                if(resultObj.success){
                    //提示信息
                    $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                }else{
                    //提示信息
                    $.messager.show({title:'提示',msg:resultObj.message});
                }
                //关闭对话框
                $("#addzj1box").dialog('close');
                //刷新datagrid
                $("#zj").treegrid('reload');
            }
        });
    }
    function xiazaiyp() {
        var row = $('#zj').treegrid('getSelected');
        if(row==null){
            $.messager.show({title:'提示',msg:"什么都没选 !!!"});
        }else if(row.size==null){
            $.messager.show({title:'提示',msg:"选一个啊!!!"});
        }else{
            window.location='${pageContext.request.contextPath}/chapter/download?filename='+row.downPath+'&openstyle=inline';
        }
    }

</script>

<table id="zj" style="width:600px;height:400px"></table>
<div id="zhuanji">
    <a href="javascript:" id="xq" class="easyui-linkbutton" onclick="xiangqing()" data-options="iconCls:'icon-add',">专辑详情</a>
    <a href="javascript:" class="easyui-linkbutton" onclick="addzj()" data-options="iconCls:'icon-add',">添加专辑</a>
    <a href="javascript:" class="easyui-linkbutton" onclick="addzj1()" data-options="iconCls:'icon-add',">添加章节</a>
    <a href="javascript:" class="easyui-linkbutton" onclick="xiazaiyp()" data-options="iconCls:'icon-add',">下载音频</a>
</div>
<%--添加窗口--%>
<div id="addzjbox" data-options="href:'${pageContext.request.contextPath}/qq/show/zhuanji/addzj.jsp',width:600,height:500,title:'保存专辑信息',iconCls:'icon-save'"></div>
<div id="addzj1box" data-options="width:600,height:500,title:'保存专辑信息',iconCls:'icon-save'"></div>
<%--更新用户对话框--%>
<div id="xqssbox" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'详细信息'"></div>


