<html lang="en">
<head>
<!-- Force latest IE rendering engine or ChromeFrame if installed -->
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<meta charset="utf-8">
<title>jQuery File Upload Demo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/jQuery-File-Upload-9.16.0/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/jQuery-File-Upload-9.16.0/css/jquery.fileupload.css">
</head>

<body>
	<div class="container">
		<h1>jQuery File Upload Demo</h1>
		<h2 class="lead">Basic version</h2>
		<span class="btn btn-success fileinput-button"> <i
			class="glyphicon glyphicon-plus"></i> <span>Select files...</span> 
			<input id="fileupload" type="file" name="file">
		</span> <br> <br>
		<!-- The global progress bar -->
		<div id="progress" class="progress">
			<div class="progress-bar progress-bar-success"></div>
		</div>
		<!-- The container for the uploaded files -->
		<div id="files" class="files"></div>
		<br>
	</div>
	<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jQuery-File-Upload-9.16.0/js/vendor/jquery.ui.widget.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jQuery-File-Upload-9.16.0/js/jquery.iframe-transport.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/jQuery-File-Upload-9.16.0/js/jquery.fileupload.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

	<script>
$(function () {
    'use strict';
    var url = '/upload';
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#files');
            });
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css(
                'width',
                progress + '%'
            );
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
});
</script>
</body>
</html>
