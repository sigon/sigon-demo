define(function(require, exports, module) {
	require('jquery');
	(function($){
		// 验证规则
		$.fn.validationEngineLanguage = function(){};
		$.validationEngineLanguage = {
			newLang:function(){
				$.validationEngineLanguage.allRules = {
					"required":{ // Add your regex rules here, you can take telephone as an example
						"regex":"none",
						"alertText":vdntip[0],
						"alertTextCheckboxMultiple":vdntip[1],
						"alertTextCheckboxe":vdntip[2],
						"alertTextDateRange":vdntip[3]
					},
					"dateRange":{
						"regex":"none",
						"alertText":vdntip[4],
						"alertText2":vdntip[5]
					},
					"dateTimeRange":{
						"regex":"none",
						"alertText":vdntip[4],
						"alertText2":vdntip[6]
					},
					"minSize":{
						"regex":"none",
						"alertText":vdntip[7],
						"alertText2":vdntip[9]
					},
					"maxSize":{
						"regex":"none",
						"alertText":vdntip[8],
						"alertText2":vdntip[9]
					},
					"groupRequired":{
						"regex":"none",
						"alertText":vdntip[10]
					},
					"min":{
						"regex":"none",
						"alertText":vdntip[11]
					},
					"max":{
						"regex":"none",
						"alertText":vdntip[12]
					},
					"past":{
						"regex":"none",
						"alertText":vdntip[13],
						"alertText2":vdntip[15]
					},
					"future":{
						"regex":"none",
						"alertText":vdntip[14],
						"alertText2":vdntip[16]
					},
					"maxCheckbox":{
						"regex":"none",
						"alertText":vdntip[17],
						"alertText2":vdntip[19]
					},
					"minCheckbox":{
						"regex":"none",
						"alertText":vdntip[18],
						"alertText2":vdntip[19]
					},
					"equals":{
						"regex":"none",
						"alertText":vdntip[20]
					},
					"creditCard": {
						"regex": "none",
						"alertText":vdntip[21]
					},
					"phoneCNY":{
						"regex":/^1(3[0-9]|5[0-35-9]|7[03678]|8[0-9])[0-9]{8}$/,
						"alertText":vdntip[22]
					},
					"phoneNZD":{
						"regex":/^2[0126-9][0-9]{6,8}$/,
						"alertText":vdntip[22]
					},
					"email":{
						// Shamelessly lifted from Scott Gonzalez via the Bassistance Validation plugin http://projects.scottsplayground.com/email_address_validation/
						"regex":/^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/,
						"alertText":vdntip[23]
					},
					"integer":{
						"regex":/^[\-\+]?\d+$/,
						"alertText":vdntip[24]
					},
					"number":{
						// Number, including positive, negative, and floating decimal. credit:orefalo
						"regex":/^[\-\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]+))?$/,
						"alertText":vdntip[25]
					},
					"date":{
						"regex":/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/,
						"alertText":vdntip[26]+'YYYY-MM-DD'
					},
					"ipv4":{
						"regex":/^((([01]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))[.]){3}(([0-1]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))$/,
						"alertText":vdntip[27]
					},
					"url":{
						"regex":/^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
						"alertText":vdntip[28]
					},
					"onlyNumber":{
						"regex":/^[0-9]+$/,
						"alertText":vdntip[29]
					},
					"onlyLetter":{
						"regex":/^[a-zA-Z]+$/,
						"alertText":vdntip[30]
					},
					"onlyNumberSp":{
						"regex":/^[0-9\ ]+$/,
						"alertText":vdntip[29]
					},
					"onlyLetterSp":{
						"regex":/^[a-zA-Z\ ]+$/,
						"alertText":vdntip[30]
					},
					"onlyChineseLetterSp":{
						"regex":/^[a-zA-Z\u4E00-\u9FA5\ ]+$/,
						"alertText":vdntip[42]
					},
					"onlyChineseLetterNumberSp":{
						"regex":/^[a-zA-Z0-9\u4E00-\u9FA5\ ]+$/,
						"alertText":vdntip[41]
					},
					"onlyLetterNumber":{
						"regex":/^[0-9a-zA-Z]+$/,
						"alertText":vdntip[31]
					},
					//tls warning:homegrown not fielded
					"dateFormat":{
						"regex":/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:0?[1-9]|1[0-2])(\/|-)(?:0?[1-9]|1\d|2[0-8]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(0?2(\/|-)29)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/,
						"alertText":vdntip[32]
					},
					//tls warning:homegrown not fielded
					"dateTimeFormat":{
						"regex":/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/,
						"alertText":vdntip[33],
						"alertText2":vdntip[34],
						"alertText3":"mm/dd/yyyy hh:mm:ss AM|PM"+vdntip[35],
						"alertText4":"yyyy-mm-dd hh:mm:ss AM|PM"
					},

					/**
					 * 正则验证规则补充
					 * Author: ciaoca@gmail.com
					 * Date: 2013-10-12
					 */
					"chinese":{
						"regex":/^[\u4E00-\u9FA5]+$/,
						"alertText":vdntip[36]
					},
					"chinaId":{
						"regex":"none",
						"alertText":vdntip[37]
					},
					"chinaIdLoose":{
						"regex":/^(\d{18}|\d{15}|\d{17}[xX])$/,
						"alertText":vdntip[38]
					},
					"chinaZip":{
						"regex":/^\d{6}$/,
						"alertText":vdntip[39]
					},
					"qq":{
						"regex":/^[1-9]\d{4,10}$/,
						"alertText":vdntip[40]
					}
				};

			}
		};
		$.validationEngineLanguage.newLang();
	})(jQuery);
	(function($) {

		"use strict";

		/**
		* 修复 IE8 以下不支持 indexOf，导致产生错误
		*/
		if (!Array.indexOf) {
			Array.prototype.indexOf = function(obj) {
				for (var i = 0; i < this.length; i++) {
					if (this[i] == obj) {
						return i;
					}
				}
				return -1;
			};
		};

		var methods = {

			/**
			* Kind of the constructor, called before any action
			* @param {Map} user options
			*/
			init: function(options) {
				var form = this;
				if (!form.data('jqv') || form.data('jqv') == null ) {
					options = methods._saveOptions(form, options);
				}
				return this;
			 },
			/**
			* Attachs jQuery.validationEngine to form.submit and field.blur events
			* Takes an optional params: a list of options
			* ie. jQuery("#formID1").validationEngine('attach', {promptPosition : "centerRight"});
			*/
			attach: function(userOptions) {

				var form = this;
				var options;

				if(userOptions)
					options = methods._saveOptions(form, userOptions);
				else
					options = form.data('jqv');

				options.validateAttribute = (form.find("[data-v*=validate]").length) ? "data-v" : "class";
				if (options.binded) {

					// delegate fields
					form.on(options.validationEventTrigger, "["+options.validateAttribute+"*=validate]:not([type=checkbox]):not([type=radio]):not(.datepicker)", methods._onFieldEvent);
					form.on("click", "["+options.validateAttribute+"*=validate][type=checkbox],["+options.validateAttribute+"*=validate][type=radio]", methods._onFieldEvent);
					form.on(options.validationEventTrigger,"["+options.validateAttribute+"*=validate][class*=datepicker]", {"delay": 300}, methods._onFieldEvent);
				}
				if (options.autoPositionUpdate) {
					$(window).bind("resize", {
						"noAnimation": true,
						"formElem": form
					}, methods.updatePromptsPosition);
				}
				form.on("click","a[data-v-skip], a[class*='validate-skip'], button[data-v-skip], button[class*='validate-skip'], input[data-v-skip], input[class*='validate-skip']", methods._submitButtonClick);
				form.removeData('jqv_submitButton');

				// bind form.submit
				form.on("submit", methods._onSubmitEvent);
				return this;
			},
			/**
			* Unregisters any bindings that may point to jQuery.validaitonEngine
			*/
			detach: function() {

				var form = this;
				var options = form.data('jqv');

				// unbind fields
				form.find("["+options.validateAttribute+"*=validate]").not("[type=checkbox]").off(options.validationEventTrigger, methods._onFieldEvent);
				form.find("["+options.validateAttribute+"*=validate][type=checkbox],[class*=validate][type=radio]").off("click", methods._onFieldEvent);

				// unbind form.submit
				form.off("submit", methods._onSubmitEvent);
				form.removeData('jqv');

				form.off("click", "a[data-v-skip], a[class*='validate-skip'], button[data-v-skip], button[class*='validate-skip'], input[data-v-skip], input[class*='validate-skip']", methods._submitButtonClick);
				form.removeData('jqv_submitButton');

				if (options.autoPositionUpdate)
					$(window).off("resize", methods.updatePromptsPosition);

				return this;
			},
			/**
			* Validates either a form or a list of fields, shows prompts accordingly.
			* Note: There is no ajax form validation with this method, only field ajax validation are evaluated
			*
			* @return true if the form validates, false if it fails
			*/
			validate: function() {
				var element = $(this);
				var valid = null;

				if (element.is("form") || element.hasClass("validationEngineContainer")) {
					if (element.hasClass('validating')) {
						// form is already validating.
						// Should abort old validation and start new one. I don't know how to implement it.
						return false;
					} else {
						element.addClass('validating');
						var options = element.data('jqv');
						var valid = methods._validateFields(this);

						// If the form doesn't validate, clear the 'validating' class before the user has a chance to submit again
						setTimeout(function(){
							element.removeClass('validating');
						}, 100);
						if (valid && options.onSuccess) {
							options.onSuccess();
						} else if (!valid && options.onFailure) {
							options.onFailure();
						}
					}
				} else if (element.is('form') || element.hasClass('validationEngineContainer')) {
					element.removeClass('validating');
				} else {
					// field validation
					var form = element.closest('form, .validationEngineContainer'),
						options = (form.data('jqv')) ? form.data('jqv') : $.validationEngine.defaults,
						valid = !methods._validateField(element, options);

					if (valid && options.onFieldSuccess)
						options.onFieldSuccess();
					else if (options.onFieldFailure && options.InvalidFields.length > 0) {
						options.onFieldFailure();
					}
				}
				if(options.onValidationComplete) {
					// !! ensures that an undefined return is interpreted as return false but allows a onValidationComplete() to possibly return true and have form continue processing
					return !!options.onValidationComplete(form, valid);
				}
				return valid;
			},
			/**
			* Displays a prompt on a element.
			* Note that the element needs an id!
			*
			* @param {String} promptText html text to display type
			* @param {String} type the type of bubble: 'pass' (green), 'load' (black) anything else (red)
			* @param {String} possible values topLeft, topRight, bottomLeft, centerRight, bottomRight
			*/
			showPrompt: function(promptText, type, promptPosition, showArrow) {
				var form = this.closest('form, .validationEngineContainer');
				var options = form.data('jqv');
				// No option, take default one
				if(!options)
					options = methods._saveOptions(this, options);
				if(promptPosition)
					options.promptPosition=promptPosition;
				options.showArrow = showArrow==true;

				methods._showPrompt(this, promptText, type, false, options);
				return this;
			},
			/**
			* Closes form error prompts, CAN be invidual
			*/
			hide: function() {
				 var form = $(this).closest('form, .validationEngineContainer');
				 var options = form.data('jqv');
				 var fadeDuration = (options && options.fadeDuration) ? options.fadeDuration : 0.3;
				 var closingtag;

				 if($(this).is("form") || $(this).hasClass("validationEngineContainer")) {
					 closingtag = "parentForm"+methods._getClassName($(this).attr("id"));
				 } else {
					 closingtag = methods._getClassName($(this).attr("id")) +"formError";
				 }
				 $('.'+closingtag).fadeTo(fadeDuration, 0.3, function() {
					 $(this).parent('.formErrorOuter').remove();
					 $(this).remove();
				 });
				 return this;
			 },
			 /**
			 * Closes all error prompts on the page
			 */
			 hideAll: function() {

				 var form = this;
				 var options = form.data('jqv');
				 var duration = options ? options.fadeDuration:300;
				 $('.formError').fadeTo(duration, 300, function() {
					 $(this).parent('.formErrorOuter').remove();
					 $(this).remove();
				 });
				 return this;
			 },
			/**
			* Typically called when user exists a field using tab or a mouse click, triggers a field
			* validation
			*/
			_onFieldEvent: function(event) {
				var field = $(this);
				if(this.value.length||methods._need){
					var form = field.closest('form, .validationEngineContainer');
					var options = form.data('jqv');
					options.eventTrigger = "field";
					// validate the current field
					window.setTimeout(function() {
						methods._validateField(field, options);
						if (options.InvalidFields.length == 0 && options.onFieldSuccess) {
							options.onFieldSuccess();
						} else if (options.InvalidFields.length > 0 && options.onFieldFailure) {
							options.onFieldFailure();
						}
					}, (event.data) ? event.data.delay : 0);
				}else
					field.removeClass("v_pass v_error").next().html("")
			},
			/**
			* Called when the form is submited, shows prompts accordingly
			*
			* @param {jqObject}
			*            form
			* @return false if form submission needs to be cancelled
			*/
			_need:false,
			_onSubmitEvent: function(e) {
				methods._need=true;
				var form = $(this);
				var options = form.data('jqv');

				//check if it is trigger from skipped button
				if (form.data("jqv_submitButton")){
					var submitButton = $("#" + form.data("jqv_submitButton"));
					if (submitButton){
						if (submitButton.length > 0){
							if (submitButton.hasClass("validate-skip") || submitButton.attr("data-v-skip") == "true")
								return true;
						}
					}
				}

				options.eventTrigger = "submit";

				// validate each field
				// (- skip field ajax validation, not necessary IF we will perform an ajax form validation)
				var r=methods._validateFields(form);

				if (r && options.ajaxFormValidation) {
					methods._validateFormWithAjax(form, options);
					// cancel form auto-submission - process with async call onAjaxFormComplete
					return false;
				}

				if(options.onValidationComplete) {
					// !! ensures that an undefined return is interpreted as return false but allows a onValidationComplete() to possibly return true and have form continue processing
					return !!options.onValidationComplete(form, r);
				}
				if(!r)
					e.stopImmediatePropagation()
				return r;
			},
			/**
			* Return true if the ajax field validations passed so far
			* @param {Object} options
			* @return true, is all ajax validation passed so far (remember ajax is async)
			*/
			_checkAjaxStatus: function(options) {
				var status = true;
				$.each(options.ajaxValidCache, function(key, value) {
					if (!value) {
						status = false;
						// break the each
						return false;
					}
				});
				return status;
			},

			/**
			* Return true if the ajax field is validated
			* @param {String} fieldid
			* @param {Object} options
			* @return true, if validation passed, false if false or doesn't exist
			*/
			_checkAjaxFieldStatus: function(fieldid, options) {
				return options.ajaxValidCache[fieldid] == true;
			},
			/**
			* Validates form fields, shows prompts accordingly
			*
			* @param {jqObject}
			*            form
			* @param {skipAjaxFieldValidation}
			*            boolean - when set to true, ajax field validation is skipped, typically used when the submit button is clicked
			*
			* @return true if form is valid, false if not, undefined if ajax form validation is done
			*/
			_validateFields: function(form) {
				var options = form.data('jqv');

				// this variable is set to true if an error is found
				var errorFound = false;

				// Trigger hook, start validation
				form.trigger("jqv.form.validating");
				// first, evaluate status of non ajax fields
				var first_err=null;
				form.find('['+options.validateAttribute+'*=validate]').not(":disabled").each( function() {
					var field = $(this);
					var names = [];
					if ($.inArray(field.attr('name'), names) < 0) {
						errorFound |= methods._validateField(field, options);
						if (errorFound && first_err==null)
							if (field.is(":hidden") && options.prettySelect)
								first_err = field = form.find("#" + options.usePrefix + methods._jqSelector(field.attr('id')) + options.useSuffix);
							else {

								//Check if we need to adjust what element to show the prompt on
								//and and such scroll to instead
								if(field.data('jqv-prompt-at') instanceof jQuery ){
									field = field.data('jqv-prompt-at');
								} else if(field.data('jqv-prompt-at')) {
									field = $(field.data('jqv-prompt-at'));
								}
								first_err=field;
							}
						if (options.doNotShowAllErrosOnSubmit)
							return false;
						names.push(field.attr('name'));

						//if option set, stop checking validation rules after one error is found
						if(options.showOneMessage == true && errorFound){
							return false;
						}
					}
				});

				// second, check to see if all ajax calls completed ok
				// errorFound |= !methods._checkAjaxStatus(options);

				// third, check status and scroll the container accordingly
				form.trigger("jqv.form.result", [errorFound]);

				if (errorFound) {
					first_err.focus();
					return false;
				}
				return true;
			},
			/**
			* Validates field, shows prompts accordingly
			*
			* @param {jqObject}
			*            field
			* @param {Array[String]}
			*            field's validation rules
			* @param {Map}
			*            user options
			* @return false if field is valid (It is inversed for *fields*, it return false on validate and true on errors.)
			*/
			_validateField: function(field, options, skipAjaxValidation) {
				if (!field.attr("id")) {
					field.attr("id", "form-validation-field-" + $.validationEngine.fieldIdCounter);
					++$.validationEngine.fieldIdCounter;
				}

			   if (!options.validateNonVisibleFields && (field.is(":hidden") && !options.prettySelect || field.parent().is(":hidden")))
					return false;

				var rulesParsing = field.attr(options.validateAttribute);
				var getRules = /validate\[(.*)\]/.exec(rulesParsing);

				if (!getRules)
					return false;
				var str = getRules[1];
				var rules = str.split(/\[|,|\]/);

				// true if we ran the ajax validation, tells the logic to stop messing with prompts
				var isAjaxValidator = false;
				var fieldName = field.attr("name");
				var promptText = [];
				var promptType = "";
				var required = false;
				var limitErrors = false;
				options.isError = false;
				options.showArrow = true;

				// If the programmer wants to limit the amount of error messages per field,
				if (options.maxErrorsPerField > 0) {
					limitErrors = true;
				}
				field.val($.trim(field.val()))
				var form = $(field.closest("form, .validationEngineContainer"));
				// Fix for adding spaces in the rules
				for (var i = 0; i < rules.length; i++) {
					rules[i] = rules[i].replace(" ", "");
					// Remove any parsing errors
					if (rules[i] === '') {
						delete rules[i];
					}
				}

				for (var i = 0, field_errors = 0; i < rules.length; i++) {
					// If we are limiting errors, and have hit the max, break
					if (limitErrors && field_errors >= options.maxErrorsPerField) {
						// If we haven't hit a required yet, check to see if there is one in the validation rules for this
						// field and that it's index is greater or equal to our current index
						if (!required) {
							var have_required = $.inArray('required', rules);
							required = (have_required != -1 &&  have_required >= i);
						}
						break;
					}
					var errorMsg = undefined;
					switch (rules[i]) {
						case "required":
							required = true;
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._required);
							break;
						case "groupRequired":
							// Check is its the first of group, if not, reload validation with first field
							// AND continue normal validation on present field
							var classGroup = "["+options.validateAttribute+"*=" +rules[i + 1] +"]";
							// var firstOfGroup = form.find(classGroup).eq(0);
							// if(firstOfGroup[0] != field[0]){
							// 	methods._validateField(firstOfGroup, options, skipAjaxValidation);
							// 	options.showArrow = true;
							// }
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._groupRequired);
							if(errorMsg)  required = true;
							else form.find(classGroup).each(function(){
								var $t=$(this);
								if($t.next().text()==options.allrules['groupRequired'].alertText)
								methods.closePrompt($t.removeClass(options.addFailureCssClassToField))
							})
							options.showArrow = false;
							break;
						case "custom":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._custom);
							break;
						case "ajax":
							// AJAX defaults to returning it's loading message
							errorMsg = methods._ajax(field, rules, i, options);
							if (errorMsg) {
								promptType = "load";
							}
							break;
						case "minSize":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._minSize);
							break;
						case "maxSize":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._maxSize);
							break;
						case "min":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._min);
							break;
						case "max":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._max);
							break;
						case "past":
							errorMsg = methods._getErrorMessage(form, field,rules[i], rules, i, options, methods._past);
							break;
						case "future":
							errorMsg = methods._getErrorMessage(form, field,rules[i], rules, i, options, methods._future);
							break;
						case "dateRange":
							var classGroup = "["+options.validateAttribute+"*=" + rules[i + 1] + "]";
							options.firstOfGroup = form.find(classGroup).eq(0);
							options.secondOfGroup = form.find(classGroup).eq(1);

							//if one entry out of the pair has value then proceed to run through validation
							if (options.firstOfGroup[0].value || options.secondOfGroup[0].value) {
								errorMsg = methods._getErrorMessage(form, field,rules[i], rules, i, options, methods._dateRange);
							}
							if (errorMsg) required = true;
							options.showArrow = false;
							break;

						case "dateTimeRange":
							var classGroup = "["+options.validateAttribute+"*=" + rules[i + 1] + "]";
							options.firstOfGroup = form.find(classGroup).eq(0);
							options.secondOfGroup = form.find(classGroup).eq(1);

							//if one entry out of the pair has value then proceed to run through validation
							if (options.firstOfGroup[0].value || options.secondOfGroup[0].value) {
								errorMsg = methods._getErrorMessage(form, field,rules[i], rules, i, options, methods._dateTimeRange);
							}
							if (errorMsg) required = true;
							options.showArrow = false;
							break;
						case "maxCheckbox":
							field = $(form.find("input[name='" + fieldName + "']"));
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._maxCheckbox);
							break;
						case "minCheckbox":
							field = $(form.find("input[name='" + fieldName + "']"));
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._minCheckbox);
							break;
						case "equals":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._equals);
							break;
						case "funcCall":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._funcCall);
							break;
						case "creditCard":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._creditCard);
							break;
						case "chinaId":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._chinaId);
							break;
						case "condRequired":
							errorMsg = methods._getErrorMessage(form, field, rules[i], rules, i, options, methods._condRequired);
							if (errorMsg !== undefined) {
								required = true;
							}
							break;

						default:
					}

					var end_validation = false;

					// If we were passed back an message object, check what the status was to determine what to do
					if (typeof errorMsg == "object") {
						switch (errorMsg.status) {
							case "_break":
								end_validation = true;
								break;
							// If we have an error message, set errorMsg to the error message
							case "_error":
								errorMsg = errorMsg.message;
								break;
							// If we want to throw an error, but not show a prompt, return early with true
							case "_error_no_prompt":
								return true;
								break;
							// Anything else we continue on
							default:
								break;
						}
					}

					// If it has been specified that validation should end now, break
					if (end_validation) {
						break;
					}

					// If we have a string, that means that we have an error, so add it to the error message.
					if (typeof errorMsg == 'string') {
						promptText.push(errorMsg);
						options.isError = true;
						field_errors++;
					}
				}
				promptText=promptText.join(',')
				// If the rules required is not added, an empty field is not validated
				//the 3rd condition is added so that even empty password fields should be equal
				//otherwise if one is filled and another left empty, the "equal" condition would fail
				//which does not make any sense
				if(!required && !(field.val()) && field.val().length < 1 && rules.indexOf("equals") < 0) options.isError = false;

				// Hack for radio/checkbox group button, the validation go into the
				// first radio/checkbox of the group
				var fieldType = field.prop("type");
				var positionType=field.data("promptPosition") || options.promptPosition;

				if ((fieldType == "radio" || fieldType == "checkbox") && form.find("input[name='" + fieldName + "']").size() > 1) {
					if(positionType === 'inline') {
						field = $(form.find("input[name='" + fieldName + "'][type!=hidden]:last"));
					} else {
					field = $(form.find("input[name='" + fieldName + "'][type!=hidden]:first"));
					}
					options.showArrow = false;
				}

				if(field.is(":hidden") && options.prettySelect) {
					field = form.find("#" + options.usePrefix + methods._jqSelector(field.attr('id')) + options.useSuffix);
				}

				if (options.isError && options.showPrompts){
					methods._showPrompt(field, promptText, promptType, false, options);
				}else{
					if (!isAjaxValidator) methods._closePrompt(field);
				}

				// if (!isAjaxValidator) {
				// 	field.trigger("jqv.field.result", [field, options.isError, promptText]);
				// }

				/* Record error */
				var errindex = $.inArray(field[0], options.InvalidFields);
				if (errindex == -1) {
					if (options.isError)
					options.InvalidFields.push(field[0]);
				} else if (!options.isError) {
					options.InvalidFields.splice(errindex, 1);
				}

				methods._handleStatusCssClasses(field, options);

				/* run callback function for each field */
				if (options.isError && options.onFieldFailure)
					options.onFieldFailure(field);

				if (!options.isError && options.onFieldSuccess)
					options.onFieldSuccess(field);
				field.trigger("jqv.field.result", [field, options.isError, promptText]);
				return options.isError;
			},
			/**
			* Handling css classes of fields indicating result of validation
			*
			* @param {jqObject}
			*            field
			* @param {Array[String]}
			*            field's validation rules
			* @private
			*/
			_handleStatusCssClasses: function(field, options) {
				/* remove all classes */
				if(options.addSuccessCssClassToField)
					field.removeClass(options.addSuccessCssClassToField);

				if(options.addFailureCssClassToField)
					field.removeClass(options.addFailureCssClassToField);

				/* Add classes */
				if (options.addSuccessCssClassToField && !options.isError)
					field.addClass(options.addSuccessCssClassToField);

				if (options.addFailureCssClassToField && options.isError)
					field.addClass(options.addFailureCssClassToField);
			},

			 /********************
			  * _getErrorMessage
			  *
			  * @param form
			  * @param field
			  * @param rule
			  * @param rules
			  * @param i
			  * @param options
			  * @param originalValidationMethod
			  * @return {*}
			  * @private
			  */
			 _getErrorMessage:function (form, field, rule, rules, i, options, originalValidationMethod) {
				 // If we are using the custon validation type, build the index for the rule.
				 // Otherwise if we are doing a function call, make the call and return the object
				 // that is passed back.
				 var rule_index = jQuery.inArray(rule, rules);
				 if (rule === "custom" || rule === "funcCall") {
					 var custom_validation_type = rules[rule_index + 1];
					 rule = rule + "[" + custom_validation_type + "]";
					 // Delete the rule from the rules array so that it doesn't try to call the
					// same rule over again
					delete(rules[rule_index]);
				 }
				 // Change the rule to the composite rule, if it was different from the original
				 var alteredRule = rule;


				 var element_classes = (field.attr("data-v")) ? field.attr("data-v") : field.attr("class");
				 var element_classes_array = element_classes.split(" ");

				 // Call the original validation method. If we are dealing with dates or checkboxes, also pass the form
				 var errorMsg;
				 if (rule == "future" || rule == "past"  || rule == "maxCheckbox" || rule == "minCheckbox") {
					 errorMsg = originalValidationMethod(form, field, rules, i, options);
				 } else {
					 errorMsg = originalValidationMethod(field, rules, i, options);
				 }

				 // If the original validation method returned an error and we have a custom error message,
				 // return the custom message instead. Otherwise return the original error message.
				 if (errorMsg != undefined) {
					 var custom_message = methods._getCustomErrorMessage($(field), element_classes_array, alteredRule, options);
					 if (custom_message) errorMsg = custom_message;
				 }
				 return errorMsg;

			 },
			 _getCustomErrorMessage:function (field, classes, rule, options) {
				var custom_message = false;
				var validityProp = /^custom\[.*\]$/.test(rule) ? methods._validityProp["custom"] : methods._validityProp[rule];
				 // If there is a validityProp for this rule, check to see if the field has an attribute for it
				if (validityProp != undefined) {
					custom_message = field.attr("data-errormessage-"+validityProp);
					// If there was an error message for it, return the message
					if (custom_message != undefined)
						return custom_message;
				}
				custom_message = field.attr("data-errormessage");
				 // If there is an inline custom error message, return it
				if (custom_message != undefined)
					return custom_message;
				var id = '#' + field.attr("id");
				// If we have custom messages for the element's id, get the message for the rule from the id.
				// Otherwise, if we have custom messages for the element's classes, use the first class message we find instead.
				if (typeof options.custom_error_messages[id] != "undefined" &&
					typeof options.custom_error_messages[id][rule] != "undefined" ) {
							  custom_message = options.custom_error_messages[id][rule]['message'];
				} else if (classes.length > 0) {
					for (var i = 0; i < classes.length && classes.length > 0; i++) {
						 var element_class = "." + classes[i];
						if (typeof options.custom_error_messages[element_class] != "undefined" &&
							typeof options.custom_error_messages[element_class][rule] != "undefined") {
								custom_message = options.custom_error_messages[element_class][rule]['message'];
								break;
						}
					}
				}
				if (!custom_message &&
					typeof options.custom_error_messages[rule] != "undefined" &&
					typeof options.custom_error_messages[rule]['message'] != "undefined"){
						 custom_message = options.custom_error_messages[rule]['message'];
				 }
				 return custom_message;
			 },
			 _validityProp: {
				 "required": "value-missing",
				 "custom": "custom-error",
				 "groupRequired": "value-missing",
				 "ajax": "custom-error",
				 "minSize": "range-underflow",
				 "maxSize": "range-overflow",
				 "min": "range-underflow",
				 "max": "range-overflow",
				 "past": "type-mismatch",
				 "future": "type-mismatch",
				 "dateRange": "type-mismatch",
				 "dateTimeRange": "type-mismatch",
				 "maxCheckbox": "range-overflow",
				 "minCheckbox": "range-underflow",
				 "equals": "pattern-mismatch",
				 "funcCall": "custom-error",
				 "creditCard": "pattern-mismatch",
				 "chinaId": "pattern-mismatch",
				 "condRequired": "value-missing"
			 },
			/**
			* Required validation
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @param {bool} condRequired flag when method is used for internal purpose in condRequired check
			* @return an error string if validation failed
			*/
			_required: function(field, rules, i, options, condRequired) {
				switch (field.prop("type")) {
					case "text":
					case "password":
					case "textarea":
					case "file":
					case "select-one":
					case "select-multiple":
					default:
						var field_val      = $.trim( field.val()                               );
						var dv_placeholder = $.trim( field.attr("data-validation-placeholder") );
						var placeholder    = $.trim( field.attr("placeholder")                 );
						if (
							   ( !field_val                                    )
							|| ( dv_placeholder && field_val == dv_placeholder )
							|| ( placeholder    && field_val == placeholder    )
						) {
							return options.allrules[rules[i]].alertText;
						}
						break;
					case "radio":
					case "checkbox":
						// new validation style to only check dependent field
						if (condRequired) {
							if (!field.attr('checked')) {
								return options.allrules[rules[i]].alertTextCheckboxMultiple;
							}
							break;
						}
						// old validation style
						var form = field.closest("form, .validationEngineContainer");
						var name = field.attr("name");
						if (form.find("input[name='" + name + "']:checked").size() == 0) {
							if (form.find("input[name='" + name + "']:visible").size() == 1)
								return options.allrules[rules[i]].alertTextCheckboxe;
							else
								return options.allrules[rules[i]].alertTextCheckboxMultiple;
						}
						break;
				}
			},
			/**
			* Validate that 1 from the group field is required
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_groupRequired: function(field, rules, i, options) {
				var classGroup = "["+options.validateAttribute+"*=" +rules[i + 1] +"]";
				var isValid = false;
				// Check all fields from the group
				var $f=field.closest("form, .validationEngineContainer").find(classGroup).each(function(){
					if(!methods._required($(this), rules, i, options)){
						isValid = true;
						return false;
					}
				});
				if(!isValid){
				  return options.allrules[rules[i]].alertText;
				}
			},
			/**
			* Validate rules
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_custom: function(field, rules, i, options) {
				if(!field.val().length) return;
				var customRule = rules[i + 1];
				var rule = options.allrules[customRule];
				var fn;
				if(!rule) {
					alert("jqv:custom rule not found - "+customRule);
					return;
				}

				if(rule["regex"]) {
					 var ex=rule.regex;
						if(!ex) {
							alert("jqv:custom regex not found - "+customRule);
							return;
						}
						var pattern = new RegExp(ex);

						if (!pattern.test(field.val())) return options.allrules[customRule].alertText;

				} else if(rule["func"]) {
					fn = rule["func"];

					if (typeof(fn) !== "function") {
						alert("jqv:custom parameter 'function' is no function - "+customRule);
							return;
					}

					if (!fn(field, rules, i, options))
						return options.allrules[customRule].alertText;
				} else {
					alert("jqv:custom type not allowed "+customRule);
						return;
				}
			},
			/**
			* Validate custom function outside of the engine scope
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_funcCall: function(field, rules, i, options) {
				var functionName = rules[i + 1];
				var fn;
				if(functionName.indexOf('.') >-1)
				{
					var namespaces = functionName.split('.');
					var scope = window;
					while(namespaces.length)
					{
						scope = scope[namespaces.shift()];
					}
					fn = scope;
				}
				else
					fn = window[functionName] || options.customFunctions[functionName];
				if (typeof(fn) == 'function')
					return fn(field, rules, i, options);

			},
			/**
			* Field match
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_equals: function(field, rules, i, options) {
				var equalsField = rules[i + 1];

				if (field.val() != $("#" + equalsField).val())
					return options.allrules.equals.alertText;
			},
			/**
			* Check the maximum size (in characters)
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_maxSize: function(field, rules, i, options) {
				var max = rules[i + 1];
				var len = $.trim(field.val()).length;

				if (len > max) {
					var rule = options.allrules.maxSize;
					return rule.alertText + max + rule.alertText2;
				}
			},
			/**
			* Check the minimum size (in characters)
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_minSize: function(field, rules, i, options) {
				var min = rules[i + 1];
				var len = $.trim(field.val()).length;

				if (len < min) {
					var rule = options.allrules.minSize;
					return rule.alertText + min + rule.alertText2;
				}
			},
			/**
			* Check number minimum value
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_min: function(field, rules, i, options) {
				var min = parseFloat(rules[i + 1]);
				var len = parseFloat(field.val());

				if (len < min) {
					var rule = options.allrules.min;
					if (rule.alertText2) return rule.alertText + min + rule.alertText2;
					return rule.alertText + min;
				}
			},
			/**
			* Check number maximum value
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_max: function(field, rules, i, options) {
				var max = parseFloat(rules[i + 1]);
				var len = parseFloat(field.val());

				if (len >max ) {
					var rule = options.allrules.max;
					if (rule.alertText2) return rule.alertText + max + rule.alertText2;
					//orefalo: to review, also do the translations
					return rule.alertText + max;
				}
			},
			/**
			* Checks date is in the past
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_past: function(form, field, rules, i, options) {

				var p=rules[i + 1];
				var fieldAlt = $(form.find("*[name='" + p.replace(/^#+/, '') + "']"));
				var pdate;

				if (p.toLowerCase() == "now") {
					pdate = new Date();
				} else if (undefined != fieldAlt.val()) {
					if (fieldAlt.is(":disabled"))
						return;
					pdate = methods._parseDate(fieldAlt.val());
				} else {
					pdate = methods._parseDate(p);
				}
				var vdate = methods._parseDate(field.val());

				if (vdate > pdate ) {
					var rule = options.allrules.past;
					if (rule.alertText2) return rule.alertText + methods._dateToString(pdate) + rule.alertText2;
					return rule.alertText + methods._dateToString(pdate);
				}
			},
			/**
			* Checks date is in the future
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_future: function(form, field, rules, i, options) {

				var p=rules[i + 1];
				var fieldAlt = $(form.find("*[name='" + p.replace(/^#+/, '') + "']"));
				var pdate;

				if (p.toLowerCase() == "now") {
					pdate = new Date();
				} else if (undefined != fieldAlt.val()) {
					if (fieldAlt.is(":disabled"))
						return;
					pdate = methods._parseDate(fieldAlt.val());
				} else {
					pdate = methods._parseDate(p);
				}
				var vdate = methods._parseDate(field.val());

				if (vdate < pdate ) {
					var rule = options.allrules.future;
					if (rule.alertText2)
						return rule.alertText + methods._dateToString(pdate) + rule.alertText2;
					return rule.alertText + methods._dateToString(pdate);
				}
			},
			/**
			* Checks if valid date
			*
			* @param {string} date string
			* @return a bool based on determination of valid date
			*/
			_isDate: function (value) {
				var dateRegEx = new RegExp(/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:0?[1-9]|1[0-2])(\/|-)(?:0?[1-9]|1\d|2[0-8]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(0?2(\/|-)29)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/);
				return dateRegEx.test(value);
			},
			/**
			* Checks if valid date time
			*
			* @param {string} date string
			* @return a bool based on determination of valid date time
			*/
			_isDateTime: function (value){
				var dateTimeRegEx = new RegExp(/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/);
				return dateTimeRegEx.test(value);
			},
			//Checks if the start date is before the end date
			//returns true if end is later than start
			_dateCompare: function (start, end) {
				return (new Date(start.toString()) < new Date(end.toString()));
			},
			/**
			* Checks date range
			*
			* @param {jqObject} first field name
			* @param {jqObject} second field name
			* @return an error string if validation failed
			*/
			_dateRange: function (field, rules, i, options) {
				//are not both populated
				if ((!options.firstOfGroup[0].value && options.secondOfGroup[0].value) || (options.firstOfGroup[0].value && !options.secondOfGroup[0].value)) {
					return options.allrules[rules[i]].alertText + options.allrules[rules[i]].alertText2;
				}

				//are not both dates
				if (!methods._isDate(options.firstOfGroup[0].value) || !methods._isDate(options.secondOfGroup[0].value)) {
					return options.allrules[rules[i]].alertText + options.allrules[rules[i]].alertText2;
				}

				//are both dates but range is off
				if (!methods._dateCompare(options.firstOfGroup[0].value, options.secondOfGroup[0].value)) {
					return options.allrules[rules[i]].alertText + options.allrules[rules[i]].alertText2;
				}
			},
			/**
			* Checks date time range
			*
			* @param {jqObject} first field name
			* @param {jqObject} second field name
			* @return an error string if validation failed
			*/
			_dateTimeRange: function (field, rules, i, options) {
				//are not both populated
				if ((!options.firstOfGroup[0].value && options.secondOfGroup[0].value) || (options.firstOfGroup[0].value && !options.secondOfGroup[0].value)) {
					return options.allrules[rules[i]].alertText + options.allrules[rules[i]].alertText2;
				}
				//are not both dates
				if (!methods._isDateTime(options.firstOfGroup[0].value) || !methods._isDateTime(options.secondOfGroup[0].value)) {
					return options.allrules[rules[i]].alertText + options.allrules[rules[i]].alertText2;
				}
				//are both dates but range is off
				if (!methods._dateCompare(options.firstOfGroup[0].value, options.secondOfGroup[0].value)) {
					return options.allrules[rules[i]].alertText + options.allrules[rules[i]].alertText2;
				}
			},
			/**
			* Max number of checkbox selected
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_maxCheckbox: function(form, field, rules, i, options) {

				var nbCheck = rules[i + 1];
				var groupname = field.attr("name");
				var groupSize = form.find("input[name='" + groupname + "']:checked").size();
				if (groupSize > nbCheck) {
					options.showArrow = false;
					if (options.allrules.maxCheckbox.alertText2)
						 return options.allrules.maxCheckbox.alertText + " " + nbCheck + " " + options.allrules.maxCheckbox.alertText2;
					return options.allrules.maxCheckbox.alertText;
				}
			},
			/**
			* Min number of checkbox selected
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_minCheckbox: function(form, field, rules, i, options) {

				var nbCheck = rules[i + 1];
				var groupname = field.attr("name");
				var groupSize = form.find("input[name='" + groupname + "']:checked").size();
				if (groupSize < nbCheck) {
					options.showArrow = false;
					return options.allrules.minCheckbox.alertText + " " + nbCheck + " " + options.allrules.minCheckbox.alertText2;
				}
			},
			/**
			* Checks that it is a valid credit card number according to the
			* Luhn checksum algorithm.
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return an error string if validation failed
			*/
			_creditCard: function(field, rules, i, options) {
				//spaces and dashes may be valid characters, but must be stripped to calculate the checksum.
				var valid = false, cardNumber = field.val().replace(/ +/g, '').replace(/-+/g, '');

				var numDigits = cardNumber.length;
				if (numDigits >= 14 && numDigits <= 16 && parseInt(cardNumber) > 0) {

					var sum = 0, i = numDigits - 1, pos = 1, digit, luhn = new String();
					do {
						digit = parseInt(cardNumber.charAt(i));
						luhn += (pos++ % 2 == 0) ? digit * 2 : digit;
					} while (--i >= 0)

					for (i = 0; i < luhn.length; i++) {
						sum += parseInt(luhn.charAt(i));
					}
					valid = sum % 10 == 0;
				}
				if (!valid) return options.allrules.creditCard.alertText;
			},
			_chinaId: function(field, rules, i, options){
				var powers=new Array("7","9","10","5","8","4","2","1","6","3","7","9","10","5","8","4","2"),
					parityBit=new Array("1","0","X","9","8","7","6","5","4","3","2"),
					id=field.val(),
					_valid=false,
					validId18=function(_id){
						_id=_id+"";
						var _num=_id.substr(0,17);
						var _parityBit=_id.substr(17);
						var _power=0;
						for(var i=0;i< 17;i++){
							if(_num.charAt(i)<'0'||_num.charAt(i)>'9')
								return false;
							else
								_power+=parseInt(_num.charAt(i))*parseInt(powers[i]);
						}
						var mod=parseInt(_power)%11;
						if(parityBit[mod]==_parityBit)
							return true;
						return false;
					},
					validId15=function(_id){
						_id=_id+"";
						for(var i=0;i<_id.length;i++){
							if(_id.charAt(i)<'0'||_id.charAt(i)>'9')
								return false;
						}
						var year=_id.substr(6,2);
						var month=_id.substr(8,2);
						var day=_id.substr(10,2);
						var sexBit=_id.substr(14);
						if(year<'01'||year >'90')return false;
						if(month<'01'||month >'12')return false;
						if(day<'01'||day >'31')return false;
						return true;
					}
				if(id.length==15)
					_valid=validId15(id);
				else if(id.length==18)
					_valid=validId18(id);
				if(!_valid)
					return options.allrules.chinaId.alertText;
			},
			/**
			* Ajax field validation
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			*            user options
			* @return nothing! the ajax validator handles the prompts itself
			*/
			_ajax: function(field, rules, i, options) {
				var name=field.attr("name"),submit_t=0;
				 if (options.eventTrigger == "field") {
					delete(options.ajaxValidCache[name]);
				 }
				 if (options.eventTrigger == "submit"){
				 	submit_t=1
				 }

				 // If there is an error or if the the field is already validated, do not re-execute AJAX
				if ($.trim(field.val()).length&&!options.isError && !methods._checkAjaxFieldStatus(name, options)) {
					$.ajax({
						 url: rules[i + 1],
						 data: name+"="+field.val(),
						 error: function(data, transport) {
							if (options.onFailure) {
								options.onFailure(data, transport);
							} else {
								methods._ajaxError(data, transport);
							}
						 },
						 success: function(data) {
							var errorField = field.eq(0);
							if (data.status!="succ") {
							 	options.ajaxValidCache[name] = false;
							 	options.isError = true;
								if (options.showPrompts) methods._showPrompt(errorField, data.msg, "", true, options);
							} else {
								options.ajaxValidCache[name] = true;
								options.isError = false;
								if (options.showPrompts) methods._closePrompt(errorField);
								if (submit_t) field.closest("form").submit();
							}
							methods._handleStatusCssClasses(field, options);
							errorField.trigger("jqv.field.result", [errorField, options.isError, data.msg]);
						}
					});
					return "Checking...";
				}
			 },
			/**
			* Common method to handle ajax errors
			*
			* @param {Object} data
			* @param {Object} transport
			*/
			_ajaxError: function(data, transport) {
				if(data.status == 0 && transport == null)
					alert("The page is not served from a server! ajax call failed");
				else if(typeof console != "undefined")
					console.log("Ajax error: " + data.status + " " + transport);
			},
			/**
			* date -> string
			*
			* @param {Object} date
			*/
			_dateToString: function(date) {
				return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
			},
			/**
			* Parses an ISO date
			* @param {String} d
			*/
			_parseDate: function(d) {

				var dateParts = d.split("-");
				if(dateParts==d)
					dateParts = d.split("/");
				if(dateParts==d) {
					dateParts = d.split(".");
					return new Date(dateParts[2], (dateParts[1] - 1), dateParts[0]);
				}
				return new Date(dateParts[0], (dateParts[1] - 1) ,dateParts[2]);
			},
			/**
			* Builds or updates a prompt with the given information
			*
			* @param {jqObject} field
			* @param {String} promptText html text to display type
			* @param {String} type the type of bubble: 'pass' (green), 'load' (black) anything else (red)
			* @param {boolean} ajaxed - use to mark fields than being validated with ajax
			* @param {Map} options user options
			*/
			 _showPrompt: function(field, promptText, type, ajaxed, options, ajaxform) {
				//Check if we need to adjust what element to show the prompt on
				if(field.data('jqv-prompt-at') instanceof jQuery ){
					field = field.data('jqv-prompt-at');
				} else if(field.data('jqv-prompt-at')) {
					field = $(field.data('jqv-prompt-at'));
				}

				 var prompt = methods._getPrompt(field);
				 // The ajax submit errors are not see has an error in the form,
				 // When the form errors are returned, the engine see 2 bubbles, but those are ebing closed by the engine at the same time
				 // Because no error was found befor submitting
				 if(ajaxform) prompt = false;
				 // Check that there is indded text
				 if($.trim(promptText)){
					 if (prompt)
						methods._updatePrompt(field, prompt, promptText, type, ajaxed, options);
					 else
						methods._buildPrompt(field, promptText, type, ajaxed, options);
				}
			 },
			/**
			* Builds and shades a prompt for the given field.
			*
			* @param {jqObject} field
			* @param {String} promptText html text to display type
			* @param {String} type the type of bubble: 'pass' (green), 'load' (black) anything else (red)
			* @param {boolean} ajaxed - use to mark fields than being validated with ajax
			* @param {Map} options user options
			*/
			_buildPrompt: function(field, promptText, type, ajaxed, options) {

				// create the prompt
				var prompt = field.next();
				if(!prompt.is("span"))
					prompt=$('<span>').insertAfter(field);
				prompt.addClass(methods._getClassName(field.attr("id")) + "formError");
				prompt.addClass("parentForm"+methods._getClassName(field.closest('form, .validationEngineContainer').attr("id")));
				prompt.addClass("formError");

				switch (type) {
					case "pass":
						prompt.addClass("greenPopup");
						break;
					case "load":
						prompt.addClass("blackPopup");
						break;
					default:
						/* it has error  */
						//alert("unknown popup type:"+type);
				}
				prompt.html(promptText)

				if (options.addPromptClass)
					prompt.addClass(options.addPromptClass);

				// Add custom prompt class defined in element
				var requiredOverride = field.attr('data-required-class');
				if(requiredOverride !== undefined) {
					prompt.addClass(requiredOverride);
				} else {
					if(options.prettySelect) {
						if($('#' + field.attr('id')).next().is('select')) {
							var prettyOverrideClass = $('#' + field.attr('id').substr(options.usePrefix.length).substring(options.useSuffix.length)).attr('data-required-class');
							if(prettyOverrideClass !== undefined) {
								prompt.addClass(prettyOverrideClass);
							}
						}
					}
				}
				prompt.data("callerField", field);
				return prompt;
			},
			/**
			* Updates the prompt text field - the field for which the prompt
			* @param {jqObject} field
			* @param {String} promptText html text to display type
			* @param {String} type the type of bubble: 'pass' (green), 'load' (black) anything else (red)
			* @param {boolean} ajaxed - use to mark fields than being validated with ajax
			* @param {Map} options user options
			*/
			_updatePrompt: function(field, prompt, promptText, type, ajaxed, options, noAnimation) {
				prompt.html(promptText).addClass("formError");
			},
			/**
			* Closes the prompt associated with the given field
			*
			* @param {jqObject}
			*            field
			*/
			 _closePrompt: function(field) {
				var prompt = methods._getPrompt(field);
				if(prompt)
					prompt.html(prompt.data("pass")?prompt.data("pass"):"").removeClass("formError");
				else if(field.next().is("span"))
					field.next().html("")
			 },
			 closePrompt: function(field) {
				 return methods._closePrompt(field);
			 },
			/**
			* Returns the error prompt matching the field if any
			*
			* @param {jqObject}
			*            field
			* @return undefined or the error prompt (jqObject)
			*/
			_getPrompt: function(field) {
					var formId = $(field).closest('form, .validationEngineContainer').attr('id');
				var className = methods._getClassName(field.attr("id")) + "formError";
					var match = $("." + methods._escapeExpression(className) + '.parentForm' + methods._getClassName(formId))[0];
				if (match)
				return $(match);
			},
			/**
			  * Returns the escapade classname
			  *
			  * @param {selector}
			  *            className
			  */
			  _escapeExpression: function (selector) {
				  return selector.replace(/([#;&,\.\+\*\~':"\!\^$\[\]\(\)=>\|])/g, "\\$1");
			  },
			/**
			 * returns true if we are in a RTLed document
			 *
			 * @param {jqObject} field
			 */
			isRTL: function(field)
			{
				var $document = $(document);
				var $body = $('body');
				var rtl =
					(field && field.hasClass('rtl')) ||
					(field && (field.attr('dir') || '').toLowerCase()==='rtl') ||
					$document.hasClass('rtl') ||
					($document.attr('dir') || '').toLowerCase()==='rtl' ||
					$body.hasClass('rtl') ||
					($body.attr('dir') || '').toLowerCase()==='rtl';
				return Boolean(rtl);
			},
			/**
			* Saves the user options and variables in the form.data
			*
			* @param {jqObject}
			*            form - the form where the user option should be saved
			* @param {Map}
			*            options - the user options
			* @return the user options (extended from the defaults)
			*/
			 _saveOptions: function(form, options) {

				 // is there a language localisation ?
				 if ($.validationEngineLanguage)
				 var allRules = $.validationEngineLanguage.allRules;
				 else
				 $.error("jQuery.validationEngine rules are not loaded, plz add localization files to the page");
				 // --- Internals DO NOT TOUCH or OVERLOAD ---
				 // validation rules and i18
				 $.validationEngine.defaults.allrules = allRules;

				 var userOptions = $.extend(true,{},$.validationEngine.defaults,options);

				 form.data('jqv', userOptions);
				 return userOptions;
			 },

			 /**
			 * Removes forbidden characters from class name
			 * @param {String} className
			 */
			 _getClassName: function(className) {
				 if(className)
					 return className.replace(/:/g, "_").replace(/\./g, "_");
						  },
			/**
			 * Escape special character for jQuery selector
			 * http://totaldev.com/content/escaping-characters-get-valid-jquery-id
			 * @param {String} selector
			 */
			 _jqSelector: function(str){
				return str.replace(/([;&,\.\+\*\~':"\!\^#$%@\[\]\(\)=>\|])/g, '\\$1');
			},
			/**
			* Conditionally required field
			*
			* @param {jqObject} field
			* @param {Array[String]} rules
			* @param {int} i rules index
			* @param {Map}
			* user options
			* @return an error string if validation failed
			*/
			_condRequired: function(field, rules, i, options) {
				var idx, dependingField;

				for(idx = (i + 1); idx < rules.length; idx++) {
					dependingField = jQuery("#" + rules[idx]).first();

					/* Use _required for determining wether dependingField has a value.
					 * There is logic there for handling all field types, and default value; so we won't replicate that here
					 * Indicate this special use by setting the last parameter to true so we only validate the dependingField on chackboxes and radio buttons (#462)
					 */
					if (dependingField.length && methods._required(dependingField, ["required"], 0, options, true) == undefined) {
						/* We now know any of the depending fields has a value,
						 * so we can validate this field as per normal required code
						 */
						return methods._required(field, ["required"], 0, options);
					}
				}
			},

			_submitButtonClick: function(event) {
				var button = $(this);
				var form = button.closest('form, .validationEngineContainer');
				form.data("jqv_submitButton", button.attr("id"));
			}
			  };

		 /**
		 * Plugin entry point.
		 * You may pass an action as a parameter or a list of options.
		 * if none, the init and attach methods are being called.
		 * Remember: if you pass options, the attached method is NOT called automatically
		 *
		 * @param {String}
		 *            method (optional) action
		 */
		 $.fn.validationEngine = function(method) {

			 var form = $(this);
			 if(!form[0]) return form;  // stop here if the form does not exist

			 if (typeof(method) == 'string' && method.charAt(0) != '_' && methods[method]) {

				 // make sure init is called once
				 if(method != "showPrompt" && method != "hide" && method != "hideAll")
				 methods.init.apply(form);

				 return methods[method].apply(form, Array.prototype.slice.call(arguments, 1));
			 } else if (typeof method == 'object' || !method) {

				 // default constructor with or without arguments
				 methods.init.apply(form, arguments);
				 return methods.attach.apply(form);
			 } else {
				 $.error('Method ' + method + ' does not exist in jQuery.validationEngine');
			 }
		};



		// LEAK GLOBAL OPTIONS
		$.validationEngine= {fieldIdCounter: 0,defaults:{

			// Name of the event triggering field validation
			validationEventTrigger: "blur",
			// Automatically scroll viewport to the first error
			scroll: true,
			// Focus on the first input
			focusFirstField:true,
			// Show prompts, set to false to disable prompts
			showPrompts: true,
			// Should we attempt to validate non-visible input fields contained in the form? (Useful in cases of tabbed containers, e.g. jQuery-UI tabs)
			validateNonVisibleFields: false,
			// Opening box position, possible locations are: topLeft,
			// topRight, bottomLeft, centerRight, bottomRight, inline
			// inline gets inserted after the validated field or into an element specified in data-prompt-target
			promptPosition: "inline",
			bindMethod:"bind",
			// internal, automatically set to true when it parse a _ajax rule
			inlineAjax: false,
			// Stops form from submitting and execute function assiciated with it
			onValidationComplete: false,

			// Used when you have a form fields too close and the errors messages are on top of other disturbing viewing messages
			doNotShowAllErrosOnSubmit: false,
			// Object where you store custom messages to override the default error messages
			custom_error_messages:{},
			// true if you want to vind the input fields
			binded: true,
			// set to true, when the prompt arrow needs to be displayed
			showArrow: true,
			// did one of the validation fail ? kept global to stop further ajax validations
			isError: false,
			// Limit how many displayed errors a field can have
			maxErrorsPerField: false,

			// Caches field validation status, typically only bad status are created.
			// the array is used during ajax form validation to detect issues early and prevent an expensive submit
			ajaxValidCache: {},
			// Auto update prompt position after window resize
			autoPositionUpdate: false,

			InvalidFields: [],
			onFieldSuccess: false,
			onFieldFailure: false,
			onSuccess: false,
			onFailure: false,
			validateAttribute: "data-v",
			addSuccessCssClassToField: "v_pass",
			addFailureCssClassToField: "v_error",

			// Auto-hide prompt
			autoHidePrompt: false,
			// Delay before auto-hide
			autoHideDelay: 10000,
			// Fade out duration while hiding the validations
			fadeDuration: 0.3,
			// Use Prettify select library
			prettySelect: false,
			// Add css class on prompt
			addPromptClass : "",
			// Custom ID uses prefix
			usePrefix: "",
			// Custom ID uses suffix
			useSuffix: "",
			// Only show one message per error prompt
			showOneMessage: false
		}};
	})(jQuery);
});