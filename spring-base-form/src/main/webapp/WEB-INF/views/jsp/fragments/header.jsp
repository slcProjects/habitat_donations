<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<spring:url value="/" var="urlHome" />
<spring:url value="/users/add" var="urlAddUser" />

<!--****************** changes made by Alex Change_2 **************************-->
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="UTF-8">

<!-- Mobile Specific Metas
	================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Habitat for Humanity - Kingston Limestone Region</title>
<link rel="dns-prefetch" href="//fonts.googleapis.com">
<link rel="dns-prefetch" href="//s.w.org">
<script id="facebook-jssdk"
	src="//connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v2.4&amp;appId=767822170065914"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.3\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.3\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/habitatkingston.com\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.8.3"}};
			!function(a,b,c){function d(a){var b,c,d,e,f=String.fromCharCode;if(!k||!k.fillText)return!1;switch(k.clearRect(0,0,j.width,j.height),k.textBaseline="top",k.font="600 32px Arial",a){case"flag":return k.fillText(f(55356,56826,55356,56819),0,0),b=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,56826,8203,55356,56819),0,0),c=j.toDataURL(),b!==c&&(k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447),0,0),b=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447),0,0),c=j.toDataURL(),b!==c);case"emoji4":return k.fillText(f(55358,56794,8205,9794,65039),0,0),d=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55358,56794,8203,9794,65039),0,0),e=j.toDataURL(),d!==e}return!1}function e(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g,h,i,j=b.createElement("canvas"),k=j.getContext&&j.getContext("2d");for(i=Array("flag","emoji4"),c.supports={everything:!0,everythingExceptFlag:!0},h=0;h<i.length;h++)c.supports[i[h]]=d(i[h]),c.supports.everything=c.supports.everything&&c.supports[i[h]],"flag"!==i[h]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[i[h]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
<script
	src="https://habitatkingston.com/wp-includes/js/wp-emoji-release.min.js?ver=4.8.3"
	type="text/javascript" defer=""></script>
<style type="text/css">
img.wp-smiley, img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" id="contact-form-7-css"
	href="https://habitatkingston.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=4.9"
	type="text/css" media="all">
<link rel="stylesheet" id="events-manager-css"
	href="https://habitatkingston.com/wp-content/plugins/events-manager/includes/css/events_manager.css?ver=5.7"
	type="text/css" media="all">
<link rel="stylesheet" id="events-manager-pro-css"
	href="https://habitatkingston.com/wp-content/plugins/events-manager-pro/includes/css/events-manager-pro.css?ver=2.51"
	type="text/css" media="all">
<link rel="stylesheet" id="rs-plugin-settings-css"
	href="https://habitatkingston.com/wp-content/plugins/revslider/public/assets/css/settings.css?ver=5.3.1.5"
	type="text/css" media="all">
<style id="rs-plugin-settings-inline-css" type="text/css">
#rs-demo-id {
	
}
</style>
<link rel="stylesheet" id="spacexchimp_p005-frontend-css-css"
	href="https://habitatkingston.com/wp-content/plugins/social-media-buttons-toolbar/inc/css/frontend.css?ver=4.8.3"
	type="text/css" media="all">
<style id="spacexchimp_p005-frontend-css-inline-css" type="text/css">
.smbt-social-icons {
	text-align: center !important;
}

.smbt-social-icons li img {
	width: 64px !important;
	height: 64px !important;
	margin: 5px !important;
}
</style>
<link rel="stylesheet" id="spacexchimp_p005-bootstrap-tooltip-css-css"
	href="https://habitatkingston.com/wp-content/plugins/social-media-buttons-toolbar/inc/lib/bootstrap-tooltip/bootstrap-tooltip.css?ver=4.8.3"
	type="text/css" media="all">
<link rel="stylesheet" id="boc-grid-css"
	href="https://habitatkingston.com/wp-content/themes/fortuna/stylesheets/grid.css?ver=4.8.3"
	type="text/css" media="all">
<link rel="stylesheet" id="boc-icon-css"
	href="https://habitatkingston.com/wp-content/themes/fortuna/stylesheets/icons.css?ver=4.8.3"
	type="text/css" media="all">
<link rel="stylesheet" id="js_composer_front-css"
	href="https://habitatkingston.com/wp-content/plugins/js_composer/assets/css/js_composer.min.css?ver=5.2.1"
	type="text/css" media="all">
<link rel="stylesheet" id="boc-main-styles-css"
	href="https://habitatkingston.com/wp-content/themes/fortuna-child/style.css?ver=4.8.3"
	type="text/css" media="all">
<link rel="stylesheet" id="boc-animation-styles-css"
	href="https://habitatkingston.com/wp-content/themes/fortuna/stylesheets/animations.css?ver=4.8.3"
	type="text/css" media="all">
<style id="boc-animation-styles-inline-css" type="text/css">
/* Custom Background for: Home */
body {
	background:;
	background-size: cover;
}

#menu>ul>li>a {
	font-family: 'Helvetica', Montserrat, Arial, Helvetica, sans-serif;
}

#menu>ul>li>a {
	font-size: 20px;
}

#menu>ul>li>a {
	font-weight: 600;
}

#menu>ul>li>a {
	text-transform: none;
}

#menu>ul>li ul>li>a {
	font-family: 'Helvetica', Montserrat, Arial, Helvetica, sans-serif;
}

#menu>ul>li ul>li>a {
	font-size: 16px;
}

#menu>ul>li ul>li>a {
	font-weight: 600;
}

#menu>ul>li ul>li>a {
	text-transform: none;
}

h1, h2, h3, h4, h5, h6, .title, .heading_font, .counter-digit, .htabs a,
	.woocommerce-page div.product .woocommerce-tabs ul.tabs li {
	font-family: 'Helvetica', Montserrat, Arial, Helvetica, sans-serif;
}

h1, h2, h3, h4, h5, h6, .title, .heading_font, .counter-digit, .htabs a,
	.woocommerce-page div.product .woocommerce-tabs ul.tabs li {
	text-transform: none;
}

h1, h2, h3, h4, h5, h6, .title, .heading_font, .counter-digit, .htabs a,
	.woocommerce-page div.product .woocommerce-tabs ul.tabs li {
	letter-spacing: 0em;
}

