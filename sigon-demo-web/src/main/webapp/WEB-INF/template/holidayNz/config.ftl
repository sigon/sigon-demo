[#assign title="Holiday(NZ) List"]
[#assign header="setting"]
[#assign nav="holidayNzList"]
[#assign listWeeksJsonData=weeksInMonth?eval]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js/datepicker/wdatepicker.js" type="text/javascript"></script>
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
        <h2 class="page_title">Config Holiday(NZ)</h2>
        <form id="configForm" action="config.action" method="post">

            <menu>

                <div class="form cf">
                    <p class="f_2p">
                        <label class="f_info">Year/Month</label>
                        <select id="year" name="year" style="width:80px">
                        [#list listYears as item]
                            <option value="${item.year}" [#if item.year==holidayNz.year] selected="selected" [/#if]>${item.year}</option>
                        [/#list]
                        </select>
                        <select id="month" name="month" style="width:80px">
                        [#list listMonths as item]
                            <option value="${item.month}" [#if item.month==holidayNz.month] selected="selected" [/#if]>${item.month}</option>
                        [/#list]
                        </select>
                    </p>
                    <p class="f_1p">
                        [#--[@showMenu url="/holidayNz/configYear.action"]--]
                        <label class="f_info">&nbsp;</label>
                        <button type="button" id="btnConfigYear" class="btn bg_blue">Initialize the years</button>
                        [#--[/@showMenu]--]
                    </p>
                </div>

            </menu>

            <div class="table">
                <a href="/holidayNz/list.action?queryint=0" class="btn bg_blue">Holiday(NZ) List</a>
                <hr>
                <table>
                    <tr>
                        [#list weekKeys as weekKeys]
                        <th width="14%" style="text-align: center">${weekKeys}</th>
                        [/#list]
                    </tr>
                    [#list listWeeksJsonData as item]
                        <tr>
                            [#list weekKeys as weekKey]
                                <td id="td_${item[weekKey].cellId}" style="text-align: center">
                                    <div style="margin:0 auto; height:50px">
                                        <span id="spanDay_${item[weekKey].cellId}" style="color:${item[weekKey].color}">
                                            ${item[weekKey].day}
                                        </span>
                                        <br/>
                                        <span id="spanLabel_${item[weekKey].cellId}" style="color:${item[weekKey].color}"> ${item[weekKey].remark}</span>
                                        <span id="spanInput_${item[weekKey].cellId}" style="display: none">
                                            <input class="txt_remark" type="text" id="remark_${item[weekKey].cellId}" value="${item[weekKey].remark}" style="width:96%"/>
                                        </span>
                                        <input type="hidden" id="day_${item[weekKey].cellId}" value="${item[weekKey].day}"/>
                                        <input type="hidden" id="id_${item[weekKey].cellId}" value="${item[weekKey].id}"/>
                                        <input type="hidden" id="holiday_${item[weekKey].cellId}" value="${item[weekKey].holiday}"/>
                                        <input type="hidden" id="oldRemark_${item[weekKey].cellId}" value="${item[weekKey].remark}"/>
                                    </div>
                                </td>
                            [/#list]
                        </tr>
                    [/#list]
                </table>
            </div>
        </form>
<script>
    seajs.use("alert",function(alertM){
        $("#btnConfigYear").click(function(){
            $.ajax({
                url:"configYear.action",
                dataType:"json",
                method:"post",
                data:$("#configForm").serialize()
            }).done(function(data){
                   alertM(data.msg,{cls:data.status,rf:function(){
                        if(data.status=="succ"){
                            var year=$("#year").val();
                            var month=$("#month").val();
                            window.location.href="config.action?year="+year+"&month="+month;
                        }
                    }})
                })
        });

        $('#year').change(function(){
            var year=$(this).children('option:selected').val();//这就是selected的值
            var month=$("#month").val();
            window.location.href="config.action?year="+year+"&month="+month;
        })
        $('#month').change(function(){
            var year=$("#year").val();
            var month=$(this).children('option:selected').val();//这就是selected的值
            window.location.href="config.action?year="+year+"&month="+month;
        })
        $("td").click(function(){
            var td_id=$(this).attr("id");
            var cellId=td_id.split("_")[1];
            var day=$("#day_"+cellId).val();
            if($.trim(day)!=""){
                $("#spanLabel_"+cellId).hide();
                $("#spanInput_"+cellId).show();
            }
        })

        $("td").mouseleave(function(){
            var td_id=$(this).attr("id");
            var cellId=td_id.split("_")[1];
            $("#spanLabel_"+cellId).show();
            $("#spanInput_"+cellId).hide();
        })

        $(".txt_remark").blur(function(){
            var remark_id=$(this).attr("id");
            var cellId=remark_id.split("_")[1];
            var id = $("#id_"+cellId).val();
            var holiday = $("#holiday_"+cellId).val();
            var remark= $(this).val();
            var oldRemark = $("#oldRemark_"+cellId).val();

            $("#spanLabel_"+cellId).html(remark);
            $("#spanLabel_"+cellId).show();
            $("#spanInput_"+cellId).hide();
            remark = $.trim(remark);
            if(id==""&&remark==""){
                return;
            }
            if(remark==$.trim(oldRemark)){
                return;
            }
            if(id!=""&&remark==""){
                $("#spanDay_"+cellId).css("color","black");
                $("#spanLabel_"+cellId).css("color","black");
            }else{
                $("#spanDay_"+cellId).css("color","red");
                $("#spanLabel_"+cellId).css("color","red");
            }

            $.ajax({
                url:"configDay.action",
                dataType:"json",
                method:"post",
                data:{"id":id,"holiday":holiday,"remark":remark}
            }).done(function(data){
                        alertM(data.msg,{cls:data.status,rf:function(){
                            var year=$("#year").val();
                            var month=$("#month").val();
                            window.location.href="config.action?year="+year+"&month="+month;
                        }})
                    })
        }) ;

        $(".txt_remark").keydown(function(event){
            var key_code = event.keyCode;
            if (key_code==13)
            {
                this.blur();
            }
        });
    })
</script>
<script>
    seajs.use("alert",function(alertM){
        var $g1=$("#group_1").on("change",function(){
            $.ajax({
                url:"findThridEC.action",
                type:"post",
                dataType:'json',
                data:{
                    secondEC:$g1.val(),
                    third:$g2.val()
                }
            }).done(function(data) {
                        $g2.html("");
                        if(data.status=="succ"){
                            var html='<option value="">Select...</option>';
                            for (var i = data.option.length - 1; i >= 0; i--) {
                                html+='<option value="'+data.option[i].val+'">'+data.option[i].txt+'</option>'
                            }
                            if(html)
                                $g2.html(html).show();
                        }
                    });
        }),$g2=$("#group_2").trigger("change");
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>