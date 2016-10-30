<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Purchase Order List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="queryint" value="1" >
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" name="orderNo" value="${purchaseOrder.orderNo}">
            </p>
            <p class="f_1p">
                <label class="f_info">Purchase Type</label>
                <select name="purchaseType" id="purchaseType">
                    <option value="">All</option>
                    [#list purchaseTypeList as item]
                        <option value="${item.code}" [#if purchaseOrder.purchaseType==item.code]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Provider</label>
                <select name="providerId" id="providerId">
                    <option value="">All</option>
                [#list listPro as item]
                    <option value="${item.id}"  [#if purchaseOrder.providerId==item.id ]selected[/#if]>${item.name}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Buy Currency</label>
                <select name="buyCurrency" id="buyCurrency">
                    <option value="">All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}"  [#if purchaseOrder.buyCurrency==item.descEng ]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Sell Currency</label>
                <select name="sellCurrency" id="sellCurrency">
                    <option value="">All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}"  [#if purchaseOrder.sellCurrency==item.descEng ]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Middle Currency</label>
                <select name="midCurrency" id="midCurrency">
                    <option value="">All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}"  [#if purchaseOrder.midCurrency==item.descEng ]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>


            <p class="f_2p">
                <label class="f_info">Create Date</label>
                    [@inputRegion id="createDate" type="date" start=purchaseOrder.createDateStart end=purchaseOrder.createDateEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            </p>
            <p class="f_2p">
                <label class="f_info">Settle Date</label>
            [@inputRegion id="settleDate" type="date" start=purchaseOrder.settleDateStart end=purchaseOrder.settleDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>
            <p class="f_2p">
                <label class="f_info">Receivable</label>
                <input type="checkbox" id="receiveAll" ><label for="receiveAll" class="f_for" style="min-width: 0px;">All</label>
            [#list receivableList as item]
                <input type="checkbox"  id="receive${item.code}" name="receivable" value="${item.code}" [#if checkedStr?index_of(item.desc)!=-1]checked[/#if]/>
                <label for="receive${item.code}" class="f_for">${item.desc}</label>
            [/#list]
            </p>

            <p class="f_2p">
                <label class="f_info">Payable</label>
                <input type="checkbox" id="payAll"><label for="payAll" class="f_for">All</label>
            [#list payableList as item]
                <input type="checkbox"  id="pay${item.code}" name="payable" value="${item.code}" [#if checkedStr?index_of(item.desc)!=-1||home==0]checked[/#if] />
                <label for="pay${item.code}" class="f_for">${item.desc}</label>
            [/#list]
            </p>

            <!--搜索和重置按钮-->
            <p  class="f_2p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
    [@showMenu code="100201"]
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
            <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Create Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th>Order No <br>Purchase Type</th>
                <th>Provider</th>
                <th>Buy amt <br>Amt to receive</th>
                <th>Rate</th>
                <th>Sell amt <br>Amt to pay</th>
                <th>Receivable <br>Payable</th>
                <th>Settle Date[@pageOrder pageable=page.pageable property="settle_date"][/@pageOrder]</th>
                <th>Creator</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr [#if map.get(item.id)&&(item.receivable!=1||item.payable!=1)]class=" bg_red"[/#if]>
                <td> ${item.createDate?datetime} </td>
                <td><a href="/purchaseOrderAccount/list.action?purchaseNo=${item.orderNo}&queryint=0" title="Settlement Order List" onclick="window.top.i_p.add(this);return false">${item.orderNo} </a>  <br> ${purchaseTypeMap.get(item.purchaseType).desc}</td>
                <td><a href="/provider/edit.action?id=${item.providerId}" title="Provider Edit" onclick="window.top.i_p.add(this);return false">${mapPro.get(item.providerId).name}</a></td>
                <td>
                    ${item.buyCurrency}&nbsp;[@number num = item.buyAmount][/@number]
                        <br>
                    ${item.buyCurrency}&nbsp;[@number num = item.amtToReceive][/@number]
                </td>
                <td>
                [#if item.purchaseType==2]
                        [@number num = item.midRate formatStr="##0.0000" m=100000][/@number]
                    [#else]
                        [@number num = item.rate formatStr="##0.0000" m=100000][/@number]
                [/#if]
            </td>
                <td>
                [#if item.purchaseType==2]
                    ${item.midCurrency}&nbsp;[@number num = item.midAmount][/@number]
                        <br>
                    ${item.midCurrency}&nbsp;[@number num = item.amtToPay][/@number]
                [#else]
                    ${item.sellCurrency}&nbsp;[@number num = item.sellAmount][/@number]
                        <br>
                    ${item.sellCurrency}&nbsp;[@number num = item.amtToPay][/@number]
                [/#if]

                </td>
                <td> ${receivableMap.get(item.receivable).desc} <br>${payableMap.get(item.payable).desc} </td>
                <td> ${item.settleDate?string("yyyy-MM-dd")} </td>
                <td> ${item.operator} </td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                [#if item.payable!=1||item.receivable!=1]
                    [@showMenu code="100202"]
                        <a href="delivery.action?id=${item.id}" data-icon="e">Delivery</a>
                    [/@showMenu]
                [/#if]
            [@showMenu code="100203"]
                        <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
            [/@showMenu]
                        [#if item.payable==2&&item.receivable==2]
                            [@showMenu code="100204"]
                                <a href="javascript:" data-itemid="${item.id}" class="delete" data-icon="d">Delete</a>
                            [/@showMenu]

                        [/#if]
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
//        $(".edit,.add").on("click",function(){
//            var title=$(this).is(".add")?"PurchaseOrder Add":"PurchaseOrder Edit";
//            alertM(this.href,{
//                title:title,
//                time:"y",
//                width:660,
//                height:400,
//                iframe:1
//            })
//            return false;
//        });

        $("input[name='receivable']").on("change",function(){
            $c = $("input[name='receivable']:not(:checked)")
            if($c.size() == 0) {
                $("#receiveAll").prop("checked", true);
            } else {
                $("#receiveAll").prop("checked", false);
            }
        }).trigger("change");

        $("#receiveAll").on("change",function(){
            if($("#receiveAll").prop("checked")) {
                $("input[name='receivable']").prop("checked", true);
            } else {
                $("input[name='receivable']").prop("checked", false);
            }
        });

        $("input[name='payable']").on("change",function(){
            $c = $("input[name='payable']:not(:checked)")
            if($c.size() == 0) {
                $("#payAll").prop("checked", true);
            } else {
                $("#payAll").prop("checked", false);
            }
        }).trigger("change");

        $("#payAll").on("change",function(){
            if($("#payAll").prop("checked")) {
                $("input[name='payable']").prop("checked", true);
            } else {
                $("input[name='payable']").prop("checked", false);
            }
        });

        $(".delete").on("click",function(){
            var $t=$(this);
            alertM("Are you sure to delete ?",{
                time:"y",
                title:"Confirm",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_blue",
                        func:function(){
                            alertM.end("delete.action",{id:$t.data("itemid")},function(){
                                window.location.href="/purchaseOrder/list.action";
                            })
                        }
                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
        })
        $("#reset").on("click",function(){
            $("#status").val("1");
        })

//        window.refresh=function(t){
//            if(t)
//                window.location.reload()
//            alertM.remove()
//        }
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
