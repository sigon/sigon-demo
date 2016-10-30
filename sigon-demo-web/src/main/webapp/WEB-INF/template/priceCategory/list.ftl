
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]

</head>
<body>

<h2 class="page_title">Price Category</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">

    <div class="table">
        <table>
        [@showMenu code="040101"]
            <a href="add.action?method=insert" class="btn add bg_green" data-icon="a">Add</a>
        [/@showMenu]
            <hr>
            <tr>
                <th>Name</th>
                <th>Status</th>
                <th>Wholesale</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>${item.name}</td>
                <td>${priceCategoryEnumMap.get(item.status).descEng}</td>
                <td>${whetherEnumMap.get(item.wholeSale)}</td>
                <!--修改操作-->
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">

                        [#if item.id>5]
                            [@showMenu code="040102"]
                            <a href="/priceCategory/edit.action?id=${item.id}&method=update"  class="edit" data-icon="e">Edit</a>
                            [/@showMenu]
                        [#else ]
                        [@showMenu code="040103"]
                            <a href="/priceCategory/edit2.action?id=${item.id}&method=update"  class="edit short" data-icon="e">Edit</a>
                        [/@showMenu]
                        [/#if]

                    </span>
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
            var title=$(this).is(".add")?"Price Category Add":"Price Category Edit";
            var height=$(this).is(".short")?170:250;
            alertM(this.href,{
                title:title,
                time:"y",
                width:400,
                height:height,
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