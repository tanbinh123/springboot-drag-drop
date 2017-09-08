<!DOCTYPE>
<html lang="html">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Example jQuery Filer Demo</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">

<!-- Styles -->
<link
	href="<%=request.getContextPath()%>/js/jQuery.filer-1.3.0/css/jquery.filer.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/js/jQuery.filer-1.3.0/css/themes/jquery.filer-dragdropbox-theme.css"
	rel="stylesheet">

<!-- Jvascript -->
<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.js"></script>
<script
	src="<%=request.getContextPath()%>/js/jQuery.filer-1.3.0/js/jquery.filer.min.js"
	type="text/javascript"></script>

<style>
body {
	font-family: 'Roboto Condensed', sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #47525d;
	background-color: #fff;
	margin: 0;
	padding: 20px;
}

hr {
	margin-top: 20px;
	margin-bottom: 20px;
	border: 0;
	border-top: 1px solid #eee;
}

.jFiler {
	font-family: inherit;
}
</style>
</head>

<body>
	<div id="content">
		<h2>Example jQuery Filer Demo</h2>

		<!-- Example 2 -->
		<input type="file" name="file" id="filer_input2" />
		<!-- end of Example 2 -->

	</div>
	<script>
		$(document)
				.ready(
						function() {

							//Example 2
							$("#filer_input2")
									.filer(
											{
												limit : 1,
												maxSize : null,
												extensions : null,
												changeInput : '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"></i></div><div class="jFiler-input-text"><h3>Drag&Drop files here</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn blue">Browse Files</a></div></div>',
												showThumbs : true,
												theme : "dragdropbox",
												templates : {
													box : '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
													item : '<li class="jFiler-item">\
						<div class="jFiler-item-container">\
							<div class="jFiler-item-inner">\
								<div class="jFiler-item-thumb">\
									<div class="jFiler-item-status"></div>\
									<div class="jFiler-item-thumb-overlay">\
										<div class="jFiler-item-info">\
											<div style="display:table-cell;vertical-align: middle;">\
												<span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
												<span class="jFiler-item-others">{{fi-size2}}</span>\
											</div>\
										</div>\
									</div>\
									{{fi-image}}\
								</div>\
								<div class="jFiler-item-assets jFiler-row">\
									<ul class="list-inline pull-left">\
										<li>{{fi-progressBar}}</li>\
									</ul>\
									<ul class="list-inline pull-right">\
										<li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
									</ul>\
								</div>\
							</div>\
						</div>\
					</li>',
													itemAppend : '<li class="jFiler-item">\
							<div class="jFiler-item-container">\
								<div class="jFiler-item-inner">\
									<div class="jFiler-item-thumb">\
										<div class="jFiler-item-status"></div>\
										<div class="jFiler-item-thumb-overlay">\
											<div class="jFiler-item-info">\
												<div style="display:table-cell;vertical-align: middle;">\
													<span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
													<span class="jFiler-item-others">{{fi-size2}}</span>\
												</div>\
											</div>\
										</div>\
										{{fi-image}}\
									</div>\
									<div class="jFiler-item-assets jFiler-row">\
										<ul class="list-inline pull-left">\
											<li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
										</ul>\
										<ul class="list-inline pull-right">\
											<li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
										</ul>\
									</div>\
								</div>\
							</div>\
						</li>',
													progressBar : '<div class="bar"></div>',
													itemAppendToEnd : false,
													canvasImage : true,
													removeConfirmation : true,
													_selectors : {
														list : '.jFiler-items-list',
														item : '.jFiler-item',
														progressBar : '.bar',
														remove : '.jFiler-item-trash-action'
													}
												},
												dragDrop : {
													dragEnter : null,
													dragLeave : null,
													drop : null,
													dragContainer : null,
												},
												uploadFile : {
													url : "/upload",
													data : null,
													type : 'POST',
													enctype : 'multipart/form-data',
													synchron : true,
													beforeSend : function() {
													},
													success : function(data,
															itemEl, listEl,
															boxEl, newInputEl,
															inputEl, id) {
														var parent = itemEl
																.find(
																		".jFiler-jProgressBar")
																.parent(), new_file_name = JSON
																.parse(data), filerKit = inputEl
																.prop("jFiler");

														filerKit.files_list[id].name = new_file_name;

														itemEl
																.find(
																		".jFiler-jProgressBar")
																.fadeOut(
																		"slow",
																		function() {
																			$(
																					"<div class=\"jFiler-item-others text-success\"><i class=\"icon-jfi-check-circle\"></i> Success</div>")
																					.hide()
																					.appendTo(
																							parent)
																					.fadeIn(
																							"slow");
																		});
													},
													error : function(el) {
														var parent = el
																.find(
																		".jFiler-jProgressBar")
																.parent();
														el
																.find(
																		".jFiler-jProgressBar")
																.fadeOut(
																		"slow",
																		function() {
																			$(
																					"<div class=\"jFiler-item-others text-error\"><i class=\"icon-jfi-minus-circle\"></i> Error</div>")
																					.hide()
																					.appendTo(
																							parent)
																					.fadeIn(
																							"slow");
																		});
													},
													statusCode : null,
													onProgress : null,
													onComplete : null
												},
												files : null,
												addMore : false,
												allowDuplicates : true,
												clipBoardPaste : true,
												excludeName : null,
												beforeRender : null,
												afterRender : null,
												beforeShow : null,
												beforeSelect : null,
												onSelect : null,
												afterShow : null,
												onRemove : function(itemEl,
														file, id, listEl,
														boxEl, newInputEl,
														inputEl) {
													var filerKit = inputEl
															.prop("jFiler"), file_name = filerKit.files_list[id].name;

													$.post('/upload', {
														file : file_name
													});
												},
												onEmpty : null,
												options : null,
												dialogs : {
													alert : function(text) {
														return alert(text);
													},
													confirm : function(text,
															callback) {
														confirm(text) ? callback()
																: null;
													}
												},
												captions : {
													button : "Choose Files",
													feedback : "Choose files To Upload",
													feedback2 : "files were chosen",
													drop : "Drop file here to Upload",
													removeConfirmation : "Are you sure you want to remove this file?",
													errors : {
														filesLimit : "Only {{fi-limit}} files are allowed to be uploaded.",
														filesType : "Only Images are allowed to be uploaded.",
														filesSize : "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
														filesSizeAll : "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
													}
												}
											});
						})
	</script>
</body>
</html>
