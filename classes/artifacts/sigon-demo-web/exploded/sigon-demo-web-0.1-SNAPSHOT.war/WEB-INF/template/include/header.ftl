[#--<header>--]
    [#--<nav>--]
        [#--[@showMenu url="/staff/index.action" hasChildren="true" urlResourceCode="00"]<a href="/staff/index.action" title="Home" [#if header == "welcome"]class="on"[/#if]>1</a>[/@showMenu]--]
        [#--[@showMenu url="/merchant/list.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="01"]<a href="/merchant/list.action?queryint=0" title="Merchant" [#if header == "merchant"]class="on"[/#if]>3</a>[/@showMenu]--]
        [#--[@showMenu url="/exchangeCatalog/list.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="02"]<a href="/exchangeCatalog/list.action?queryint=0" title="Products" [#if header == "product"]class="on"[/#if]>2</a>[/@showMenu]--]
        [#--[@showMenu url="/staff/list.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="03"]<a href="/staff/list.action?queryint=0" title="Users" [#if header == "user"]class="on"[/#if]>7</a>[/@showMenu]--]
        [#--[@showMenu url="/message/list.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="04"]<a href="/message/list.action?queryint=0" title="Messages" [#if header == "message"]class="on"[/#if]>4[#if messageCount != 0]<i>${messageCount}</i>[/#if]</a>[/@showMenu]--]
        [#--[@showMenu url="/receiverOrder/list.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="05"]<a href="/receiverOrder/list.action?queryint=0" title="Order" [#if header == "receiverOrder"]class="on"[/#if]>2</a>[/@showMenu]--]
        [#--[@showMenu url="/systemBankAccount/view.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="06"]<a href="/systemBankAccount/view.action?queryint=0" title="Bank" [#if header == "bank"]class="on"[/#if]>$</a>[/@showMenu]--]
        [#--[@showMenu url="/paycompanyInfo/list.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="07"]<a href="/paycompanyInfo/list.action?queryint=0" title="Setting" [#if header == "setting"]class="on"[/#if]>6</a>[/@showMenu]--]
    [#--</nav>--]
[#--</header>--]