body, .body_font, .body_font h1, .body_font h2, .body_font h3,
	.body_font h4, .body_font h5 {
	font-family: 'Helvetica', Arial, Helvetica, sans-serif;
}

.button, a.button, button, input[type='submit'], input[type='reset'],
	input[type='button'] {
	font-family: 'Helvetica', Arial, Helvetica, sans-serif;
}

.button, a.button, button, input[type='submit'], input[type='reset'],
	input[type='button'] {
	text-transform: lowercase;
}

@media only screen and (min-width: 1018px) {
	#menu>ul>li>a, #header .header_cart .icon {
		line-height: 66px;
	}
	.header_cart .widget_shopping_cart {
		top: 66px;
	}
	#menu>ul>li.boc_nav_button {
		height: 66px;
	}
	#logo .logo_img {
		height: 70px;
	}
	#boc_searchform_close {
		top: 24px;
	}
}

#header.scrolled {
	background: rgba(136, 139, 141, 0.8);
}

@media only screen and (min-width: 1018px) {
	#header.scrolled #menu>ul>li>a, #header.scrolled .header_cart .icon {
		line-height: 41px;
	}
	#header.scrolled .header_cart .widget_shopping_cart {
		top: 41px;
	}
	#header.scrolled #menu>ul>li.boc_nav_button {
		height: 41px;
	}
	#header.scrolled #logo .logo_img {
		height: 45px;
	}
	#header.scrolled #boc_searchform_close {
		top: 12px;
	}
}

#menu>ul>li>a, #header .header_cart a.icon {
	color: #ffffff;
}

#menu>ul>li.boc_nav_button a {
	color: #ffffff;
	border: 2px solid #ffffff;
}

#menu>ul>li:not (.boc_nav_button ):hover>a, #header .header_cart li a.icon:hover
	{
	color: #000000;
}

#menu>ul>li.boc_nav_button a:hover {
	background: #000000;
	border: 2px solid #000000;
}

.main_menu_underline_effect #menu>ul>li>a:after {
	background-color: #000000;
}

.custom_menu_1 #menu>ul>li div {
	border-top: 2px solid #00afd7;
}

.custom_menu_2 #menu>ul>li div {
	border-top: 2px solid #00afd7;
}

.custom_menu_3 #menu>ul>li div {
	border-top: 2px solid #00afd7;
}

.custom_menu_3 #menu>ul>li ul>li>a:hover {
	background-color: #00afd7;
}

.custom_menu_4 #menu>ul>li div {
	border-top: 2px solid #00afd7;
}

.custom_menu_4 #menu>ul>li ul>li>a:hover {
	background-color: #00afd7;
}

.custom_menu_5 #menu>ul>li ul>li>a:hover {
	background-color: #00afd7;
}

.custom_menu_5 #menu>ul>li:hover>a {
	border-top: 2px solid #00afd7;
}

.custom_menu_6 #menu>ul>li ul>li>a:hover {
	background-color: #00afd7;
}

.custom_menu_6 #menu>ul>li:not (.boc_nav_button ):hover>a {
	border-top: 2px solid #00afd7;
}

a:hover, a:focus, .post_content a:not (.button ), .post_content a:not (.button
	 ):visited, .post_content .wpb_widgetised_column a:not (.button ):hover
	{
	color: #c4d600;
}

.post_content .wpb_widgetised_column .side_bar_menu a:not (.button ):hover
	{
	color: #333;
}

.boc_preloader_icon:before {
	border-color: #c4d600 rgba(0, 0, 0, 0) rgba(0, 0, 0, 0);
}

.dark_links a:hover, .white_links a:hover, .dark_links a:hover h2,
	.dark_links a:hover h3 {
	color: #c4d600 !important;
}

.side_icon_box h3 a:hover, .post_content .team_block h4 a:hover,
	.team_block .team_icons a:hover {
	color: #c4d600;
}

.button:hover, a:hover.button, button:hover, input[type="submit"]:hover,
	input[type="reset"]:hover, input[type="button"]:hover, .btn_theme_color,
	a.btn_theme_color {
	color: #fff;
	background-color: #c4d600;
}

input.btn_theme_color, a.btn_theme_color, .btn_theme_color {
	color: #fff;
	background-color: #c4d600;
}

.btn_theme_color:hover, input.btn_theme_color:hover, a:hover.btn_theme_color
	{
	color: #fff;
	background-color: #444444;
}

input.btn_theme_color.btn_outline, a.btn_theme_color.btn_outline,
	.btn_theme_color.btn_outline {
	color: #c4d600 !important;
	border: 2px solid #c4d600;
}

input.btn_theme_color.btn_outline:hover, a.btn_theme_color.btn_outline:hover,
	.btn_theme_color.btn_outline:hover {
	background-color: #c4d600 !important;
}

#boc_searchform_close:hover {
	color: #c4d600;
}

.section_big_title h1 strong, h1 strong, h2 strong, h3 strong, h4 strong,
	h5 strong {
	color: #c4d600;
}

.top_icon_box h3 a:hover {
	color: #c4d600;
}

.htabs a.selected {
	border-top: 2px solid #c4d600;
}

.resp-vtabs .resp-tabs-list li.resp-tab-active {
	border-left: 2px solid #c4d600;
}

.minimal_style.horizontal .resp-tabs-list li.resp-tab-active,
	.minimal_style.resp-vtabs .resp-tabs-list li.resp-tab-active {
	background: #c4d600;
}

#s:focus {
	border: 1px solid #c4d600;
}

.breadcrumb a:hover {
	color: #c4d600;
}

.tagcloud a:hover {
	background-color: #c4d600;
}

.month {
	background-color: #c4d600;
}

.small_month {
	background-color: #c4d600;
}

.post_meta a:hover {
	color: #c4d600;
}

.horizontal .resp-tabs-list li.resp-tab-active {
	border-top: 2px solid #c4d600;
}

.resp-vtabs li.resp-tab-active {
	border-left: 2px solid #c4d600;
}

#portfolio_filter {
	background-color: #c4d600;
}

#portfolio_filter ul li div:hover {
	background-color: #c4d600;
}

.portfolio_inline_filter ul li div:hover {
	background-color: #c4d600;
}

.counter-digit {
	color: #c4d600;
}

