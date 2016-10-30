<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">RealtimeRate List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Symbol</label>
                <input type="text" id="symbol" name="symbol" value="${realtimeRate.symbol}"  >
            </p>
            <p class="f_1p">
                <label class="f_info">XhBuy</label>
                <input type="text" id="buy" name="buy" value="${buy}" >
            </p>
            <p class="f_1p">
                <label class="f_info">XhSell</label>
                <input type="text" id="sell" name="sell" value="${sell}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Source</label>
                <input type="text" id="source" name="source" value="${realtimeRate.source}" >
            </p>
            <!--搜索和重置按钮-->
            <p>
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
    [@showMenu code="990601"]
        <a href="/realtimeRate/add.action" class="btn add bg_green" data-icon="a">Add</a><hr>
    [/@showMenu]
        <table>
            <tr>
                <th>symbol</th>
                <th>xhBuy</th>
                <th>xhSell</th>
                <th>source</th>
                <th>modifyDate</th>
                <th width="64">actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.symbol} </td>
                <td> [@number num=item.xhBuy m=100000 formatStr="#0.00000#"][/@number]</td>
                <td> [@number num=item.xhSell m=100000 formatStr="#0.00000#"][/@number]</td>
                <td> ${item.source} </td>
                <td> [@dateFormat value = item.modifyDate format="yyyy-MM-dd HH:mm:ss"][/@dateFormat]</td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.symbol}">
                        [@showMenu code="990602"]
                            <a href="/realtimeRate/edit.action?symbol=${item.symbol}" class="edit" data-icon="e">Edit</a>
                        [/@showMenu]
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
        $("#reset").on("click",function(){
            $("#status").val("1");
        })

        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"RealtimeRate Add":"RealtimeRate Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:250,
                iframe:1
            })
            return false;
        });

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
