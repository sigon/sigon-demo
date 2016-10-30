<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Gateways List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            [#--<p class="f_1p">
                <label class="f_info">AccountCode</label>
                <input type="text" id="accountCode" name="accountCode" value="${gateways.accountCode}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${gateways.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">SecretKey</label>
                <input type="text" id="secretKey" name="secretKey" value="${gateways.secretKey}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Vircardnoin</label>
                <input type="text" id="vircardnoin" name="vircardnoin" value="${gateways.vircardnoin}" >
            </p>--]
            <input type="hidden" id="queryint" name="queryint" value="1">
            <p class="f_1p">
                <label class="f_info">Name</label>
                <input type="text" id="name" name="name" value="${gateways.name}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Type</label>
                <select id="type" name="type" >
                    <option value="" >All</option>
                [#list gatewayTypeEnum as item]
                    <option value="${item.code}" [#if item.code==gateways.type]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">BankName</label>
                <select id="bankId" name="bankId">
                        <option value="">All</option>
                    [#list bankMap.keySet() as keyItem]
                        <option value="${keyItem}" [#if keyItem==gateways.bankId]selected[/#if]>${bankMap.get(keyItem)}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >All</option>
                [#list priceCategoryEnum as item]
                    <option value="${item.index}" [#if item.index==gateways.status]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            [#--<p class="f_1p">
                <label class="f_info">FeeAmt</label>
                <input type="text" id="feeAmt" name="feeAmt" value="${gateways.feeAmt}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Feerate</label>
                <input type="text" id="feerate" name="feerate" value="${gateways.feerate}" >
            </p>--]
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table" style="min-width: 1300px;">
    [@showMenu code="990801"]
        <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
    <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>code</th>
                <th>type</th>
                <th>name</th>
                <th>feerate</th>
                <th>version</th>
                <th>accountCode</th>
                <th >secretKey</th>
                <th>vircardnoin</th>
                <th>params</th>
                <th>bankName</th>
                <th>singleLimit </th>
                <th>singleFee </th>
                <th>status </th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.code} </td>
                <td> ${gatewayTypeMap.get(item.type).desc} </td>
                <td> ${item.name} </td>
                <td> [@number m=10 num=item.feerate/]‰ </td>
                <td> ${item.version} </td>
                <td> ${item.accountCode} </td>
                <td style="word-break: break-all"> ${item.secretKey} </td>
                <td style="word-break: break-all"> ${item.vircardnoin} </td>
                <td style="word-break: break-all"> ${item.params} </td>
                <td> ${bankMap.get(item.bankId)}</td>
                <td> [@number m=100 num=gatewayTypeMap.get(item.type).singleLimit/] </td>
                <td> [@number m=100 num=gatewayTypeMap.get(item.type).singleFee/] </td>
                <td> ${priceCategoryEnumMap.get(item.status).descEng} </td>
               <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.code}">
            [@showMenu code="990802"]<a href="edit.action?code=${item.code}" class="edit" data-icon="e">Edit</a>[/@showMenu]
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
        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
        $(".delete").on("click",function(){
            var $t=$(this);
            var idForDelete=$t.parent().data("itemid") ;
            alertM("确定删除？",{
                title:"删除",
                time:"y",
                btns:[{
                    txt:"确定",
                    cls:"bg_blue",
                    func:function(){
                        alertM.end("delete.action","code="+idForDelete);
                        return false;
                    }
                },{
                    txt:"取消"
                }]
            });

        })
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
