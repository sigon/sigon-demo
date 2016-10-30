<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">SmsTemplate List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">

            <p class="f_1p">
                <label class="f_info">Model</label>
                <select name="model" id="model">
                    <option value="">Seleect All</option>
                    [#list modelList as model]
                        <option value="${model.code}" [#if smsTemplate.model==model.code]selected[/#if]>${model.desc}</option>
                    [/#list]
                </select>
                [#--<input type="text" id="model" name="model" value="${smsTemplate.model}" >--]
            </p>

            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm bg_blue" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
            <hr>
        <table>
            <tr>
                <th>model</th>
                <th>messageInChinese</th>
                <th>messageInEnglise</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${modelMap.get(item.model).desc} </td>
                <td>[@subString content=item.messageInChinese length=40/] </td>[#--//[@subString content=item.urlParam length=40][/@subString]--]
                <td> [@subString content=item.messageInEnglise length=40/]</td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
                            [#--<a href="delete.action?id=${item.id}" class="delete" data-icon="e">Delete</a>--]
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
        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        };

        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"SmsTemplate Add":"SmsTemplate Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:460,
//                height:400,
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
