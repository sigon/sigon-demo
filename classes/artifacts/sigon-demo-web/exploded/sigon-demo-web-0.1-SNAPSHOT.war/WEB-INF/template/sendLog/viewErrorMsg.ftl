<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
[#include "/include/head.ftl"]
    <title>Mail</title>
</head>
<body>
<div style="width:700px;margin:0 auto;">
    <table cellspacing="0" cellpadding="0" style="font-family:Verdana,sans-serif;width:600px;empty-cells: show;border-collapse: collapse;border-spacing: 0;">
        <tr>
            <td style="background:#fff;padding:10px">
                <p style="font-size:13px;line-height:20px;color:#636363;margin:0 0 20px 0;">${errorMsg}</p>
            </td>
        </tr>
    </table>
    <div class="table">
    <table>
    <thead>
    <tr class="header"><th id="tableHeader" align="left" style="width: 80px">错误编码</th><th id="tableHeader" align="left">错误摘要</th><th id="tableHeader" align="left">具体描述</th></tr>
    </thead>
    <tbody>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-001/">001</a></strong></p>
        </td>
        <td align="left">
            <p>Authentication failed</p>
        </td>
        <td align="left">
            <p>Authentication details are incorrect.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-007/">007</a></strong></p>
        </td>
        <td align="left">
            <p>IP lock down violation</p>
        </td>
        <td align="left">
            <p>You have locked down the API instance to a specific IP address but attempted to send from an IP address different to the one you have set.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-101/">101</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid or missing parameters</p>
        </td>
        <td align="left">
            <p>One or more parameters are missing or invalid.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-102/">102</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid user data header</p>
        </td>
        <td align="left">
            <p>The format of the user data header is incorrect.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-105/">105</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid destination address</p>
        </td>
        <td align="left">
            <p>The destination address you are attempting to send to is invalid.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-106/">106</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid source address</p>
        </td>
        <td align="left">
            <p>The sender address that is specified is incorrect.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-108/">108</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid or missing API ID</p>
        </td>
        <td align="left">
            <p>The API ID is either incorrect or has not been included in the API call.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-109/">109</a></strong></p>
        </td>
        <td align="left">
            <p>Missing message ID</p>
        </td>
        <td align="left">
            <p>This may refer to either aclient message ID or API message ID - for example, when using the stop message command.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-113/">113</a></strong></p>
        </td>
        <td align="left">
            <p>Maximum message parts exceeded</p>
        </td>
        <td align="left">
            <p>The text component of the message is greater than the permitted 160 characters (70 Unicode characters). View the <a class="a-blue" href="https://www.clickatell.com/developers/api-docs/concatenation-advanced-message-send/">concatenation</a> page for help in resolving this issue.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-114/">114</a></strong></p>
        </td>
        <td align="left">
            <p>Cannot route message</p>
        </td>
        <td align="left">
            <p>This implies that the gateway is not currently routing messages to this network prefix. Please email support@clickatell.com with the mobile number in question.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-116/">116</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid Unicode data</p>
        </td>
        <td align="left">
            <p>The format of the Unicode data entered is incorrect.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-120/">120</a></strong></p>
        </td>
        <td align="left">
            <p>cliMsgId (Client Message ID) contains space(s)</p>
        </td>
        <td align="left">
            <p>Your specified client message ID contains a space. Space characters in client message ID's are not currently supported.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-121/">121</a></strong></p>
        </td>
        <td align="left">
            <p>Destination mobile number blocked</p>
        </td>
        <td align="left">
            <p>This number is not allowed to receive messages from us and has been put on our block list.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-122/">122</a></strong></p>
        </td>
        <td align="left">
            <p>Destination mobile opted out</p>
        </td>
        <td align="left">
            <p>The user has opted out and is no longer subscribed to your service.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-123/">123</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid Sender ID</p>
        </td>
        <td align="left">
            <p>The <a class="a-blue" href="https://www.clickatell.com/developers/api-docs/sender-id-advanced-message-send/">sender ID</a> is not valid or has not been approved.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-128/">128</a></strong></p>
        </td>
        <td align="left">
            <p>Number delisted</p>
        </td>
        <td align="left">
            <p>This number has been delisted and cannot receive our messages.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-130/">130</a></strong></p>
        </td>
        <td align="left">
            <p>Maximum MT limit exceeded until</p>
        </td>
        <td align="left">
            <p>This error is returned when an account has exceeded the maximum number of MT messages which can be sent daily or monthly. You can send messages again on the date indicated by the UNIX TIMESTAMP.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-201/">201</a></strong></p>
        </td>
        <td align="left">
            <p>Invalid batch ID</p>
        </td>
        <td align="left">
            <p>The batch ID which you have entered for batch messaging is not valid.</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-202/">202</a></strong></p>
        </td>
        <td align="left">
            <p>No batch template</p>
        </td>
        <td align="left">
            <p>The batch template has not been defined for the batch command.</p>
        </td>
    </tr>
    <tr class="even">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-301/">301</a></strong></p>
        </td>
        <td align="left">
            <p>No credit left</p>
        </td>
        <td align="left">
            <p>Insufficient credits</p>
        </td>
    </tr>
    <tr class="odd">
        <td align="left">
            <p><strong><a class="a-blue" href="https://www.clickatell.com/developers/api-docs/error-code-901/">901</a></strong></p>
        </td>
        <td align="left">
            <p>Internal error - please retry</p>
        </td>
        <td align="left">
            <p>This error indicates that an error ocurred on our platforms and that your application can retry submitting the message. This should be exceptionally rare.</p>
        </td>
    </tr>
    </tbody>
    </table>
    </div>
</div>
</body>
</html>
