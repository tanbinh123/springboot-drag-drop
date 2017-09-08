<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>File Upload</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link
	href="<%=request.getContextPath()%>/js/bootstrap-fileinput/css/fileinput.min.css"
	media="all" rel="stylesheet" type="text/css" />

<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-fileinput/js/plugins/sortable.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-fileinput/js/plugins/purify.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-fileinput/js/fileinput.min.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-fileinput/js/locales/es.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-fileinput/themes/explorer/theme.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container kv-main">
		<form enctype="multipart/form-data" method="POST" action="/upload">
			<div class="form-group">
				<input id="file-1" name="file" type="file" multiple class="file"
					data-overwrite-initial="false" data-min-file-count="1">
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$("#file-1").fileinput({
				uploadUrl : '/upload', // you must set a valid URL here else you will get an error
				allowedFileExtensions : [ 'jpg', 'png', 'gif', 'war' ],
				overwriteInitial : false,
				maxFileSize : 10000,
				maxFilesNum : 10,
				//allowedFileTypes: ['image', 'video', 'flash'],
				slugCallback : function(filename) {
					return filename.replace('(', '_').replace(']', '_');
				}
			});
		});
	</script>
</body>
</html>