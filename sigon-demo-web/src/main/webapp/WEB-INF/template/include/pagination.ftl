<div class="pagination cf">
    <div class="fr">
        <input id="pageNumber" name="pageNumber" value="1" data-pageindex="${pageNumber}" data-pagelength="${totalPages}" type="hidden"/>
        <input type="hidden" id="sortname" name="orderProperty" value="${page.orderProperty}" />
        <input type="hidden" id="sortval" name="orderDirection" value="${page.orderDirection}" />
	[#if totalPages > 1]
	[#--<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}" />--]
        <input type="hidden" id="searchProperty" name="searchProperty" value="${page.searchProperty}" />
		[#if isFirst]
            <span class="btn_i disabled" title="First" >f</span>
            <span class="btn_i disabled" title="Prev" >p</span>
		[#else]
            <a href="javascript:" class="btn_i" title="First">f</a>
            <a href="javascript:" class="btn_i" title="Prev">p</a>
		[/#if]
		[#list segment as segmentPageNumber]
			[#if segmentPageNumber_index == 0 && segmentPageNumber > firstPageNumber]
                <span class="pageBreak">...</span>
			[/#if]
			[#if segmentPageNumber != pageNumber]
                <a href="javascript:" data-pageindex="${segmentPageNumber}">${segmentPageNumber}</a>
			[#else]
                <span>${segmentPageNumber}</span>
			[/#if]
			[#if !segmentPageNumber_has_next && segmentPageNumber < lastPageNumber]
                <span class="pageBreak">...</span>
			[/#if]
		[/#list]
		[#if isLast]
            <span class="btn_i disabled" title="Next">n</span>
            <span class="btn_i disabled" title="Last">l</span>
		[#else]
            <a href="javascript:" class="btn_i" title="Next">n</a>
            <a href="javascript:" class="btn_i" title="Last">l</a>
		[/#if]
	[/#if]
    </div>
    Page ${page.pageNumber} of ${totalPages}, Records ${page.total}, Per page
[#if pageSizeChange]
    <select id="pageSize" name="pageSize">
	[#--[#if PageSize?? ]<option>${PageSize}</option>[/#if]--]
        <option [#if page.pageSize==10 ] selected = "selected"[/#if]>10</option>
        <option [#if page.pageSize==20 ] selected = "selected"[/#if]>20</option>
        <option [#if page.pageSize==50 ] selected = "selected"[/#if]>50</option>
        <option [#if page.pageSize==100 ] selected = "selected"[/#if]>100</option>
    </select>
[#else]
${page.pageSize}
[/#if]
    <script>seajs.use("pagenation");</script>
</div>