<%@page isELIgnored="false" pageEncoding="UTF-8" %>

<script>
    $(function(){
        $("#act").edatagrid({
            height:300,
            url:'${pageContext.request.contextPath}/banner/findByPage',//请求
            fitColumns:false,//列自适应  设为false  不自适应
            toolbar:'#tool',//工具栏
            fit:true,
            striped:true,//斑马线
            pagination:true,//有分页
            pageSize:3,//默认一页展示2条数据
            pageList:[2,3,5,10],//默认下啦列
            onLoadSuccess:function(){//数据加载完成后渲染删除修改
                $(".del").linkbutton();
                $(".upd").linkbutton();
            },
            loadMsg:'加载着呢,悄悄的等会,别吵吵!!!!!!!!!!!!!!!!',
            remoteSort:true,//不根据服务器所得结果排序
            singleSelect:true,
            columns: [
                [
                    //{field:'id',title:'Id',width:150,fixed:true,align:'center',halign:'center',sortable:true,editor:'text'},
                    //{field:'title',title:'title',width:150,fixed:true,editor:'text',},
                    {field:'lujing',title:'lujing',width:100,editor:'text',},
                    {field:'descs',title:'descs',width:150,fixed:true,editor:'text',},
                    {field:'status',title:'status',width:150,fixed:true,editor:'text',},
                    {field:'times',title:'times',width:150,fixed:true,editor:{type:'datebox',options:{required:true} }},
                    {field:'edit',title:'edit',formatter:function(value,row,index){
                            return "<a class='del' href='javascript:;' onclick=\"delRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;"/*+
                                "<a class='upd' href='javascript:;' onclick=\"updateRow('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">修改</a>"*/
                        },width:200,fixed:true,}
                ],],
            //可编辑的操作
            updateUrl:'${pageContext.request.contextPath}/banner/update',
            //鼠标点击空白区域自动保存
            autoSave:false,
            onSave:function(){
                $("#act").edatagrid('load');
            },
            destroyMsg:{
                norecord:{    // 在没有记录选择的时候执行
                    title:'Warning',
                    msg:'No record is selected.'
                },
                confirm:{       // 在选择一行的时候执行		title:'Confirm',
                    msg:'Are you sure you want to delete?'
                }
            },

            //可展示图片
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="' + rowData.lujing + '" style="height:150px;"></td>' +
                    '<td style="border:0">' +
                    '<p>title: ' + rowData.title + '</p>' +
                    '<p>createDate: ' + rowData.times + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });
        $("#act").edatagrid('disableEditing');

    })
    //启用页面编辑模式
    function motifyBanner(){
        $.messager.show({title:'提示',msg:'进入编辑模式'})
        $("#act").edatagrid('enableEditing');
    }
    function leaveMotifyBanner(){
        $("#act").edatagrid('load');
        $("#act").edatagrid('disableEditing');
    }
    //删除单行数据
    function delRow(id) {
        //发送异步请求把id传过去
        $.post("${pageContext.request.contextPath}/banner/delete",{"id":id},function (result) {
            $.messager.show({title:'消息提示',msg:'删除成功'});
            $("#act").datagrid();//删除之后再次刷新
        })
    }

    //获取uuid
    function guid() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
    };
    //获取当前时间
    function CurentTime()
    {
        var now = new Date();
        var year = now.getFullYear();       //年
        var month = now.getMonth() + 1;     //月
        var day = now.getDate();            //日
        var hh = now.getHours();            //时
        var mm = now.getMinutes();          //分
        var ss = now.getSeconds();           //秒
        var clock = year + "-";
        if(month < 10)
            clock += "0";
        clock += month + "-";
        if(day < 10)
            clock += "0";
        clock += day + " ";
        return(clock);
    }
    //添加banner
    function saveBanner(){
        $("#act").edatagrid('enableEditing');
        $("#act").edatagrid('addRow',{

                row:{
                    id:guid(),
                    createDate:CurentTime(),
                },
            }
        );
    };
    //保存编辑
    $("#act").edatagrid({onSave:function(index,row){
            $.ajax({
                type:'POST',
                saveUrl:'${pageContext.request.contextPath}/banner/save',
                data:row,
            });
            $("#act").edatagrid('load');
        }});
</script>
<form action="" id="act"></form>
<div id="tool">
    <a href="javascript:;" onclick="saveBanner()" id="save" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
    <a href="javascript:;" onclick="motifyBanner()" id="motify" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:;" onclick="leaveMotifyBanner()" id="leaveMotify" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">退出编辑</a>
</div>
<div id="talkbox"></div>
<div id="talkbox2"></div>
<div id="savebox"></div>
