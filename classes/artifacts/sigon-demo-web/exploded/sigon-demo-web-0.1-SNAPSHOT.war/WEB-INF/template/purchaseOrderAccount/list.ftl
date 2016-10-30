<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Settlement Order List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="queryint" value="1" >
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Provider</label>
                <select id="providerName" name="providerName" >
                    <option value="" >All</option>
                    [#list providerList as item]
                        <option value="${item.name}" [#if item.name==purchaseOrderAccount.providerName]selected[/#if]>${item.name}</option>
                    [/#list]
                </select>
            </p>


            <p class="f_1p">
                <label class="f_info">Direction</label>
                <select id="direction" name="direction" >
                    <option value="" >All</option>
                    [#list directionEnum as item]
                        <option value="${item.code}" [#if item.code==purchaseOrderAccount.direction]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">To bank name</label>
                <input type="text" id="toBankName" name="toBankName" value="${purchaseOrderAccount.toBankName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">To bank account name</label>
                <input type="text" id="toAccountName" name="toAccountName" value="${purchaseOrderAccount.toAccountName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">To bank account number</label>
                <input type="text" id="toAccountNumber" name="toAccountNumber" value="${purchaseOrderAccount.toAccountNumber}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Purchase No</label>
                <input type="text" id="purchaseNo" name="purchaseNo" value="${purchaseOrderAccount.purchaseNo}" >
            </p>
        [#if data==2]
            <p class="f_1p">
                <label class="f_info">Data</label>
                <select id="level" name="level" >
                    <option value="" >All</option>
                    [#list datalevelEnum as item]
                        <option value="${item.code}" [#if item.code==purchaseOrderAccount.level]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
        [/#if]

            <!--搜索和重置按钮-->
            <p  class="f_2p">
                <button type="submit" id="searchForm " class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
        <table>
            <tr>

                <th>Provider</th>
                <th>Settlement No</th>
                <th>Purchase No</th>
                <th>Direction</th>
                <th>Amount</th>
                <th>Trader</th>
                <th>Delivery Date [@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
            </tr>

        [#list page.content as item]
            <tr>

                <td><a href="javascript:" class="btn_i td_down">M</a> ${item.providerName}</td>
                <td> ${item.settlementNo}</td>
                <td> <a href="/purchaseOrder/edit.action?id=${item.purchaseOrderId}">${item.purchaseNo}</a></td>
                <td> ${directionMap.get(item.direction).desc}</td>
                <td> ${item.currency} [@number num=item.amount][/@number]</td>
                <td> ${item.user}</td>
                <td> [@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.createDate][/@dateFormat]</td>

            </tr>
            <tr class="tr_hide">
                <td colspan="99">
                    <p>
                        <label> From Bank:</label>
                        ${item.fromBankName}-${item.fromAccountName}-${item.fromAccountNumber}-${item.currency}
                    </p>
                    <p>
                        <label>To Bank:</label>
                        ${item.toBankName}-${item.toAccountName}-${item.toAccountNumber}
                    </p>
                    <p>
                        <label>Comment:</label>
                        [@showValue  value=item.remark][/@showValue]
                    </p>
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
            var title=$(this).is(".add")?"PurchaseOrderAccount Add":"PurchaseOrderAccount Edit";
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
