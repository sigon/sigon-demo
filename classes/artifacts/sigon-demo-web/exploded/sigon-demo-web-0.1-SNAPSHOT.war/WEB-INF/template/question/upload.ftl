[#assign title="Question Upload"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<div class="pages">
    <div class="page">
        <h2 class="page_title">Upload Question Excel</h2>
            <div class="form">
                <form class="form_short_info">
                    <p><label class="f_info">Upload Excel</label><a id="upfile" href=""></a><span class="gray">Only type is *.xls</span></p>

                </form>
            </div>
        <script>
            seajs.use(["upload","alert"], function (upload, alertM) {
                upload({
                    bind: "#upfile",
                    url: "upload.action",
                    fileName: "file",
                    type:/\.xls$/i,
                    succ: function (data) {
                        alertM(data.msg,{cls:data.status,rf:function(){
                            window.location.href="upload.action";
                        }})
                        return true;
                    }
                })
//                $("#form1").on("submit",function(){
//                    alertM("Loading",{cls:"loading",time:"y"});
//                })
            });
        </script>
    </div>
</div>
[#include "/include/footer.ftl"]
</body>
</html>