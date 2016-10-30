<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
[#assign menu="Log"]
[#include "/basicInfo/menu.ftl"]
<h2 class="page_title">MerchantLog List</h2>
<form id="listForm" action="listLog.action" method="post">
    <input type="hidden" name="code" value="${code}" />
    <menu>
        <div class="form">
            <p class="f_2p">
                <label class="f_info">Create Date</label>
            [@inputRegion id="createDate" type="date"  start=merchantLogParam.createDateStart end=merchantLogParam.createDateEnd]
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
    [@showMenu code="030221"]
        <a href="add.action?merchantCode=${code}" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Merchant Code</th>
                <th>Remark</th>
                <th>User Id</th>
                <th>Create Date</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.code} </td>
                <td> [@subString content=item.remark length=20][/@subString] </td>
                <td>${item.username}</td>
                <td> ${item.createDate?datetime} </td>

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
            var title=$(this).is(".add")?"MerchantLog Add":"MerchantLog Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                iframe:1
            })
            return false;
        });
        $("#reset").on("click",function(){
            $("#status").val("1");
        })
        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        }
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
