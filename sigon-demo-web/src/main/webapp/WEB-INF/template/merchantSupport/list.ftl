<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 class="page_title">MerchantSupport List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="pageNumSup" name="pageNumSup" value="${pageNumSup}">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="code" name="code" value="${merchantSupport.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Comments</label>
                <input type="text" id="comments" name="comments" value="${merchantSupport.comments}" >
            </p>

            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="-1" >All</option>
                [#list supportStatusEnum as item]
                    <option value="${item.index}" [#if item.index==merchantSupport.status]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Trader</label>
                <select id="trader" name="trader" >
                    <option value="All" >All</option>
                    <option value="Not specified" [#if merchantSupport.trader=="Not specified"]selected[/#if] >Not specified</option>
                [#list userList as item]
                    <option value="${item.userId}" [#if item.userId==merchantSupport.trader]selected[/#if]>${item.userId}</option>
                [/#list]
                </select>
                <input type="hidden" id="userId" value="${userId}">
            </p>
            <p class="f_2p">
                <label class="f_info">Department</label>
                <select id="department" style="width: 160px;">
                    <option value="" >All</option>
                [#list department as item]
                    <option value="${item.department}" id="${item.id}" [#if item.department==merchantSupport.department]selected[/#if]>${item.department}</option>
                [/#list]
                </select>
                <input id="departmentText" type="text" name="department"  style="width: 160px;" value="${merchantSupport.department}">
            </p>
            <p class="f_2p">
                <label class="f_info">Issue</label>
                <select id="issue"  style="width: 160px;" >
                    <option value="" >All</option>
                </select>
                <input id="issueText" type="text" name="issue"  style="width: 160px;" value="${merchantSupport.issue}">
            </p>
            <p class="f_2p">
                <label class="f_info">Create Date</label>
                [@inputRegion id="createDate" type="date"   start=merchantSupport.createDateStart end=merchantSupport.createDateEnd]
                    [#include "/include/inputregion.ftl"]
                [/@inputRegion]
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
        <table>
        [#list page.content as item]
            <tr>
                <td data-itemid="${item.id}">
                    <div class="cf">
                        <div class="form_detail"></div>
                        <div class="form_detail"></div>
                    </div>
                        <p class="form_detail_p">
                        <label>Department:</label>
                        <b>${item.department}</b>
                    </p>
                    <p class="form_detail_p">
                        <label>Issue:</label>
                        <b>${item.issue}</b>
                    </p>
                    <p class="form_detail_p">
                        <label>Trader:</label>
                        <b>[@showValue value=item.trader][/@showValue]</b>
                    </p>
                    <p class="form_detail_p">
                        <label>Comment:</label>
                        <b>
                        ${item.comments}&nbsp;&nbsp;&nbsp;&nbsp;By ${item.code} @ [@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.createDate][/@dateFormat]
                        </b>
                    </p>
                [#if item.status==1]
                    <p class="form_detail_p">
                        <label>Trader ${item.trader}</label>
                        <b>
                         wrote @ [@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.modifyDate][/@dateFormat]
                        </b>
                    </p>
                    [#if item.emailReply!=""]
                        <p class="form_detail_p">
                            <label>Email Reply:</label>
                            <b>${item.emailReply}</b>
                        </p>
                    [/#if]
                    [#if item.systemReply!=""]
                        <p class="form_detail_p">
                            <label>System Reply:</label>
                            <b>${item.systemReply}</b>
                        </p>
                    [/#if]
                [/#if]
                [#if item.status==2]
                    <p class="form_detail_p">
                        <label>Trader ${item.trader}</label>
                        <b> ignore @ [@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.modifyDate][/@dateFormat]</b>
                    </p>
                    <p class="form_detail_p">
                        <label>Ignore Reason:</label>
                        <b>${item.emailReply}</b>
                    </p>
                [/#if]
                </td>
                <td width="100px">
                    [#if item.status==0 && userId == item.trader]
                        <span class="btn_i item_menu">
                            o
                            <span data-itemid="${item.id}">
                                [@showMenu code="010101"]
                                        <a href="reply.action?id=${item.id}" class="edit reply" title="Reply Support" data-icon="e">Reply</a>
                                [/@showMenu]
                                [@showMenu code="010102"]
                                        <a href="ignore.action?id=${item.id}" class="edit ignore" title="Ignore Support" data-icon="e">Ignore</a>
                                [/@showMenu]
                                [@showMenu code="010103"]
                                        <a href="change.action?id=${item.id}" class="edit changeLog" title="Transfer To Other Trader" data-icon="e">Transfer</a>
                                [/@showMenu]
                            </span>
                        </span>
                    [#elseif (item.status==0 && (departmentMap.get(item.departmentId).user==null||departmentMap.get(item.departmentId).user=="")) ||
                    (item.status==0 && departmentMap.get(item.departmentId).level==1 && item.level==2)]
                        <span class="btn_i item_menu">
                            o
                            <span data-itemid="${item.id}">
                                [@showMenu code="010103"]
                                    <a href="change.action?id=${item.id}" class="edit changeLog" title="Change Trader" data-icon="e">Change&Log</a>
                                [/@showMenu]
                            </span>
                        </span>
                    [/#if]
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
    seajs.use(["alert","validation"], function (alertM) {
        $("#reset").on("click",function(){
            $("#trader").val("All");
            $("#status").val("0");
            $("#trader").val($("#userId").val());
            $("#issue").html('<option value="" >All</option>');
        })
        $("#searchForm").click(function () {
            $("#pageNumber").val("1");
        });
        $(".reply,.ignore,.changeLog").on("click",function(){
            alertM(this.href,{
                title:$(this).attr("title"),
                time:"y",
                width:760,
                iframe:1
            })
            return false;
        });
        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
        $("#issue").on("change",function(){
            $("#issueText").val($(this).val());
        })
        $("#department").on("change",function(){
            if($(this).val()!=""){
                $("#departmentText").val($(this).val());
            }
            var obj=document.getElementById("department");
            var id = obj.options[obj.selectedIndex].getAttribute("id");
            if(id !=null){
                $.ajax({
                    url:"findIssue.action",
                    dataType:"json",
                    data:{
                        id:id
                    },
                    type:"post"
                }).done(function(data){
                    var html = '<option value="" >All</option>';
                    $.each(data.data,function(i,n){
                        if($("#issueText").val()== n.issue){
                            html += '<option value="'+ n.issue+'"  selected >'+n.issue+'</option>';
                        }else{
                            html += '<option value="'+ n.issue+'"  >'+n.issue+'</option>';
                        }
                    })
                    $("#issue").html(html);
                })
            }
        })
        $("#department").trigger("change");
        $(function(){
            var pageNumSup= $("#pageNumSup").val();
            window.parent.refreshIframe2(pageNumSup);
        })
        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        };
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