.tp-caption a:hover {
	color: #c4d600;
}

.more-link1:before {
	color: #c4d600;
}

.more-link2:before {
	background: #c4d600;
}

.image_featured_text .pos {
	color: #c4d600;
}

.side_icon_box .icon_feat i.icon {
	color: #c4d600;
}

.side_icon_box .icon_feat.icon_solid {
	background-color: #c4d600;
}

.boc_list_item .li_icon i.icon {
	color: #c4d600;
}

.boc_list_item .li_icon.icon_solid {
	background: #c4d600;
}

.top_icon_box.type1 .icon_holder .icon_bgr {
	background-color: #c4d600;
}

.top_icon_box.type1:hover .icon_holder .icon_bgr {
	border: 2px solid #c4d600;
}

.top_icon_box.type1 .icon_holder .icon_bgr:after, .top_icon_box.type1:hover .icon_holder .icon_bgr:after
	{
	border: 2px solid #c4d600;
}

.top_icon_box.type1:hover .icon_holder i {
	color: #c4d600;
}

.top_icon_box.type2 .icon_holder .icon_bgr {
	background-color: #c4d600;
}

.top_icon_box.type2:hover .icon_holder .icon_bgr {
	background-color: #fff;
}

.top_icon_box.type2:hover .icon_holder i {
	color: #c4d600;
}

.top_icon_box.type3 .icon_holder .icon_bgr:after {
	border: 2px solid #c4d600;
}

.top_icon_box.type3:hover .icon_holder .icon_bgr {
	background-color: #c4d600;
}

.top_icon_box.type3:hover .icon_holder .icon_bgr:after {
	border: 2px solid #c4d600;
}

.top_icon_box.type3 .icon_holder i {
	color: #c4d600;
}

.top_icon_box.type3:hover .icon_holder i {
	color: #fff;
}

.top_icon_box.type4:hover .icon_holder .icon_bgr {
	border: 2px solid #c4d600;
}

.top_icon_box.type4:hover .icon_holder .icon_bgr:after {
	border: 3px solid #c4d600;
}

.top_icon_box.type4 .icon_holder i {
	color: #c4d600;
}

.top_icon_box.type4:hover .icon_holder i {
	color: #c4d600;
}

.top_icon_box.type5 .icon_holder i {
	color: #c4d600;
}

.top_icon_box.type5:hover .icon_holder i {
	color: #c4d600;
}

a .pic_info.type11 .plus_overlay {
	border-bottom: 50px solid rgba(196, 214, 0, 0.8);
}

a:hover .pic_info.type11 .plus_overlay {
	border-bottom: 1000px solid rgba(196, 214, 0, 0.8);
}

a .pic_info.type12 .img_overlay_icon, a:hover .pic_info.type12 .img_overlay_icon
	{
	background: rgba(196, 214, 0, 0.8);
}

h2.title strong {
	color: #c4d600;
}

ul.theme_color_ul li:before {
	color: #c4d600;
}

.custom_slides.nav_design_1 .cs_nav_item.active .cs_nav_icon i.icon {
	color: #c4d600;
}

.custom_slides.nav_style_1.nav_design_1 .cs_nav_item:hover .cs_nav_icon i.icon,
	.custom_slides.nav_style_1.nav_design_2 .cs_nav_item:hover .cs_nav_icon i.icon
	{
	color: #c4d600;
}

.custom_slides.nav_design_2 .cs_nav_item.active .cs_nav_icon {
	background: #c4d600;
}

.cs_nav_item.has_no_text:hover .cs_nav_icon i.icon {
	color: #c4d600;
}

.custom_slides.nav_style_2 .cs_txt {
	color: #c4d600;
}

.acc_control, .active_acc .acc_control, .acc_holder.with_bgr .active_acc .acc_control
	{
	background-color: #c4d600;
}

.text_box.left_border {
	border-left: 3px solid #c4d600;
}

.owl-theme .owl-controls .owl-nav div {
	background: #c4d600;
}

.owl-theme .owl-dots .owl-dot.active span {
	background: #c4d600;
}

.img_slider.owl-theme .owl-controls .owl-nav div:not (.disabled ):hover
	{
	background: #c4d600;
}

.testimonial_style_big.owl-theme .owl-controls .owl-nav div:hover,
	.posts_carousel_holder.owl_side_arrows .owl-theme .owl-controls .owl-nav div:hover,
	.img_carousel_holder.owl_side_arrows .owl-theme .owl-controls .owl-nav div:hover,
	.content_slides_arrowed.owl-theme .owl-controls .owl-nav div:hover,
	.portfolio_carousel_holder.owl_side_arrows .owl-theme .owl-controls .owl-nav div:hover
	{
	color: #c4d600;
}

.boc_text_slider_word, .boc_text_slider_word_start {
	background: #c4d600;
}

.post_item_block.boxed .pic {
	border-bottom: 3px solid #c4d600;
}

.team_block .team_desc {
	color: #c4d600;
}

.bar_graph span, .bar_graph.thin_style span {
	background-color: #c4d600;
}

.pagination .links a:hover {
	background-color: #c4d600;
}

.hilite {
	background: #c4d600;
}

.price_column.price_column_featured ul li.price_column_title {
	background: #c4d600;
}

blockquote {
	border-left: 3px solid #c4d600;
}

.text_box.left_border {
	border-left: 3px solid #c4d600;
}

.fortuna_table tr:hover td {
	background: rgba(196, 214, 0, 0.08);
}

.header_cart ul.cart_list li a, .header_cart ul.product_list_widget li a
	{
	color: #c4d600;
}

.header_cart .cart-notification {
	background-color: #c4d600;
}

.header_cart .cart-notification:after {
	border-bottom-color: #c4d600;
}

.woocommerce .product_meta a {
	color: #c4d600;
}

.woocommerce a.button, .woocommerce button.button, .woocommerce input.button,
	.woocommerce #respond input#submit, .woocommerce #content input.button,
	.woocommerce-page a.button, .woocommerce-page button.button,
	.woocommerce-page input.button, .woocommerce-page #respond input#submit,
	.woocommerce-page #content input.button {
	background-color: #c4d600 !important;
}

.header_cart .cart-wrap {
	background-color: #c4d600;
}

