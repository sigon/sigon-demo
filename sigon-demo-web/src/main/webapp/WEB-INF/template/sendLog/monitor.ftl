[#assign title="SMS Log"]
[#assign header="setting"]
[#assign nav="sendLogList"]
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
<h2 class="page_title">${title}</h2>
<form id="listForm" action="monitor.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form cf">
            <p class="f_1p">
                <label class="f_info">Priority：</label>
                <select id="priority" name="priority">
                    <option value="">ALL</option>
                    <option value="${MIN_PRIORITY}" [#if sendLog.priority==MIN_PRIORITY]selected[/#if]>MIN_PRIORITY</option>
                    <option value="${NORM_PRIORITY}" [#if sendLog.priority==NORM_PRIORITY]selected[/#if]>NORM_PRIORITY</option>
                    <option value="${MAX_PRIORITY}" [#if sendLog.priority==MAX_PRIORITY]selected[/#if]>MAX_PRIORITY</option>
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Type：</label>
                <select id="type" name="Type">
                    <option value="">ALL</option>
                    <option value="email"[#if sendLog.type=="email"]selected[/#if]>email</option>
                    <option value="sms"[#if sendLog.type=="sms"]selected[/#if]>sms</option>
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Country</label>
                <select id="country" name="country">
                    <option value="">ALL</option>
                    <option value="China"[#if sendLog.country=="China"]selected[/#if]>China</option>
                    <option value="NewZealand"[#if sendLog.country=="NewZealand"]selected[/#if]>NewZealand</option>
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">SendTo</label>
                <input type="text" id="sendTo" name="sendTo" value="${sendLog.sendTo}">
            </p>
            <p class="f_2p">
                <label class="f_info">Send Count：</label>
                <input type="number" step="1" min="0" id="sendCountStart" name="sendCountStart" value="${sendLog.sendCountStart}" class="f_short">
                <label>-&nbsp;&nbsp;&nbsp;</label>
                <input type="number" step="1" min="1"id="sendCountEnd" name="sendCountEnd" value="${sendLog.sendCountEnd}" class="f_short">
            </p>
            <p class="f_1p">
                <label class="f_info">ErrorStatus：</label>
                <select id="errorStatus" name="errorStatus">
                    <option value="">ALL</option>
                    <option value="0"[#if sendLog.errorStatus==0]selected[/#if]>No Error</option>
                    <option value="-1"[#if sendLog.errorStatus==-1]selected[/#if]>Invalid Addresses/Mobile</option>
                    <option value="1"[#if sendLog.errorStatus==1]selected[/#if]>Has Error</option>
                    <option value="-100"[#if sendLog.errorStatus==-100]selected[/#if]>Ignore</option>
                </select>
            </p>
            <p class="f_2p">
                <label class="f_info">Create Date(<=${searchMaxDays}days)</label>
                [@inputRegion id="createDate" type="date" start=sendLog.createDateStart end=sendLog.createDateEnd]
                    [#include "/include/inputregion.ftl"]
                [/@inputRegion]
                <input type="hidden" id="today" value="">
            </p>
            <p class="f_1p">
                <label class="f_info">&nbsp;</label>
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <button type="button" id="reset" class="btn">Reset</button>
            </p>
        </div>
    </menu>
    <div class="table">
        <div>&nbsp;&nbsp;<b>Total Records ${list?size}</b></div>
        <table>
            <tr>
                <th>No</th>
                <th>Priority</th>
                <th>Type/Country</th>
                <th>SendTo</th>
                <th>Subject/Content</th>
                <th>SendStatus</th>
                <th>SendCount</th>
                [#--<th>ErrorMsg</th>--]
                <th>ErrorStatus</th>
                <th>CreateDate</th>
                <th>ModifyDate</th>
                <th>Setting</th>
            </tr>

        [#list list as item]
            <tr>
                <td>${item_index+1}</td>
                <td>
                    [#if item.priority==MIN_PRIORITY]
                        MIN_PRIORITY
                    [#elseif item.priority==NORM_PRIORITY]
                        NORM_PRIORITY
                    [#elseif item.priority==MAX_PRIORITY]
                        MAX_PRIORITY
                    [#else]
                        ${item.priority}
                    [/#if]
                </td>
                <td>
                    ${item.type}&nbsp;${item.country}
                </td>
                <td>${item.sendTo}</td>
                <td>
                    [#if item.type="sms"]
                        ${item.content}
                    [#elseif item.type="email"]
                        <a href="${base}/sendLog/viewOnline.action?onlineId=${item.onlineId}" target="r_body">${item.subject}</a>
                    [#else]
                        ${item.content}
                    [/#if]
                </td>
                <td>
                    [#if item.sendStatus==0]
                        未发送
                    [#elseif item.sendStatus==1]
                        已发送
                    [#elseif item.sendStatus==-1]
                        不发送
                    [#else]
                        Unknow
                    [/#if]
                </td>
                <td>${item.sendCount}</td>
                [#--<td>${item.errorMsg}</td>--]
                <td>
                    [#if item.errorStatus==0]
                        [#assign errorStatusDesc="No Error"]
                    [#elseif item.errorStatus==-1]
                        [#if item.type=="sms"]
                            [#assign errorStatusDesc="Invalid"]
                        [#elseif item.type=="email"]
                            [#assign errorStatusDesc="Invalid Addresses"]
                        [#else]
                            [#assign errorStatusDesc="Invalid"]
                        [/#if]
                    [#elseif item.errorStatus==-2]
                        [#assign errorStatusDesc="Email address format error"]
                    [#elseif item.errorStatus==-100]
                        [#assign errorStatusDesc="Ignore"]
                    [#elseif item.errorStatus==-200]
                        [#assign errorStatusDesc="已发送至新西兰短信平台缓存，不再发送"]  <!--sms has be sent to Newzealand sms platform cache-->
                    [#elseif item.errorStatus==1]
                        [#assign errorStatusDesc="Has Error"]
                    [#else]
                        [#if item.errorStatus??]
                            [#assign errorStatusDesc=item.errorStatus?string]
                        [#else]
                            [#assign errorStatusDesc=""]
                        [/#if]
                    [/#if]

                    [#if item.errorStatus==0]
                        ${errorStatusDesc}
                    [#else]
                        <a href="${base}/sendLog/viewErrorMsg.action?id=${item.id}" target="r_body">${errorStatusDesc}</a>
                    [/#if]
                </td>
                <td>[@dateFormat value=item.createDate format="yyyy-MM-dd HH:mm:ss SSS"][/@dateFormat]</td>
                <td>[@dateFormat value=item.modifyDate format="yyyy-MM-dd HH:mm:ss SSS"][/@dateFormat]</td>
                <td>
                    [#if item.errorStatus==1]
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                            [#--[@showMenu url="/sendLog/ignore.action"]--]
                                <a href="javascript:void(0);" class="chg_stu" data-icon="d">Ignore</a>
                            [#--[/@showMenu]--]
                            [#--<a href="javascript:" title="Has no firstForeignExchange!" class="chg_stu disabled" data-icon="e">ProcessVoucher</a>--]
                        </span>
                    </span>
                    [#else]
                        &nbsp;
                    [/#if]
                </td>
            </tr>
        [/#list]
        </table>
    [#--[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]--]
        [#--[#include "/include/pagination.ftl"]--]
    [#--[/@pagination]--]
    </div>
</form>
<script>
    seajs.use("alert",function(alertM){
        $("#reset").click(function(){
            var today= $("#today").val();
            $("#createDateStart").val(today);
            $("#createDateEnd").val(today);
            $("#createDateRegion").val(today);
            $("#priority").val("");
            $("#type").val("");
            $("#country").val("");
            $("#sendCountStart").val("");
            $("#sendCountEnd").val("");
            $("#errorStatus").val("");
            $("#sendTo").val("");
        });

        $("table").on("click",".chg_stu",function(){
            var $t=$(this);
            var id=$t.parent().data("itemid") ;
            alertM("Are you sure ignore this sms/email and never send again?",{
                time:"y",
                title:"Ignore",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_blue",
                        func:function(){
                            alertM("Loading",{cls:"loading",time:"y"})
                            $.ajax({
                                url:"ignore.action",
                                dataType:"json",
                                data:{
                                    id:id
                                }
                            }).done(function(data){
                                        alertM(data.msg,{cls:data.status,rf:function(){
                                            if(data.status=="succ")
                                                window.location.reload(true);
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
    })
</script>
</body>
</html>