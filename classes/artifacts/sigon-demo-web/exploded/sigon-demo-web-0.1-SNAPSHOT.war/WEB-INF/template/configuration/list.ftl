[#assign title="Configuration List"]
[#assign header="setting"]
[#assign nav="configurationList"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
    [#if msg??]
    <script>
        seajs.use("alert",function(alertM){
            alertM("${msg}");
        });
    </script>
    [/#if]
</head>
<body>
[#include "/include/header.ftl"]
[#include "/include/nav.ftl"]
        <h2 class="page_title">Configuration List</h2>
        <form id="listForm" action="list.action" method="post">
            <input type="hidden" id="queryint" name="queryint" value="1">
            <menu>
                <div class="form cf">
                        <p class="f_1p">
                            <label class="f_info">Key</label>
                            <input type="text" id="skey" name="skey" value="${configuration.skey}" placeholder="">
                        </p>
                    <p class="f_1p">
                        <label class="f_info">&nbsp;</label>
                        <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                        <button type="button" id="reset" class="btn">Reset</button>
                    </p>
                </div>

            </menu>
            <div class="table">
            [@showMenu code="990101"]
                <a href="/configuration/add.action" class="btn add bg_green" data-icon="a">Create New</a>
                <hr>
            [/@showMenu]
                <table>
                    <tr>
                        <th>Key[@pageOrder pageable=page.pageable property="skey"][/@pageOrder]</th>
                        <th>Value[@pageOrder pageable=page.pageable property="svalue"][/@pageOrder]</th>
                        <th>References</th>
                        <th>Settings</th>
                    </tr>

                [#list page.content as item]
                    <tr>
                            <td>${item.skey}</td>
                            <td>${item.svalue}</td>
                            [#if item.remark?length gt 50]
                                <td>
                                    <span class="b_tip">${item.remark}&nbsp;<span class="h_tip"></span>
                                </td>
                            [#else]
                                <td>${item.remark}</td>
                            [/#if]
                            <td>
                            <span class="btn_i item_menu">
                                o<span data-itemid="${item.skey}">
                                        [#if item.skey=merchantOperateKey]
                                            [@showMenu code="990102"]
                                            <a title="Please Click Config Merchant Operate Menu to Edit!" class="disabled" data-icon="d">Edit</a>
                                            [/@showMenu]
                                            [@showMenu code="990103"]
                                            <a title="Please Click Config Merchant Operate Menu to Delete!" class="disabled" data-icon="d">Delete</a>
                                            [/@showMenu]
                                        [#elseif item.skey=paymentTypeKey||item.skey=wTypeKey]
                                            [@showMenu code="990102"]
                                            <a title="Please Click Config Payment Type Menu to Edit!" class="disabled" data-icon="d">Edit</a>
                                            [/@showMenu]
                                            [@showMenu code="990103"]
                                            <a title="Please Click Config Payment Type Menu to Delete!" class="disabled" data-icon="d">Delete</a>
                                            [/@showMenu]
                                        [#else]
                                            [@showMenu code="990102"]
                                            <a href="/configuration/edit.action?skey=${item.skey}"  class="edit" data-icon="e">Edit</a>
                                            [/@showMenu]
                                            [@showMenu code="990103"]
                                            <a href="javascript:void(0);" class="chg_stu" data-icon="d">Delete</a>
                                            [/@showMenu]
                                        [/#if]
                                </span>
                            </span>
                        </td>
                    </tr>
                [/#list]
                </table>
            [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
                [#include "/include/pagination.ftl"]
            [/@pagination]
            </div>
        </form>
<script>
    seajs.use("alert",function(alertM){
        $("table").on("click",".chg_stu",function(){
            var $t=$(this);
            var skeyForDelete=$t.parent().data("itemid") ;
            alertM("Are you sure delete the configration [key="+skeyForDelete+"]?",{
                time:"y",
                title:"Delete Key",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_blue",
                        func:function(){
                            alertM("Loading",{cls:"loading",time:"y"})
                            $.ajax({
                                url:"delete.action",
                                dataType:"json",
                                data:{
                                    skey:skeyForDelete
                                }
                            }).done(function(data){
                                        alertM(data.msg,{cls:data.status,rf:function(){
                                            if(data.status=="succ")
                                                window.location.href="list.action";
                                        }})
                                    })
                            return false;
                        }
                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
        });
        $("#searchForm").click(function(){
            $("#pageNumber").val("1");
        });
        $("#reset").click(function(){
            $("#skey").val("");
        });
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>