.header_cart .cart-wrap:before {
	border-color: transparent #c4d600 transparent;
}

.woocommerce .widget_price_filter .ui-slider .ui-slider-range,
	.woocommerce-page .widget_price_filter .ui-slider .ui-slider-range {
	background-color: #c4d600 !important;
}

.woocommerce nav.woocommerce-pagination ul li a:hover, .woocommerce nav.woocommerce-pagination ul li a:focus,
	.woocommerce #content nav.woocommerce-pagination ul li a:hover,
	.woocommerce #content nav.woocommerce-pagination ul li a:focus,
	.woocommerce-page nav.woocommerce-pagination ul li a:hover,
	.woocommerce-page nav.woocommerce-pagination ul li a:focus,
	.woocommerce-page #content nav.woocommerce-pagination ul li a:hover,
	.woocommerce-page #content nav.woocommerce-pagination ul li a:focus {
	background-color: #c4d600 !important;
}

.info h2 {
	background-color: #c4d600;
}

#footer a:hover {
	color: #c4d600;
}

a .pic_info.type1 .plus_overlay {
	border-bottom: 50px solid rgba(196, 214, 0, 0.8);
}

a:hover .pic_info.type1 .plus_overlay {
	border-bottom: 1000px solid rgba(196, 214, 0, 0.8);
}

a .pic_info.type2 .plus_overlay {
	border-bottom: 50px solid rgba(196, 214, 0, 0.75);
}

a:hover .pic_info.type2 .plus_overlay {
	border-bottom: 860px solid rgba(196, 214, 0, 0.8);
}

a .pic_info.type3  .img_overlay_icon {
	background: rgba(196, 214, 0, 0.8);
}

a:hover .pic_info.type3 .img_overlay_icon {
	background: rgba(196, 214, 0, 0.8);
}

a .pic_info.type4 .img_overlay_icon {
	border-bottom: 2px solid rgba(196, 214, 0, 0.9);
}

a:hover .pic_info.type5 .info_overlay {
	background: #c4d600;
}

.pic_info.type6 .info_overlay {
	background: #c4d600;
}

a .pic_info.type6 .plus_overlay {
	border-bottom: 50px solid #c4d600;
}

.pic_info.type7 .info_overlay {
	background: rgba(196, 214, 0, 0.85);
}

@media only screen and (max-width: 768px) {
	.cs_nav .cs_nav_item.active {
		background: #c4d600 !important;
	}
}

#footer {
	position: relative;
}

#header {
	background-color: #00afd7 !important;
}

.page_title_bgr .full_container_page_title {
	margin-bottom: 0;
}

.page_heading h1 {
	text-transform: capitalize;
	font-family: & #039;
	Palatino
	&#039;
	,
	Montserrat
	,
	Arial,
	Helvetica,
	sans-serif;
}

h1, h2 {
	text-transform: lowercase;
	font-size: 30px;
	font-weight: 700;
}

h2.original {
	text-transform: none !important;
}

.rel_pos {
	padding: 12px 0;
}

.main_menu_underline_effect #menu>ul>li>a::after {
	height: 3px;
}

.custom_menu_3 #menu>ul>li ul>li>a {
	padding: 16px;
}

.custom_menu_3 #menu>ul>li ul>li>a>span {
	padding-right: 10px;
}

.acc_heading {
	font-size: initial;
}

.ai1ec-event-title {
	font-weight: 700;
}

.side_icon_box h3 {
	font-weight: 700;
}

.side_icon_box .icon_feat.icon_solid {
	top: -3px;
}

.light p, .light a, .light h2, .light h3, .light h4, .light .side_icon_box_content
	{
	color: white !important;
}

.dark p, .dark a, .dark h3, .dark h4, .dark .side_icon_box_content {
	color: black !important;
}

.light a:hover, .dark a:hover {
	text-decoration: underline;
}

input.btn_white.btn_outline:hover, a.btn_white.btn_outline:hover,
	.btn_white.btn_outline:hover {
	text-decoration: none;
}

.ai1ec-event-title {
	font-size: 15px;
}

.button.btn_large.btn_outline {
	border: 4px solid #f8f8f8;
	font-weight: 600;
	font-size: 18px;
	width: 100%;
}

.original .button {
	text-transform: initial;
	font-weight: 600;
	font-size: 18px;
}

.center input {
	margin: auto;
}

input[type="text"] {
	padding-bottom: 0 !important;
	margin-bottom: 0 !important;
}

.wpb_content_element.wpb_single_image {
	margin-bottom: 0;
}

/*Events manager styling*/
table.fullcalendar {
	width: 100%;
}

.month_name, .days-names td, thead td {
	height: auto !important;
	text-align: center !important;
	padding: 20px !important;
	background-color: #00afd7;
	color: white !important;
	font-weight: 600;
}

table.fullcalendar td {
	height: 120px;
	width: 12%;
}

.eventless-pre, .eventful-pre, .eventless-post, .eventful-post {
	background-color: #ececec;
}

.eventless-today, .eventful-today {
	background-color: #c4d600 !important;
}

.pic img {
	max-width: 500px;
}

.boc_heading.bgr_dotted {
	background: none;
}

.boc_heading.bgr_dotted span {
	background: none;
	text-transform: lowercase;
	font-weight: 600;
	color: white;
	font-size: 24px;
	padding-top: 20px;
}

.fixit {
	padding-left: 0;
	padding-right: 0;
}

@media ( min-width : 1280px) {
	.fixit {
		padding-left: 2px;
		padding-right: 3px;
	}
}
</style>
<link rel="stylesheet" id="boc-responsive-style-css"
	href="https://habitatkingston.com/wp-content/themes/fortuna/stylesheets/grid_responsive.css?ver=4.8.3"
	type="text/css" media="all">
