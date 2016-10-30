
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2">${h2}</h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
[#if action=="update"]
    <input type="hidden" name="id"  id="id" value="${merchantOtherDoc.id}"/>
[/#if]
    <input  type="hidden" name="action"  id="action" value="${action}"/>
    <input  type="hidden" name="code"  id="code" value="${merchantBase.code}"/>
    <div>
        <p class="f_1p">
            <label class="f_info">Doc Type</label>
            <select name="docType" id="docType">
            [#list docTypeEnum as item]
                <option value="${item.code}" [#if merchantOtherDoc.docType==item.code]selected="selected" [/#if]>${item.descEng}</option>
            [/#list]
            </select>
        </p>

    </div>
    <div>
        <p class="f_1p">
            <label class="f_info">Title</label>
            <input type="text" id="title" name="title" value="${merchantOtherDoc.title}" data-v="validate[maxSize[50]]">
        </p>
    </div>

    <div>
        <p class="cf"><label class="f_info">Upload</label>
            <span id="f_upload_p" style="display: none">
                <input type="hidden" name="isSource" value="${action}"/>
            [#list picList as file]
                <span class="file_up">
                    [#if file.fileType==1]
                        <span class="file_up_images" style="background-image:url([@fileUrl m=module.module f=file.url t="s"][/@fileUrl])" data-title="${file.name}" data-src="[@fileUrl m=module.module f=file.url][/@fileUrl]"></span>
                            <a class="remove" href="javascript:" data-fid="${file.id}">&times;</a>
                            <input type="text" class="file_txt fileName" data-fid="${file.id}" name="fileName${file.id}" value="${file.name}"/>
                            <input type="hidden" class="file_txt" name="key" value="${file.id}"/>
                    [#elseif file.fileType == 2]
                        <a class="file_up_txt" href="/upload/down.action?fileUrl=[@fileUrl m=module.module f=file.url][/@fileUrl]&fileName=${file.name}" target="_blank" data-icon="2"></a>
                            <a class="remove" href="javascript:" data-fid="${file.id}">&times;</a>
                            <input type="text" class="file_txt fileName" data-fid="${file.id}" name="fileName${file.id}" value="${file.name}"/>
                            <input type="hidden" class="file_txt" name="key" value="${file.id}"/>
                    [/#if]
                    </span>
            [/#list]
            </span>
            <input type="file" id="upfile"></p>
        <p>
            <label for="" class="info"></label><span class="red">Only type is *.jpg,*.png,*.gif,*.txt,*.doc,*.xls,*.pdf,*.docx,*.xlsx</span>
        </p>
    </div>
    <div>
    <p class="f_1p">
        <label class="f_info">Comment</label>
        <textarea id="comment" name="comment" data-v="validate[maxSize[200]]">${merchantOtherDoc.comment}</textarea>
    </p>
    </div>
    <p>
        <a href="javascript:window.history.back()" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>

    </p>
</form>
<script>
    seajs.use(["upload","piczoom","alert","validation"], function (swfupload,piczoom,alertM) {
        var up= swfupload({
                    bind: "#upfile",
                    url: "/upload/uploadFileDoc.action?folderNameId=${module.code}",
                    fileName: "file",
                    //            type:/(.*)+\.(jpg|jpeg|gif|png)$/i,
                    succ: function (data) {
                        for(var i=0;i<data.length;i++){
                            var html = '<span class="file_up">';
                            if (data[i].type == "images")
                                html += '<span class="file_up_images" style="background-image:url(' + data[i].filePath  + ')" data-title="' + data[i].i_txt + '" data-src="' + data[i].filePath + '"></span>'
                            else
                                html += '<a class="file_up_txt" href="/upload/down.action?fileUrl=' + data[i].urlF +'&fileName='+ data[i].i_txt + '" target="_blank" data-icon="2"></a>'
                            $s.show().append(html + '<a class="remove" href="javascript:" data-fid="' + data[i].key + '">&times;</a><input type="text" class="file_txt" name="fileName' + data[i].key + '" value="' + data[i].i_txt + '"><input type="hidden" name="key" value="' + data[i].key + '"></span>')
                        }
                    }
                }),
                up_i=21124,
                $s = $("#f_upload_p").on("click", ".remove", function () {
                    $(this).parent().remove();
                    if(!$s.find(".file_up").length)
                        $s.hide()
                });
        piczoom("#f_upload_p",".file_up_images")
        if($s.find(".file_up").length)
            $s.show()

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="list.action?code=${merchantBase.code}";
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })

        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        }
    })
</script>
</body>
</html>
