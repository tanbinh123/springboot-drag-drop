<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>File Upload</title>
<%--<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.js"
	type="text/javascript"></script>--%>
<script src="<%=request.getContextPath()%>/js/jquery-1.4.4.js" type="text/javascript"></script>
<%--<script
	src="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
<script
	src="<%=request.getContextPath()%>/js/dropzone-4.3.0/dist/dropzone.js"></script>


<%--<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">--%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/dropzone-4.3.0/dist/dropzone.css">

<script>
	Dropzone.options.fileUploadForm = {
			  maxFilesize: 1024, // MB
			  init : function() {
				  this.on("uploadprogress", function(file, progress) {
					  console.log("File %s progress: %s", file.name, progress);
				  });
				  this.on("success", function(file, responseText) {
					  console.log("success " + file.name)
		          });
			  }
			};
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default" id="fileupload_main_panel">
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<form enctype="multipart/form-data"
							action="<%=request.getContextPath()%>/upload" method="POST"
							class="dropzone" id="fileUploadForm">

							<span id="fileUploadStatus"> </span>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>