<link rel="stylesheet" id="boc-fonts-css"
	href="//fonts.googleapis.com/css?family=Droid+Serif%3A400%2C700%2C400italic%2C700italic%7CLato%3A300%2C400%2C700%2C400italic%7CMontserrat%3A400%2C700&amp;ver=1.0.0"
	type="text/css" media="all">
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/jquery.js?ver=1.12.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/core.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/widget.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/position.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/mouse.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/sortable.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/datepicker.min.js?ver=1.11.4"></script>
<script type="text/javascript">
jQuery(document).ready(function(jQuery){jQuery.datepicker.setDefaults({"closeText":"Close","currentText":"Today","monthNames":["January","February","March","April","May","June","July","August","September","October","November","December"],"monthNamesShort":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"nextText":"Next","prevText":"Previous","dayNames":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"dayNamesShort":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"dayNamesMin":["S","M","T","W","T","F","S"],"dateFormat":"MM d, yy","firstDay":0,"isRTL":false});});
</script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/menu.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/wp-a11y.min.js?ver=4.8.3"></script>
<script type="text/javascript">
/* <![CDATA[ */
var uiAutocompleteL10n = {"noResults":"No results found.","oneResult":"1 result found. Use up and down arrow keys to navigate.","manyResults":"%d results found. Use up and down arrow keys to navigate.","itemSelected":"Item selected."};
/* ]]> */
</script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/autocomplete.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/resizable.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/draggable.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/button.min.js?ver=1.11.4"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-includes/js/jquery/ui/dialog.min.js?ver=1.11.4"></script>
<script type="text/javascript">
/* <![CDATA[ */
var EM = {"ajaxurl":"https:\/\/habitatkingston.com\/wp-admin\/admin-ajax.php","locationajaxurl":"https:\/\/habitatkingston.com\/wp-admin\/admin-ajax.php?action=locations_search","firstDay":"0","locale":"en","dateFormat":"dd\/mm\/yy","ui_css":"https:\/\/habitatkingston.com\/wp-content\/plugins\/events-manager\/includes\/css\/jquery-ui.min.css","show24hours":"0","is_ssl":"1","google_maps_api":"AIzaSyBnRnenuXuGxWKRpzx0SRmQ88NTSru7R7s","bookingInProgress":"Please wait while the booking is being submitted.","tickets_save":"Save Ticket","bookingajaxurl":"https:\/\/habitatkingston.com\/wp-admin\/admin-ajax.php","bookings_export_save":"Export Bookings","bookings_settings_save":"Save Settings","booking_delete":"Are you sure you want to delete?","booking_offset":"30","bb_full":"Fully Booked","bb_book":"Register","bb_booking":"Booking...","bb_booked":"Registration Submitted","bb_error":"Booking Error. Try again?","bb_cancel":"Cancel","bb_canceling":"Canceling...","bb_cancelled":"Cancelled","bb_cancel_error":"Cancellation Error. Try again?","txt_search":"Search","txt_searching":"Searching...","txt_loading":"Loading...","event_detach_warning":"Are you sure you want to detach this event? By doing so, this event will be independent of the recurring set of events.","delete_recurrence_warning":"Are you sure you want to delete all recurrences of this event? All events will be moved to trash.","disable_bookings_warning":"Are you sure you want to disable bookings? If you do this and save, you will lose all previous bookings. If you wish to prevent further bookings, reduce the number of spaces available to the amount of bookings you currently have","booking_warning_cancel":"Are you sure you want to cancel your booking?","cache":"1"};
/* ]]> */
</script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/plugins/events-manager/includes/js/events-manager.js?ver=5.7"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/plugins/events-manager-pro/includes/js/events-manager-pro.js?ver=2.51"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/plugins/revslider/public/assets/js/jquery.themepunch.tools.min.js?ver=5.3.1.5"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/plugins/revslider/public/assets/js/jquery.themepunch.revolution.min.js?ver=5.3.1.5"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/plugins/social-media-buttons-toolbar/inc/lib/bootstrap-tooltip/bootstrap-tooltip.js?ver=4.8.3"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/themes/fortuna/js/libs.min.js?ver=4.8.3"></script>
<script type="text/javascript">
/* <![CDATA[ */
var bocJSParams = {"boc_is_mobile_device":"","boc_theme_url":"https:\/\/habitatkingston.com\/wp-content\/themes\/fortuna","header_height":"70","sticky_header":"1","submenu_arrow_effect":"1","mm_bordered_columns":"1","transparent_header":"0","fixed_footer":"0","boc_submenu_animation_effect":"sub_fade_in"};
/* ]]> */
</script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/themes/fortuna/js/common.js?ver=4.8.3"></script>
<script type="text/javascript"
	src="https://habitatkingston.com/wp-content/themes/fortuna/js/jquery.smoothscroll.js?ver=4.8.3"></script>
<link rel="https://api.w.org/"
	href="https://habitatkingston.com/wp-json/">
<link rel="EditURI" type="application/rsd+xml" title="RSD"
	href="https://habitatkingston.com/xmlrpc.php?rsd">
<link rel="wlwmanifest" type="application/wlwmanifest+xml"
	href="https://habitatkingston.com/wp-includes/wlwmanifest.xml">
<link rel="canonical" href="https://habitatkingston.com/">
<link rel="shortlink" href="https://habitatkingston.com/">
<link rel="alternate" type="application/json+oembed"
	href="https://habitatkingston.com/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fhabitatkingston.com%2F">
<link rel="alternate" type="text/xml+oembed"
	href="https://habitatkingston.com/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fhabitatkingston.com%2F&amp;format=xml">
<script type="text/javascript">
				jQuery(document).ready(function($) {
				var ult_smooth_speed = 250;
				var ult_smooth_step = 45;
				$('html').attr('data-ult_smooth_speed',ult_smooth_speed).attr('data-ult_smooth_step',ult_smooth_step);
				});
			</script>
<style type="text/css">
.em-coupon-code {
	width: 150px;
}

#em-coupon-loading {
	display: inline-block;
	width: 16px;
	height: 16px;
	margin-left: 4px;
	background:
		url(https://habitatkingston.com/wp-content/plugins/events-manager-pro/includes/images/spinner.gif)
}

.em-coupon-message {
	display: inline-block;
	margin: 5px 0px 0px 105px;
	text-indent: 22px;
}

