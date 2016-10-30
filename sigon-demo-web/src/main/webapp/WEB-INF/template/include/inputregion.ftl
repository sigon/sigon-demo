[#if regionStart != null && regionStart==regionEnd]
    [#assign type=1]
[#else ]
    [#assign type=0]
[/#if]
<select id="${regionId}Type" name="${regionId}Type" class="region f_short no_rst" style="margin-right:9px" data-id="${regionId}">
    <option value="0" [#if type==0]selected="selected" [/#if]>Range</option>
    <option value="1" [#if type==1]selected="selected" [/#if]>Specify</option>
</select>
<span id="${regionId}Region0">
    <input type="text" style="margin-right: 9px;[#if timeType=="yes"]width:130px;[#else]width:90px;[/#if]" [#if regionType=="date"]onClick="[#if timeType=="yes"]WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})[#else]WdatePicker()[/#if]"[/#if] class="[#if regionType=="date"]Wdate[/#if] " [#if regionType!="date"]onblur="blurToMoney(this)"[/#if] id="${regionId}Start" name="${regionId}Start" value="${regionStart}">
    <input type="text" style="margin-right: 0;[#if timeType=="yes"]width:130px;[#else]width:90px;[/#if]" [#if regionType=="date"]onClick="[#if timeType=="yes"]WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})[#else]WdatePicker()[/#if]"[/#if] class="[#if regionType=="date"]Wdate[/#if] " [#if regionType!="date"]onblur="blurToMoney(this)"[/#if] id="${regionId}End" name="${regionId}End" value="${regionEnd}">
</span>
<span id="${regionId}Region1" style="display: none">
    <input type="text" style="[#if timeType=="yes"]width:130px;[#else]width:90px;[/#if]" [#if regionType=="date"]onClick="[#if timeType=="yes"]WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})[#else]WdatePicker()[/#if]"[/#if] class="[#if regionType=="date"]Wdate[/#if] regionV " [#if regionType!="date"]onblur="blurToMoney(this)"[/#if]  id="${regionId}Region" data-id="${regionId}" value="${regionStart}">
</span>
<script>seajs.use("inputregion");</script>