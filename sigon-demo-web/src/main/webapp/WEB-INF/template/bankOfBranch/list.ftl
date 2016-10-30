<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Allocate Account To Branch</h2>
<form id="listForm" action="list.action"  method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Branch</label>
                <select id="branchId" name="branchId" >
                    <option value="" >All</option>
                    [#list branchList as item]
                        <option value="${item.id}" [#if item.id==branchId]selected[/#if]>${item.name}</option>
                    [/#list]
                </select>
            </p>
            <p  class="f_1p">
                <label class="f_info">Search</label>
                <input type="text" id="searchText" name="searchText" placeholder="Bank Name /Account Name /Account No" class="f_long" value="${searchText}" >
            </p>
            <p  class="f_1p">
                <button type="search" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <input type="hidden" id="searchFlag" name="searchFlag" value="${searchText}" >
            </p>
        </div>
    </menu>
    <div class="table">
    [#if bankList?size>0]
        <button type="button" id="saveBtn" class="btn bg_blue" data-icon="y">Save</button>
        <hr>
    [/#if]
        <table>
            <tr>
                <th><input type="checkbox" name="selectAll"  value="" id="all_checkbox"></th>
                <th>Bank Name</th>
                <th>Account Name</th>
                <th>Account No</th>
                <th>Currency</th>
                <th>Balance</th>
            </tr>

        [#list bankList as item]
            <tr>
                <td>
                    <input type="checkbox" name="bankId" value="${item.id}">
                </td>
                <td>${bankNameMap.get(item.bankNameId)} </td>
                <td> ${item.accountName}</td>
                <td> ${item.accountNo}</td>
                <td> ${item.currency}</td>
                <td> [@number num=item.balance][/@number]</td>
            </tr>
        [/#list]
        </table>
        <input id="pageNumber" name="pageNumber" value="1" type="hidden"/>
        <script>seajs.use("pagenation");</script>
    </div>
</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"BankOfBranch Add":"BankOfBranch Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:400,
                iframe:1
            })
            return false;
        });

        $("#saveBtn").on("click",function(){
            if($("#branchId").val()==null||$("#branchId").val()==""){
                alertM("请选择一个 Branch ！",{cls:""})
                return false;
            }

            $.ajax({
                type: "POST",
                url: "save.action",
                dataType:"json",
                data:$("#listForm").serialize()
            }).done(function(data){
                alertM(data.msg,{cls:data.status})
            })
        })



        var $t1 = $("#branchId").on("change",function(){
            var $t=$(this).val();
            var checkBoxArr =$("input[name='bankId']");
            $.ajax({
                type: "POST",
                url: "changeBranchId.action",
                dataType:"json",
                data: {branchId:$t}
            }).done(function(data){
                var bankIdList=data.data;
                for(var i=0;i<checkBoxArr.length;i++){
                    checkBoxArr[i].checked = false;
                    for(var j =0;j<bankIdList.length;j++){
                        if(checkBoxArr[i].value==bankIdList[j]){
                            checkBoxArr[i].checked = true;
                        }
                    }
                }
            })
        });

        $(function() {
            $t1.trigger("change");
        });

        /*$("#selectAll").on("click",function(){
            if($("#selectAll").prop("checked")){
                $("input[name='bankId']").prop("checked", true);
            }else{
                $("input[name='bankId']").prop("checked", false);
            }
        });*/

        $("#reset").on("click",function(){
            $("#status").val("1");
        })

        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