.em-coupon-success {
	color: green;
	background:
		url(https://habitatkingston.com/wp-content/plugins/events-manager-pro/includes/images/success.png)
		0px 0px no-repeat
}

.em-coupon-error {
	color: red;
	background:
		url(https://habitatkingston.com/wp-content/plugins/events-manager-pro/includes/images/error.png)
		0px 0px no-repeat
}

.em-cart-coupons-form .em-coupon-message {
	margin: 5px 0px 0px 0px;
}

#em-coupon-loading {
	margin-right: 4px;
}
</style>
<meta name="generator"
	content="Powered by Visual Composer - drag and drop page builder for WordPress.">
<!--[if lte IE 9]><link rel="stylesheet" type="text/css" href="https://habitatkingston.com/wp-content/plugins/js_composer/assets/css/vc_lte_ie9.min.css" media="screen"><![endif]-->
<meta name="generator"
	content="Powered by Slider Revolution 5.3.1.5 - responsive, Mobile-Friendly Slider Plugin for WordPress with comfortable drag and drop interface.">
<link rel="icon"
	href="https://habitatkingston.com/wp-content/uploads/2017/05/cropped-favicon-blue-32x32.png"
	sizes="32x32">
<link rel="icon"
	href="https://habitatkingston.com/wp-content/uploads/2017/05/cropped-favicon-blue-192x192.png"
	sizes="192x192">
<link rel="apple-touch-icon-precomposed"
	href="https://habitatkingston.com/wp-content/uploads/2017/05/cropped-favicon-blue-180x180.png">
<meta name="msapplication-TileImage"
	content="https://habitatkingston.com/wp-content/uploads/2017/05/cropped-favicon-blue-270x270.png">
<!-- BEGIN GADWP v5.1.1.3 Universal Analytics - https://deconf.com/google-analytics-dashboard-wordpress/ -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-105778108-1', 'auto');
  ga('send', 'pageview');
</script>
<!-- END GADWP Universal Analytics -->
<style>
img.crazy_lazy {
	opacity: 0
}
</style>
<style type="text/css" id="wp-custom-css">
h1, .h1 {
	font-size: 5em;
}

h2, .h2 {
	font-size: 4em;
}

h3, .h3 {
	font-size: 3em;
}

h4, .h4 {
	font-size: 2em;
}

h5, .h5 {
	font-size: 1em;
}

h6, .h6 {
	font-size: 0.5em;
}

.sqs-block {
	margin-left: -40px;
	margin-right: -40px;
	margin-top: -40px;
	margin-bottom: -40px;
}
</style>
<style type="text/css" data-type="vc_shortcodes-custom-css">
.vc_custom_1510079611405 {
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}

.vc_custom_1510079590475 {
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}

.vc_custom_1507859328553 {
	background-color: #c4d600 !important;
}

.vc_custom_1507747819054 {
	background-color: #00afd7 !important;
}

.vc_custom_1507753328926 {
	background-color: #c4d600 !important;
}

.vc_custom_1507753341783 {
	background-color: #00afd7 !important;
}

.vc_custom_1507753361520 {
	background-color: #c4d600 !important;
}

.vc_custom_1507753386395 {
	background-color: #00afd7 !important;
}
</style>
<noscript>&lt;style type="text/css"&gt;
	.wpb_animate_when_almost_visible { opacity: 1; }&lt;/style&gt;</noscript>

<style type="text/css">
.fb_hidden {
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reposition {
	overflow: hidden;
	position: relative
}

.fb_invisible {
	display: none
}

.fb_reset {
	background: none;
	border: 0;
	border-spacing: 0;
	color: #000;
	cursor: auto;
	direction: ltr;
	font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
	font-size: 11px;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	letter-spacing: normal;
	line-height: 1;
	margin: 0;
	overflow: visible;
	padding: 0;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	text-shadow: none;
	text-transform: none;
	visibility: visible;
	white-space: normal;
	word-spacing: normal
}

.fb_reset>div {
	overflow: hidden
}

.fb_link img {
	border: none
}

@
keyframes fb_transform {
	from {opacity: 0;
	transform: scale(.95)
}

to {
	opacity: 1;
	transform: scale(1)
}

}
.fb_animate {
	animation: fb_transform .3s forwards
}

.fb_dialog {
	background: rgba(82, 82, 82, .7);
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reset .fb_dialog_legacy {
	overflow: visible
}

.fb_dialog_advanced {
	padding: 10px;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px
}

.fb_dialog_content {
	background: #fff;
	color: #333
}

.fb_dialog_close_icon {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 0 transparent;
	cursor: pointer;
	display: block;
	height: 15px;
	position: absolute;
	right: 18px;
	top: 17px;
	width: 15px
}

.fb_dialog_mobile .fb_dialog_close_icon {
	top: 5px;
	left: 5px;
	right: auto
}

.fb_dialog_padding {
	background-color: transparent;
	position: absolute;
	width: 1px;
	z-index: -1
}

.fb_dialog_close_icon:hover {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent
}

.fb_dialog_close_icon:active {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent
}

.fb_dialog_loader {
	background-color: #f6f7f9;
	border: 1px solid #606060;
	font-size: 24px;
	padding: 20px
}

.fb_dialog_top_left, .fb_dialog_top_right, .fb_dialog_bottom_left,
	.fb_dialog_bottom_right {
	height: 10px;
	width: 10px;
	overflow: hidden;
	position: absolute
}

.fb_dialog_top_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 0;
	left: -10px;
	top: -10px
}

.fb_dialog_top_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -10px;
	right: -10px;
	top: -10px
}

.fb_dialog_bottom_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -20px;
	bottom: -10px;
	left: -10px
}

.fb_dialog_bottom_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -30px;
	right: -10px;
	bottom: -10px
}

.fb_dialog_vert_left, .fb_dialog_vert_right, .fb_dialog_horiz_top,
	.fb_dialog_horiz_bottom {
	position: absolute;
	background: #525252;
	filter: alpha(opacity = 70);
	opacity: .7
}

.fb_dialog_vert_left, .fb_dialog_vert_right {
	width: 10px;
	height: 100%
}

.fb_dialog_vert_left {
	margin-left: -10px
}

.fb_dialog_vert_right {
	right: 0;
	margin-right: -10px
}

.fb_dialog_horiz_top, .fb_dialog_horiz_bottom {
	width: 100%;
	height: 10px
}

.fb_dialog_horiz_top {
	margin-top: -10px
}

.fb_dialog_horiz_bottom {
	bottom: 0;
	margin-bottom: -10px
}

.fb_dialog_iframe {
	line-height: 0
}

