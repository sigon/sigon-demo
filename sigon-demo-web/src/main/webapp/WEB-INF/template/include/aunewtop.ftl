<#ftl strip_whitespace=true>

<#macro message key, lang>${messageUtil.getLocaleMessageByLanguage(key, lang, null)}</#macro>

<#macro messageArgs key, lang, args>${messageUtil.getLocaleMessageByLanguage(key, lang, args)}</#macro>

<#macro longToTime longValue, format>${dateUtil.longToTime(longValue, format)}</#macro>