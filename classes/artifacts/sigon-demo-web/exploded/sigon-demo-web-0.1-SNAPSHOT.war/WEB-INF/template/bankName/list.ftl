<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2 class="page_title">Maintain Bank List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <div class="table">
    [@showMenu code="050101"]
        <a href="/bankName/add.action" class="btn add bg_green" data-icon="a">Add</a><hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Bank name</th>
                <th>Abbreviation</th>
               <th>Country</th>
                <th>Website</th>
                <th>Online Banking</th>
                <th>Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>${item.fullName}</td>
                <td>${item.shortName}</td>
                <td>${item.country}</td>
                <td><span style="word-break: break-all">${item.website}</span></td>
                <td><span style="word-break: break-all">${item.internetBank}</span></td>
                <!--修改和删除操作-->
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         [@showMenu code="050102"]
                             <a href="/bankName/edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
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
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"Bank Add":"Bank Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:300,
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