.fb_dialog_content .dialog_title {
	background: #6d84b4;
	border: 1px solid #365899;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	margin: 0
}

.fb_dialog_content .dialog_title>span {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif)
		no-repeat 5px 50%;
	float: left;
	padding: 5px 0 7px 26px
}

body.fb_hidden {
	-webkit-transform: none;
	height: 100%;
	margin: 0;
	overflow: visible;
	position: absolute;
	top: -10000px;
	left: 0;
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif)
		white no-repeat 50% 50%;
	min-height: 100%;
	min-width: 100%;
	overflow: hidden;
	position: absolute;
	top: 0;
	z-index: 10001
}

.fb_dialog.fb_dialog_mobile.loading.centered {
	width: auto;
	height: auto;
	min-height: initial;
	min-width: initial;
	background: none
}

.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
	background: none
}

.loading.centered #fb_dialog_loader_close {
	color: #fff;
	display: block;
	padding-top: 20px;
	clear: both;
	font-size: 18px
}

#fb-root #fb_dialog_ipad_overlay {
	background: rgba(0, 0, 0, .45);
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	top: 0;
	width: 100%;
	min-height: 100%;
	z-index: 10000
}

#fb-root #fb_dialog_ipad_overlay.hidden {
	display: none
}

.fb_dialog.fb_dialog_mobile.loading iframe {
	visibility: hidden
}

