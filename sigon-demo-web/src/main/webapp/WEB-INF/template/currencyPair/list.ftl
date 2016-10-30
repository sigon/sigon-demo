<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Currency Pair List</h2>
<form id="listForm" action="list.action?queryint=1" method="POST">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">BaseCurrency</label>
                <select name="baseCurrency" id="baseCurrency">
                    <option value="">Select All</option>
                [#list currencyList as item]
                    [#if item.descEng!="CNY"&&item.descEng!="NZD"]
                        <option value="${item.descEng}" [#if currencyPair.baseCurrency==item.descEng]selected[/#if] >${item.descEng}</option>
                    [/#if]
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select name="status" id="status">
                    <option value="99" [#if currencyPair.status==99]selected[/#if] >All</option>
                    [#list statusList as item]
                        <option value="${item.index}" [#if currencyPair.status==item.index||(item.index==1&&currencyPair.status=="")]selected[/#if] >${item.descEng}</option>
                    [/#list]
                </select>
            </p>
            <!--搜索和重置按钮-->
            <p class="f_1p">
                <button type="submit" id="searchForm " class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
        <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
        <table>
            <tr>
                <th>baseCurrency</th>
                <th>tradeCurrency</th>
                <th>status</th>
                <th>Create Date</th>
                <th width="100">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.baseCurrency}</td>
                <td> ${item.tradeCurrency}</td>
                <td> ${enumMap.get(item.status).descEng}</td>
                <td>${item.createDate?datetime}</td>
                <td>
                     <a href="javascript:" class="change" data-itemid="${item.id}">[#if item.status==1]Set Deactive[#else]Set Active[/#if]</a>
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

    seajs.use(["alert", "validation"], function (alertM) {
        $(".change").on("click",function(){
            var $t=$(this);
            alertM("Please confirm you want to change currency pair status ?",{
                time:"y",
                title:"Currency Pair Status",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_blue",
                        func:function(){
                            alertM.end("change.action",{id:$t.data("itemid")},"/currencyPair/list.action")
                            return false;
                        }
                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
        })


        $(".add").on("click", function () {
            var title = "Currency Pair Add";
            alertM(this.href, {
                title: title,
                time: "y",
                width: 660,
                iframe: 1
            })
            return false;
        });
        $("#reset").on("click", function () {
            $("#status").val("1");
        })

        window.refresh = function (t) {
            if (t)
                window.location.reload()
            alertM.remove()
        }
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
