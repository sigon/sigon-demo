<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MerchantGateway List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">BondRate</label>
                <input type="text" id="bondRate" name="bondRate" value="${merchantGateway.bondRate}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${merchantGateway.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsTransfer</label>
                <input type="text" id="isTransfer" name="isTransfer" value="${merchantGateway.isTransfer}" >
            </p>
            <p class="f_1p">
                <label class="f_info">InitBondAmount</label>
                <input type="text" id="initBondAmount" name="initBondAmount" value="${merchantGateway.initBondAmount}" >
            </p>
            <p class="f_1p">
                <label class="f_info">ApiCurrency</label>
                <input type="text" id="apiCurrency" name="apiCurrency" value="${merchantGateway.apiCurrency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Language</label>
                <input type="text" id="language" name="language" value="${merchantGateway.language}" >
            </p>
            <p class="f_1p">
                <label class="f_info">SettlementDate</label>
                <input type="text" id="settlementDate" name="settlementDate" value="${merchantGateway.settlementDate}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsProxy</label>
                <input type="text" id="isProxy" name="isProxy" value="${merchantGateway.isProxy}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BondDate</label>
                <input type="text" id="bondDate" name="bondDate" value="${merchantGateway.bondDate}" >
            </p>
            <p class="f_1p">
                <label class="f_info">FeeRate</label>
                <input type="text" id="feeRate" name="feeRate" value="${merchantGateway.feeRate}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsCny</label>
                <input type="text" id="isCny" name="isCny" value="${merchantGateway.isCny}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsCurrency</label>
                <input type="text" id="isCurrency" name="isCurrency" value="${merchantGateway.isCurrency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">SignKey</label>
                <input type="text" id="signKey" name="signKey" value="${merchantGateway.signKey}" >
            </p>
            <p class="f_1p">
                <label class="f_info">GatewayId</label>
                <input type="text" id="gatewayId" name="gatewayId" value="${merchantGateway.gatewayId}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
        <a href="add.action" class="btn add" data-icon="a">Add</a>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>bondRate</th>
                <th>code</th>
                <th>isTransfer</th>
                <th>initBondAmount</th>
                <th>apiCurrency</th>
                <th>language</th>
                <th>settlementDate</th>
                <th>isProxy</th>
                <th>bondDate</th>
                <th>feeRate</th>
                <th>isCny</th>
                <th>isCurrency</th>
                <th>signKey</th>
                <th>gatewayId</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.bondRate} </td>
<td> ${item.code} </td>
<td> ${item.isTransfer} </td>
<td> ${item.initBondAmount} </td>
<td> ${item.apiCurrency} </td>
<td> ${item.language} </td>
<td> ${item.settlementDate} </td>
<td> ${item.isProxy} </td>
<td> ${item.bondDate} </td>
<td> ${item.feeRate} </td>
<td> ${item.isCny} </td>
<td> ${item.isCurrency} </td>
<td> ${item.signKey} </td>
<td> ${item.gatewayId} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
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

    seajs.use(["alert","validation"], function (alertM) {
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"MerchantGateway Add":"MerchantGateway Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:400,
                iframe:1
            })
            return false;
        });
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
