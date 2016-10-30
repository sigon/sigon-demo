<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
[#assign menu="menuOut"]
[#include "/basicInfo/menu.ftl"]
<h2 class="page_title">Connected Merchant List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="merchantCode" value="${merchantCode}" />
    <div class="table">
    [@showMenu code="030222"]
        <a href="add.action?merchantCode=${code}" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Merchant Code</th>
                <th>Name</th>
                <th>Merchant Type</th>
                <th>Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.transferCode}</td>
                <td> ${item.name} </td>
                <td> ${item.merchantTypeStr} </td>
                <td>
                    <span class="btn_i item_menu">
                        o<span>
                         [@showMenu code="030223"]
                             <a href="javascript:" class="delete" data-itemid="${item.id}" data-icon="d">Delete</a>
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
       $(".delete").on("click",function(){
           var $t=$(this);
            alertM("Are you sure delete this ?",{
                time:"y",
                title:"Delete Connected Merchant",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_red",
                        func:function(){
                            alertM.end("delete.action",{id:$t.data("itemid")})
                            return false;
                        }
                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
        })

        $(".add").on("click",function(){
            var title="转出商户新增";
            alertM(this.href,{
                title:title,
                time:"y",
                width:400,
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
