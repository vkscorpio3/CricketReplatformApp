var _birthdateVerify;var _creditExpiryVerify=false;var _creditExpiryVerifyAutoBill=false;$(function(){function t(){$(".error-container").css("visibility","visible");$("#shipping-method-po-box").hide();if($(".section-checkout").hasClass("new")){a(true)}if($("a.btn-checkout-step-1").length>0){$("a.btn-checkout-step-1").css("display","inline-block");$("a.btn-checkout-step-1").next().css("display","none")}if($("a.btn-checkout-step-2").length>0){$("a.btn-checkout-step-2").css("display","inline-block");$("a.btn-checkout-step-2").next().css("display","none")}if($("a#btn-checkout-step-3-top").length>0){$("a#btn-checkout-step-3-top").css("display","inline-block");$("a#btn-checkout-step-3-top").next().css("display","none")}$("a.btn-checkout-step-1").click(function(e){e.preventDefault();var t=$("#month").children("option:selected").val();var n=$("#day").children("option:selected").val();var r=$("#year").children("option:selected").val();u(t,n,r);var i=$("#customer-info").valid();if(i){$(this).css("display","none");$(this).next().css("display","inline-block")}$("#customer-info").submit()});$("a.btn-checkout-step-2").click(function(e){e.preventDefault();n();var t=$("#payment-info").valid();if(t){$(this).css("display","none");$(this).next().css("display","inline-block")}$("#payment-info").submit()});$("a#btn-checkout-step-3-top, a#btn-checkout-step-3-bottom").click(function(e){e.preventDefault();$(this).css("display","none");$(this).next().css("display","inline-block");$("#customer-info").submit()});$("#customer-info").validate({onkeyup:false,onfocusout:false,rules:{"first-name":{required:true},"first-name-shipping-address":{required:true},"first-name-billing-address":{required:true},"last-name":{required:true},"last-name-shipping-address":{required:true},"last-name-billing-address":{required:true},address:{required:true,poBox:true},"address-shipping-address":{required:true,poBox:true},"address-billing-address":{required:true,poBox:true},phone:{required:true,phoneUS:true},email:{required:true,email:true},month:{required:true,birthdate:true},day:{required:true,birthdate:true},year:{required:true,birthdate:true}},messages:{"first-name":"<p>Please enter a first name.</p>","first-name-shipping-address":"<p>Please enter a first name under shipping address.</p>","first-name-billing-address":"<p>Please enter a first name under billing address.</p>","last-name":"<p>Please enter a last name.</p>","last-name-shipping-address":"<p>Please enter a last name under shipping address.</p>","last-name-billing-address":"<p>Please enter a last name under billing address.</p>",address:"<p>Please check your address or PO Box.</p>","address-shipping-address":"<p>Please check your address or PO Box under shipping address.</p>","address-billing-address":"<p>Please check your address or PO Box under billing address.</p>",phone:"<p>Please check your phone number.</p>",email:"<p>Please check your email address.</p>",month:"<p>Please check your birthday month.</p>",day:"<p>Please check your birthday day.</p>",year:"<p>Please check your birthday year.</p>"},success:"valid",errorLabelContainer:".error-container",errorPlacement:function(e,t){e.appendTo(".error-container");$(".error-container").show()}});$("#payment-info").validate({onkeyup:false,onfocusout:false,rules:{"first-name":{required:true},"first-name-auto-bill":{required:true},"last-name":{required:true},"last-name-auto-bill":{required:true},creditcard:{nowhitespace:true,validcreditcard:true,required:true,digits:true},"creditcard-auto-bill":{nowhitespace:true,validcreditcard:true,required:true,digits:true},month:{required:true,validexpiry:true},monthAbp:{required:true,validexpiryautobill:true},"different-payment-info":{required:true},"day-auto-bill":{required:true},year:{required:true,validexpiry:true},yearAbp:{required:true,validexpiryautobill:true},cvcnumber:{required:true,digits:true,minlength:3,maxlength:4},"cvcnumber-auto-bill":{required:true,digits:true,minlength:3,maxlength:4},terms:{required:true}},success:"valid",messages:{"first-name":"<p>Please enter a first name.</p>","first-name-auto-bill":"<p>Please enter a first name under auto bill.</p>","last-name":"<p>Please enter a last name.</p>","last-name-auto-bill":"<p>Please enter a last name under auto bill.</p>",creditcard:{required:"<p>Please enter your credit card number.</p>"},"creditcard-auto-bill":{},month:"<p>Please check your credit card expiry month.</p>",year:"<p>Please check your credit card expiry year.</p>",monthAbp:"<p>Please check your credit card expiry month.</p>",yearAbp:"<p>Please check your credit card expiry year.</p>",cvcnumber:"<p>Your cvc number should be 3 to 4 digits.</p>","cvcnumber-auto-bill":"<p>Your cvc number should be 3 to 4 digits under auto bill.</p>",terms:"<p>Please accept the Automatic Bill Pay terms & conditions.</p>"},success:function(e){},errorLabelContainer:".error-container",errorPlacement:function(e,t){if(t.attr("name")=="terms"){$("span.terms").addClass("error")}e.appendTo(".error-container");$(".error-container").show()}})}function n(){var e=$("#month").children("option:selected").val();var t=$("#year").children("option:selected").val();r(e,t,false);var n=$("#monthAbp").children("option:selected").val();var i=$("#yearAbp").children("option:selected").val();if($("#different-payment-info").css("display")!="none"){r(n,i,true)}}function r(e,t,n){var e=e;var t=t;var n=n;if(e!=undefined&&t!=undefined){var r=new Date;var i=r.getMonth()+1;var s=r.getFullYear();var o;if(s==t){if(i==e){o=true}else if(i>e){o=false}}else if(s>t){o=false}else if(s<t){o=true}if(n){_creditExpiryVerifyAutoBill=o}else{_creditExpiryVerify=o}}}function i(){$("#address").on("input",function(e){var t=$("different-shipping-address");if(t.length>0)return;s(e)});$("#address-shipping-address").on("input",function(e){s(e)});$("#address").on("propertychange",function(e){var t=$("different-shipping-address");if(t.length>0)return;s(e)});$("#address-shipping-address").on("propertychange",function(e){s(e)})}function s(e,t){var n;if(t){n=t}else{n=e.target.value}var r=/(^p\.?\s?o\.?\s?b\.?(ox|in)?(\s|[0-9])|post\soffice\s?b\.?(ox|in))/i;if(n.match(r)){$("#shipping-method-free").hide();$("#shipping-method-po-box").show()}else{$("#shipping-method-free").show();$("#shipping-method-po-box").hide()}}function o(){_birthdateVerify=false;var e=$("#month").children("option:selected").val();var t=$("#day").children("option:selected").val();var n=$("#year").children("option:selected").val();u(e,t,n)}function u(e,t,n){var e=e;var t=t;var n=n;if(e!=undefined&&t!=undefined&&n!=undefined){var r=new Date(n,e,t);var i=new Date;var s=i.getMonth();var o=i.getDate();var u=i.getFullYear();var a=u+"/"+s+"/"+o;var f=Date.parse(a);var l=n+"/"+e+"/"+t;var c=Date.parse(l);_birthdateVerify=r.getFullYear()==n&&r.getMonth()==e&&r.getDate()==t;if(c>=f){_birthdateVerify=false}else if(c<f){}}}function a(e){if(!e){$("#payment-terms").removeClass("disabled");$(".scroll-area").removeClass("disabled")}else{$("#payment-terms").addClass("disabled");$(".scroll-area").addClass("disabled");$("span.cc-end-number").html("");$("span.checkbox").removeClass("error")}if(!$("#constructor").hasClass("existing")){$("terms").disabled=e}}function f(){$("#first-name, #last-name, #cardNumber, #cvcnumber, .form-element").on("blur",function(e){if($(".section-checkout").hasClass("step2")){l()}});$("#month, #year").on("click change",function(e){if($(".section-checkout").hasClass("step2")){l()}});var t=this;$('input[type="radio"]').on("click change",function(t){if(this.id=="autopay-payment-2"){e=true;a(true)}else if(this.id=="autopay-payment-1"){e=false;l()}})}function l(){function r(){for(var e=0;e<n.length;e++){var t;if(n[e]>0){t=true}else{t=false;return false}}if(t){return true}else{return false}}function i(){var t=$("#month").children("option:selected").val();var n=$("#year").children("option:selected").val();var r=$("#monthAbp").children("option:selected").val();var i=$("#yearAbp").children("option:selected").val();if(t&&n&&!e||r&&i&&e){return true}else{return false}}var t;var n=[];$("#payment-info input.form-element").each(function(t,r){if(e){if(t<8&&t>4){n.push(r.value.length)}}else{if(t<4){n.push(r.value.length)}}});if(r()&&i()){var s;if(e){s=$("#cardNumberAbp").val()}else{s=$("#cardNumber").val()}var o=s.length;var u=s.slice(o-4,o);$("span.cc-end-number").html(u);a(false)}}function c(){var e;$("a.open-drawer").on("click",function(t){t.preventDefault();var n=".drawer-"+$(this).data("drawerId");if($(n).hasClass("active")){$(e).removeClass("active").removeClass("open").addClass("closed");e=null;return}if(e){if($(n).hasClass("closed")){$(e).removeClass("active").removeClass("open").addClass("closed");e=n;$(n).removeClass("closed").addClass("open").addClass("active")}}else{e=n;$(n).removeClass("closed").addClass("open").addClass("active")}})}function h(){$("a.open-summary-drawer").on("click",function(e){e.preventDefault();if($(".summary-drawer").hasClass("closed")){$(".summary-drawer").removeClass("closed").addClass("open");$(".open-summary-drawer").parent(".title").addClass("active")}else{$(".summary-drawer").removeClass("open").addClass("closed");$(".open-summary-drawer").parent(".title").removeClass("active")}})}function p(){$("#different-shipping-address").hide();$("#address1").next(".radio").on("click",function(e){$("#different-shipping-address").hide();if($("#address").val()){s(null,$("#address").val())}});$("#address2").next(".radio").on("click",function(e){$("#different-shipping-address").show()})}function d(){$("#different-billing-address").hide();$("#billing-address1, #billing-address2").next(".radio").on("click",function(e){$("#different-billing-address").hide()});$("#billing-address3").next(".radio").on("click",function(e){$("#different-billing-address").show()})}function v(){$("#different-payment-info").hide();$("#autopay-payment-1, #autopay-payment-3").next(".radio").on("click",function(e){$("#different-payment-info").hide();$("#payment-terms").show();$(".autopay p").show()});$("#autopay-payment-3").next(".radio").on("click",function(e){$("#payment-terms").hide();$(".autopay p").hide()});$("#autopay-payment-2").next(".radio").on("click",function(e){$("#different-payment-info").show();$("#payment-terms").show();$(".autopay p").show()})}function m(){var e=$("#state").children("option:selected").val();$("#city, #zipcode").focus(function(){g(this);$(this).blur()});$("#state").on("click change",function(){var t=$("#state").children("option:selected").val();if(t){var n=$("#state").children("option:selected").val();$(".state").val(e);Foundation.libs.forms.refresh_custom_select($(".state"),true)}g(this,t)})}function g(e,t){var n='<div class="modal"><div class="dialog-content"><h2>Are you sure you want to change your location?</h2><p>If yes, your cart will be emptied and you will have to start again.</p><a href="#" class="button small orange" data-confirm="no">No</a><a href="#" class="button small green" data-confirm="yes">Yes, empty my cart</a></div></div>';$("#outer-wrap").before(n);var r='<div class="md-overlay"></div>';$("#outer-wrap").after(r);var i=e;$(".dialog-content a.button").on("click",function(e){e.preventDefault();var t=$(this).attr("data-confirm");if(t=="yes"){$("#clear-cart").submit();$(".modal, .md-overlay").remove()}else{$(".modal, .md-overlay").remove()}})}function y(e){var t=/(^p\.?\s?o\.?\s?b\.?(ox|in)?(\s|[0-9])|post\soffice\s?b\.?(ox|in))/i;var n=/(^p\.?\s?o\.?\s?b\.?(ox|in)?(\s[0-9])|^post\soffice\s?b\.?(ox|in)?(\s[0-9]))/i;if(e.match(t)){if(e.match(n)){$("#notification-po-box").foundation("reveal","open");return true}return false}else{if(e.length>6){return true}}}var e=false;if($("#constructor").hasClass("section-checkout")){$("#li-cart a, li.cart-icon").unbind("click");$("#li-cart a, li.cart-icon").addClass("no-toggle")}else{$("#li-cart a, li.cart-icon").removeClass("no-toggle")}$("#li-cart a, li.cart-icon").click(function(){if($(this).hasClass("no-toggle")){}});$("#promo-value").click(function(e){e.preventDefault();if($("#promo-code").val()){$("#promo-code").removeClass().addClass("error");$(".promo-error").css("visibility","visible")}else{$("#promo-code").removeClass();$(".promo-error").css("visibility","hidden")}});if($("#constructor").hasClass("section-checkout")){$(".error-container").hide();t();h();p();d();v();m();i();o();f();a(true);$("#address").change(function(){y($(this).val())})}})