<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Mail</title>
</head>
<body>
<div style="width:556px;margin:0 auto;background:#F9FCFF">
    <table cellspacing="0" cellpadding="0" width="556" style="font-family:HelveticaNeue,sans-serif;empty-cells: show;border-collapse: collapse;border-spacing: 0;width:100%;background:#F9FCFF;border: 0;font-size:14px;color:#5c6466;line-height:21px;">
        [#include "/include/mailTop.ftl"]
        <tr>
            <td style="background:#F9FCFF;font-weight: lighter;font-size:28px;letter-spacing:2px;line-height:80px;height:80px;padding: 0 0 0 9px" colspan="4">${department}-${issue}</td>
        </tr>
        <tr>
            <td style="background:#F9FCFF;" colspan="4">
                <div style="background:#ffffff;border:1px solid #90999c;border-radius:6px;padding: 24px 32px;margin:0 9px 40px 9px">
                    <h4 style="font-size:16px;color:#90999c;line-height:28px;"><b>[@aunewtop.message "base.dear", lang/] ${name}, </b></h4>
                    <p style="font-family:HelveticaNeue;margin:0 0 16px 0">[@aunewtop.message "mail.support.comments", lang/] ${comments}</p>
                    <p style="font-family:HelveticaNeue;margin:0 0 16px 0">[@aunewtop.message "mail.support.reply", lang/] ${reply}</p>
                    <p style="font-size:13px;line-height:20px;color:#636363;margin:0 0 20px 0;">${comment}</p>
                </div>
            </td>
        </tr>
        [#include "/include/mailBottom.ftl"]
    </table>
</div>
</body>
</html>