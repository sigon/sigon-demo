define(function(require, exports, module) {
	require('jquery');
	var alertM = require('alert'),
		address = require('address')
	return function(opt) {
		$(opt.elm).on("click", function() {
			var $t = $(this);
			alertM("loading", {
				cls: "loading",
				time: "y"
			});
			$.ajax({
				url: opt.href + $t.data("code")
			}).done(function(data) {
				alertM(data, {
					title: "Edit Address",
					time: "y",
					width: 600,
					of: function() {
						address.init().bind({
							country: "#country",
							city: "#city"
						});
						var $f = this.find("form").on("submit", function() {
							$.ajax({
								url: opt.action,
								dataType: "json",
								method: "post",
								data: $f.serialize()
							}).done(function(data) {
								alertM(data.msg, {
									cls: data.status,
									rf: function() {
										var html = "";
										if (data.status == "succ") {
											for (var i = 0; i < data.data.length; i++) {
												var item = data.data[i];
												html += "<option value='" + item.id + "'" + (item.selected ? "selected" : "") + ">" + item.addressLine + "</option>";
											}
											$("#" + $t.data("for")).html(html);
										}
									}
								})
							});
							return false;
						});
					},
					btns: [{
						txt: "Submit",
						cls: "bg_blue",
						func: function() {
							$("#addressForm").submit();
							return false;
						}
					}, {
						txt: "Cancel"
					}]
				})
			});
			return false;
		})
	}
});