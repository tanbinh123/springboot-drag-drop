<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>File Upload</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">

</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default" id="cbo_main_panel">
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-success" role="alert">
							<a href="/Dropzone" class="alert-link">Dropzone</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-success" role="alert">
							<a href="/FineUploader" class="alert-link">FineUploader</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-success" role="alert">
							<a href="/Plupload" class="alert-link">Plupload</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-success" role="alert">
							<a href="/jQueryFiler" class="alert-link">jQueryFiler</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-success" role="alert">
							<a href="/jQueryFileUpload" class="alert-link">jQueryFileUpload</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-success" role="alert">
							<a href="/BootstrapFileInput" class="alert-link">BootstrapFileInput</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>