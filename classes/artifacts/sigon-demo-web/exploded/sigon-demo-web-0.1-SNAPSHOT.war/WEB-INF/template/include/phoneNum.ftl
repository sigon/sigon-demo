    <select id="phoneCodeParam" name="phoneCodeParam" class="f_short" >
        [#if select=="yes"]<option value="">Please select</option>[/#if]
    [#list addressCountryEnum as item]
        <option value="${item.countryCode}" [#if item.countryCode==phoneNumParam.phoneCodeParam]selected[/#if] >${item.countryCode}</option>
    [/#list]
    </select>
    <input id="phoneNumParam" style="${style}" type="text" name="phoneNumParam" value="${phoneNumParam.phoneNumParam}" onblur="this.value=$.trim(this.value.replace(/^[0\s]*/,''))" >
<script>
    seajs.use(["validation"],function(alertM){
        var $phoneNumParam=$("#phoneNumParam");
        if($("#phoneCodeParam").val()=="+64"){
            $phoneNumParam.attr("data-v","validate[[#if required]required,[/#if]custom[phoneNZD]]")
        }else if($("#phoneCodeParam").val()=="+86"){
            $phoneNumParam.attr("data-v","validate[[#if required]required,[/#if]custom[phoneCNY]]")
            $phoneNumParam.trigger("blur")
        }else{
            $phoneNumParam.attr("data-v", "validate[[#if required]required,[/#if]custom[number],maxSize[20]]")
            $phoneNumParam.trigger("blur")
        }
        [#--$phoneNumParam.attr("data-v",$("#phoneCodeParam").val()=="+64"?"validate[[#if required]required,[/#if]custom[phoneNZD]]":"validate[[#if required]required,[/#if]custom[phoneCNY]]")--]
        $phoneCodeParam=$("#phoneCodeParam").on("change",function(e,v){
            if($phoneCodeParam.val()=="+64"){
                $phoneNumParam.attr("data-v","validate[[#if required]required,[/#if]custom[phoneNZD]]")
            }else if($phoneCodeParam.val()=="+86"){
                $phoneNumParam.attr("data-v","validate[[#if required]required,[/#if]custom[phoneCNY]]")
                $phoneNumParam.trigger("blur")
            }else{
                $phoneNumParam.attr("data-v", "validate[[#if required]required,[/#if]custom[number],maxSize[20]]")
                $phoneNumParam.trigger("blur")
            }
        })
    });
</script>