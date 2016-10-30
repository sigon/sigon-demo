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
        <input type="hidden" name="id"  id="id" value="${merchantDoc.id}"/>
    [/#if]
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <input  type="hidden" name="code"  id="code" value="${merchantBase.code}"/>
        <input type="hidden" id="merchantType" name="merchantType" value="${merchantBase.merchantType}">
        <input type="hidden" id="authorisePersonId" name="authorisePersonId">
        <div>
            <p class="f_1p">
                <label class="f_info" for="accountHolder">Account Holder
                <input type="checkbox" id="accountHolder" [#if merchantDoc.authorisePersonId==""]checked [/#if]></label>
            </p>
            <p class="f_1p" [#if merchantDoc.authorisePersonId==""] style="display: none;"[/#if] id="selectPerson">
                <a href="javascript:" class="btn bg_blue" id="ahButton">Select Authorise Person</a>
            </p>
        </div>
        <p [#if action=="save"||role==null]style="display: none;"[/#if] id="roleP">
            <label class="f_info">Name(Role)</label>
            <input id="roSpan" type="text" readonly value="${role}"/>
            [#--<span id="roSpan">${merchantLinkman.role?if_exists}</span>--]

        </p>
        <div>
        <p class="f_1p">
            <label class="f_info">
               <span id="legalName" [#if merchantBase.merchantType!=1]style="display: none;"[/#if]> Legal Name</span>
               <span id="registerName" [#if merchantBase.merchantType==1]style="display: none;"[/#if]>Register Name</span>
            </label>
            <input type="text" id="registerName" name="registerName" value="${merchantDoc.registerName}" data-v="validate[maxSize[50]]">
        </p>
            <p class="f_1p" id="qiye_p" [#if merchantBase.merchantType==1]style="display: none;"[/#if]>
                <label class="f_info"><span data-icon="S"></span>ID Type</label>
                <select id="idType" name="idTypeqiye">
                [#list idTypeEnum as item]

                        <option value="${item.id}" [#if item.id==merchantDoc.docType] selected="selected" [/#if]>${item.descEng}</option>

                [/#list]
                </select>
            </p>
            <p class="f_1p" id="ge_p" [#if merchantBase.merchantType!=1]style="display: none;"[/#if]>
                <label class="f_info">ID Type</label>
                <select id="idType" name="idTypege">
                [#list idTypeEnum as item]
                    [#if item.id!=4 &&item.id!=5 ]
                        <option value="${item.id}" [#if item.id==merchantDoc.docType] selected="selected" [/#if]>${item.descEng}</option>
                    [/#if]
                [/#list]
                </select>
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>ID Num</label>
                <input type="text" id="docNum" name="docNum" value="${merchantDoc.docNum}" data-v="validate[maxSize[50],required]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>[@traderComment content = "Issue Date" comment="Please enter the date with a format similar to 2015-12-01"][/@traderComment]</label>
                <input type="text" id="issueDate" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'remindDate\')}'})" class="Wdate" name="issueDateStr" value="[#if merchantDoc.issueDate??]${merchantDoc.issueDate?date}[/#if]" data-v="validate[required]">
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>
                    <span id="expireDate" [#if merchantBase.merchantType!=1]style="display: none;"[/#if] [#if isFlag]class="red"[/#if]> [@traderComment content = "Expire Date" comment="Please enter the date with a format similar to 2015-12-01"][/@traderComment]</span>
                    <span id="remindDate" [#if merchantBase.merchantType==1]style="display: none;"[/#if] [#if isFlag]class="red"[/#if]>[@traderComment content = "Remind Date" comment="Please enter the date with a format similar to 2015-12-01"][/@traderComment]</span>
                </label>
                <input type="text" id="remindDate" onclick="WdatePicker({minDate:'#F{$dp.$D(\'issueDate\')}'})" class="Wdate" name="remindDateStr" value="[#if merchantDoc.remindDate??]${merchantDoc.remindDate?date}[/#if]" data-v="validate[required]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Place Of Issue</label>
                <input type="text" id="placeOfIssue" name="placeOfIssue" value="${merchantDoc.placeOfIssue}" data-v="validate[maxSize[50],required]">
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
                <label class="f_info">Note</label>
                <textarea id="note" name="note" data-v="validate[maxSize[100]]" >${merchantDoc.note}</textarea>
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
            if(!$("#accountHolder").prop("checked")){
                if($("#roleP").is(":hidden")){
                    alertM("Please choose an authorise person！", {cls: "error"})
                    return false;
                }
            }
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="list.action?code=${merchantBase.code}";
            })
            return false
        })
        $("#accountHolder").on("change",function(){
           var $t=$(this);
            if($t.prop("checked")){
                $("#roleP").hide();
                $("#selectPerson").hide();
            }else{
                $("#selectPerson").show();
            }
        }).trigger("change");
        $("#ahButton").on("click",function(){
            alertM("/merchantDoc/linkmanList.action?code=${merchantBase.code}",{
                time:"y",
                iframe:1,
                width:900,
//                height:400,
                title:"Authorise Person(Double click the option)"
            })
        });
        window.refersh_selectLinkman=function(id){
            $("#authorisePersonId").val(id);
            $.ajax({
                url:"/merchantAuthorisePerson/selectLinkman.action?id="+ id,
                dataType:"json"
            }).done(function(data){
                if(data.status=="succ")
                    $("#merchantLinkman").val(data.data.no); //no no
                    $("#merchantType").val(data.data.merchantType);
                if(data.data.merchantType==1){
                    // 个人
                    $("#legalName").show();
                    $("#registerName").hide();
                    $("#expireDate").show();
                    $("#remindDate").hide();
                    $("#ge_p").show();
                    $("#qiye_p").hide();
                } else{
                    $("#legalName").hide();
                    $("#registerName").show();
                    $("#expireDate").hide();
                    $("#remindDate").show();
                    $("#ge_p").hide();
                    $("#qiye_p").show();
                }
                var role = data.data.data.role;
                var title =data.data.msg;
                if(role==null||role==""){
                    role="";
                }
                if(title==null||title==""){
                    title="";
                }
                $("#roSpan").val(title+" "+ data.data.data.firstName+" "+ data.data.data.lastName+"("+role+")");
                $("#roleP").show();
                alertM(data.msg, {
                    cls: data.status
                })
            })
        } ;

        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        }
//        var $h2=$("#action").val();
//        $("#h2").html("MerchantDoc " + $h2 == "save"?"Add":"Edit");
    })
</script>
</body>
</html>
