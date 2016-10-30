[#assign title="Holiday(NZ) List"]
[#assign header="setting"]
[#assign nav="holidayNzList"]
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
        <h2 class="page_title">Holiday(NZ) List</h2>
        <form id="listForm" action="list.action" method="post">
            <input type="hidden" id="queryint" name="queryint" value="1">
            <menu>
                <!--a href="config.action" class="btn add" data-icon="a">Holiday Config</a-->
                <div class="form cf">
                    <p class="f_1p">
                        <label class="f_info">Start Date</label>
                        <input type="text" id="startDate" name="startDate" onClick="WdatePicker()" class="Wdate" value="${holidayNz.startDate}"/>
                    </p>
                    <p class="f_1p">
                        <label class="f_info">End Date</label>
                        <input type="text" id="endDate" name="endDate" onClick="WdatePicker()" class="Wdate" value="${holidayNz.endDate}"/>
                    </p>
                    <p class="f_1p">
                        <label class="f_info">&nbsp;</label>
                        <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                        <button type="button" id="reset" class="btn">Reset</button>
                    </p>
                </div>
            </menu>
            <div class="table">
                <table>
                    <tr>
                        <th style="width:40%;text-align: center">Holiday[@pageOrder pageable=page.pageable property="holiday"][/@pageOrder]</th>
                        <th style="width:60%;text-align: left">Remark[@pageOrder pageable=page.pageable property="remark"][/@pageOrder]</th>
                        <!--th>Settings</th-->
                    </tr>

                [#list page.content as item]
                    <tr>
                        <td style="width:40%;text-align: center">[@dateFormat value=item.holiday][/@dateFormat]</td>
                        <td style="width:60%;text-align: left">${item.remark}</td>
                        <!--td>
                            <span class="btn_i item_menu">
                                o<span data-itemid="${item.id}" data-holiday="${item.holiday?date}">
                                        <a href="javascript:void(0);" class="chg_stu" data-icon="d">Delete</a>
                                </span>
                            </span>
                        </td-->
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
            var idForDelete=$t.parent().data("itemid") ;
            var holidayForDelete=$t.parent().data("holiday") ;
            alertM("Are you sure delete the holiday["+holidayForDelete+"]?",{
                time:"y",
                title:"Delete Holiday",
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
                                    id:idForDelete
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
            $("#startDate").val("");
            $("#endDate").val("");
        });
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>