.fb_dialog_content .dialog_header {
	-webkit-box-shadow: white 0 1px 1px -1px inset;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#738ABA),
		to(#2C4987));
	border-bottom: 1px solid;
	border-color: #1d4088;
	color: #fff;
	font: 14px Helvetica, sans-serif;
	font-weight: bold;
	text-overflow: ellipsis;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
	vertical-align: middle;
	white-space: nowrap
}

.fb_dialog_content .dialog_header table {
	-webkit-font-smoothing: subpixel-antialiased;
	height: 43px;
	width: 100%
}

.fb_dialog_content .dialog_header td.header_left {
	font-size: 12px;
	padding-left: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .dialog_header td.header_right {
	font-size: 12px;
	padding-right: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .touchable_button {
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#4966A6),
		color-stop(.5, #355492), to(#2A4887));
	border: 1px solid #29487d;
	-webkit-background-clip: padding-box;
	-webkit-border-radius: 3px;
	-webkit-box-shadow: rgba(0, 0, 0, .117188) 0 1px 1px inset,
		rgba(255, 255, 255, .167969) 0 1px 0;
	display: inline-block;
	margin-top: 3px;
	max-width: 85px;
	line-height: 18px;
	padding: 4px 12px;
	position: relative
}

.fb_dialog_content .dialog_header .touchable_button input {
	border: none;
	background: none;
	color: #fff;
	font: 12px Helvetica, sans-serif;
	font-weight: bold;
	margin: 2px -12px;
	padding: 2px 6px 3px 6px;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog_content .dialog_header .header_center {
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	line-height: 18px;
	text-align: center;
	vertical-align: middle
}

.fb_dialog_content .dialog_content {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat 50% 50%;
	border: 1px solid #555;
	border-bottom: 0;
	border-top: 0;
	height: 150px
}

.fb_dialog_content .dialog_footer {
	background: #f6f7f9;
	border: 1px solid #555;
	border-top-color: #ccc;
	height: 40px
}

#fb_dialog_loader_close {
	float: left
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_button {
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
	visibility: hidden
}

#fb_dialog_loader_spinner {
	animation: rotateSpinner 1.2s linear infinite;
	background-color: transparent;
	background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);
	background-repeat: no-repeat;
	background-position: 50% 50%;
	height: 24px;
	width: 24px
}

@
keyframes rotateSpinner { 0%{
	transform: rotate(0deg)
}

100%{
transform


:rotate(360deg)


}
}
.fb_iframe_widget {
	display: inline-block;
	position: relative
}

.fb_iframe_widget span {
	display: inline-block;
	position: relative;
	text-align: justify
}

.fb_iframe_widget iframe {
	position: absolute
}

.fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span,
	.fb_iframe_widget_fluid_desktop iframe {
	max-width: 100%
}

.fb_iframe_widget_fluid_desktop iframe {
	min-width: 220px;
	position: relative
}

.fb_iframe_widget_lift {
	z-index: 1
}

.fb_hide_iframes iframe {
	position: relative;
	left: -10000px
}

.fb_iframe_widget_loader {
	position: relative;
	display: inline-block
}

.fb_iframe_widget_fluid {
	display: inline
}

.fb_iframe_widget_fluid span {
	width: 100%
}

.fb_iframe_widget_loader iframe {
	min-height: 32px;
	z-index: 2;
	zoom: 1
}

.fb_iframe_widget_loader .FB_Loader {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat;
	height: 32px;
	width: 32px;
	margin-left: -16px;
	position: absolute;
	left: 50%;
	z-index: 4
}

.fb_mobile_overlay_active {
	height: 100%;
	overflow: hidden;
	position: fixed;
	width: 100%
}

.fb_shrink_active {
	opacity: 1;
	transform: scale(1, 1);
	transition-duration: 200ms;
	transition-timing-function: ease-out
}

.fb_shrink_active:active {
	opacity: .5;
	transform: scale(.75, .75)
}
</style>
</head>
<header id="header"
	class="has_subheader            sticky_header     hide_subheader_on_scroll">
	<!-- SubHeader -->
	<div class="full_header">
		<div id="subheader" class="container">
			<div class="section">
				<div class="header_contacts right">
					<div class="header_contact_item">
						<span class="fa fa-envelope"></span> office@habitatkingston.com
					</div>

					<div class="header_contact_item">
						<span class="fa fa-mobile"></span> Office: 613-548-8763 | ReStore:
						613-547-4111
					</div>
				</div>
				<a target="_blank" href="https://www.facebook.com/habitatkingston/"
					class="header_soc_icon" style="float: left;" title="Facebook">
					<span class="fa fa-facebook-f"></span>
				</a><a target="_blank" href="https://www.instagram.com/h4hkingston/"
					class="header_soc_icon" style="float: left;" title="Instagram">
					<span class="fa fa-instagram"></span>
				</a><a target="_blank" href="https://twitter.com/habitatkingston"
					class="header_soc_icon" style="float: left;" title="Twitter"> <span
					class="fa fa-twitter"></span></a><a target="_blank"
					href="https://www.youtube.com/channel/UCSWSDzuIcq_oRTIuTBHCO5Q"
					class="header_soc_icon" style="float: left;" title="YouTube"> <span
					class="fa fa-youtube"></span></a>
			</div>
		</div>
	</div>
	<div class="rel_pos">
		<div class="container">
			<div class="section rel_pos ">
				<div id="logo">
					<div class="logo_img " initital_width="213">
						<a href="https://habitatkingston.com/"
							title="Habitat for Humanity" rel="home"> <img
							src="https://habitatkingston.com/wp-content/uploads/2017/05/habitat-white.png"
							alt="Habitat for Humanity">
						</a>
					</div>
				</div>
				<div id="mobile_menu_toggler">
					<div id="m_nav_menu" class="m_nav">
						<div class="m_nav_ham button_closed" id="m_ham_1"></div>
						<div class="m_nav_ham button_closed" id="m_ham_2"></div>
						<div class="m_nav_ham button_closed" id="m_ham_3"></div>
					</div>
				</div>
				<div class="custom_menu_3 main_menu_underline_effect">
					<div id="menu" class="menu-main-container sub_fade_in arrow_effect">
						<ul>
							<li id="menu-item-506"
								class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-506"><a
								class="no_border">about us<span></span></a>
								<div>
									<ul class="sub-menu">
										<li id="menu-item-1137"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1137"><a
											href="https://habitatkingston.com/learn-more/who-we-are/"><span>what
													we do</span></a></li>
										<li id="menu-item-161"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-161"><a
											href="https://habitatkingston.com/learn-more/our-team/"><span>our
													leadership team</span></a></li>
										<li id="menu-item-163"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-163"><a
											href="https://habitatkingston.com/learn-more/our-partners/"><span>our
													partners</span></a></li>
										<li id="menu-item-158"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-158"><a
											href="https://habitatkingston.com/learn-more/faqs/"><span>FAQs</span></a></li>
										<li id="menu-item-30"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-30"><a
											href="https://habitatkingston.com/contact/"
											class="last_submenu_item"><span>contact us</span></a></li>
									</ul>
								</div></li>
							<li id="menu-item-507"
								class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-507"><a
								href="/get-involved/" class="no_border">get involved<span></span></a>
								<div>
									<ul class="sub-menu">
										<li id="menu-item-1077"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1077"><a
											href="https://habitatkingston.com/get-involved/our-builds/"><span>our
													builds</span></a></li>
										<li id="menu-item-248"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-248"><a
											href="https://habitatkingston.com/get-involved/volunteer-with-us/"><span>volunteer</span></a></li>
										<li id="menu-item-1028"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1028"><a
											href="https://habitatkingston.com/donate/"><span>donate
													money</span></a></li>
										<li id="menu-item-1038"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1038"><a
											href="https://habitatkingston.com/donate/donate-goods/"
											class="last_submenu_item"><span>donate stuff</span></a></li>
									</ul>
								</div></li>
							<li id="menu-item-524"
								class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-524"><a
								href="https://habitatkingston.com/events/" class="no_border">events<span></span></a>
								<div>
									<ul class="sub-menu">
										<li id="menu-item-1246"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1246"><a
											href="https://habitatkingston.com/habitat-tec/"
											class="last_submenu_item"><span>training &amp;
													event centre</span></a></li>
									</ul>
								</div></li>
							<li id="menu-item-93"
								class="menu-item menu-item-type-post_type menu-item-object-page menu-item-93"><a
								href="https://habitatkingston.com/apply-for-a-house/">homeownership</a></li>
							<li id="menu-item-157"
								class="menu-item menu-item-type-post_type menu-item-object-page menu-item-157"><a
								href="https://habitatkingston.com/restore/">ReStore</a></li>
							<li id="menu-item-27"
								class="menu-item menu-item-type-post_type menu-item-object-page menu-item-27"><a
								href="https://habitatkingston.com/donate/">donate</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="mobile_menu" style="display: none;">
		<ul>
			<li
				class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-506"><a>about
					us<span class="icon icon-chevron-down"></span>
			</a>
				<ul class="sub-menu">
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1137"><a
						href="https://habitatkingston.com/learn-more/who-we-are/">what
							we do</a></li>
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-161"><a
						href="https://habitatkingston.com/learn-more/our-team/">our
							leadership team</a></li>
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-163"><a
						href="https://habitatkingston.com/learn-more/our-partners/">our
							partners</a></li>
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-158"><a
						href="https://habitatkingston.com/learn-more/faqs/">FAQs</a></li>
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-30"><a
						href="https://habitatkingston.com/contact/">contact us</a></li>
				</ul></li>
			<li
				class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-507"><a
				href="/get-involved/">get involved<span
					class="icon icon-chevron-down"></span></a>
				<ul class="sub-menu">
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1077"><a
						href="https://habitatkingston.com/get-involved/our-builds/">our
							builds</a></li>
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-248"><a
						href="https://habitatkingston.com/get-involved/volunteer-with-us/">volunteer</a></li>
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1028"><a
						href="https://habitatkingston.com/donate/">donate money</a></li>
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1038"><a
						href="https://habitatkingston.com/donate/donate-goods/">donate
							stuff</a></li>
				</ul></li>
			<li
				class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-524"><a
				href="https://habitatkingston.com/events/">events<span
					class="icon icon-chevron-down"></span></a>
				<ul class="sub-menu">
					<li
						class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1246"><a
						href="https://habitatkingston.com/habitat-tec/">training &amp;
							event centre</a></li>
				</ul></li>
			<li
				class="menu-item menu-item-type-post_type menu-item-object-page menu-item-93"><a
				href="https://habitatkingston.com/apply-for-a-house/">homeownership</a></li>
			<li
				class="menu-item menu-item-type-post_type menu-item-object-page menu-item-157"><a
				href="https://habitatkingston.com/restore/">ReStore</a></li>
			<li
				class="menu-item menu-item-type-post_type menu-item-object-page menu-item-27"><a
				href="https://habitatkingston.com/donate/">donate</a></li>
		</ul>
	</div>
</header>