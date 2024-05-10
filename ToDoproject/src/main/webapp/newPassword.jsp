<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Snippet - BBBootstrap</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
.placeicon {
	font-family: fontawesome
}

.custom-control-label::before {
background-color: #0D1D29;
	border: #dee2e6;
}
form{
margin-top: 10px;
background-color: #1C445E;

}
#newpassword{
margin-top: 75px;
}

#move{
margin-top: 120px;
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-info'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	<div>
		<!-- Container containing all contents -->
		<div class="container">
			<div  id="move"class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
					<!-- White Container -->
					<div id="white"class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Reset Password</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form  class="form-horizontal" action="newPassword" method="POST">
								<!-- User Name Input -->
								<div  class="form-group row justify-content-center px-3">
									<div id="newpassword" class="col-9 px-0">
										<input type="text" name="password" placeholder="&#xf084; &nbsp; New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
								<!-- Password Input -->
								<div id="confrimnewpassword" class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Confirm New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
							
								<!-- Log in Button -->
								<div class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3"><br>
										<input type="submit" value="Reset"
											class="btn btn-block btn-info">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	
</body>
</html>