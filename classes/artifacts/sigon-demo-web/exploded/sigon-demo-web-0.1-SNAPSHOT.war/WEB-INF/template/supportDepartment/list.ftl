<!DOCTYPE html>
<html>
<head>
    [#include "/include/head.ftl"]
    <title>Support Department</title>
</head>
<body>
<h2 >Support Department</h2>

<form id="listForm" action="list.action" method="post">
<div class="table">
[@showMenu code="010201"]
    <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
<hr>
[/@showMenu]
    <table>
        <tr>
            <th>Department</th>
            <th>Status</th>
            <th>trader</th>
            <th width="40">Actions</th>
        </tr>
        [#list page.content as item]
            <tr >
                <td>${item.department}</td>
                <td>${priceCategoryEnumMap.get(item.status).descEng}</td>
                <td>[@showValue value=item.user][/@showValue]</td>
                <td><span class="btn_i item_menu">
                            o<span >
                        [@showMenu code="010202"]
                             <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
                        [/@showMenu]
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
    seajs.use(["alert"],function(alertM){
        $(".add").on("click",function(){
            alertM(this.href,{
                title:"Support Department Add",
                time:"y",
                width:660,
                iframe:1
            })
            return false;
        });
        $(".edit").on("click",function(){
            alertM(this.href,{
                title:"Support Department Edit",
                time:"y",
                width:660,
                iframe:1
            })
            return false;
        });
        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        };

    });
</script>
</body>
</html>