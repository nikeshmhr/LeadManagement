<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>LMS Administrator</title>
	<!--Importing bootstrap min.css framework-->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<!--Importing custom overwriting css named style.css-->
	<link href="resources/css/style.css" rel="stylesheet">
	<!-- Linking the favicon icon-image -->
	<link rel="icon" type="image/png" href="resources/images/favicon.png">


	<!-- Internal css for image logo -->
	<style type="text/css">
		img {
			opacity: .3;
		}
	</style>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!--brand and toggle get grouped for better mobile display-->
				<!-- The following code is for the collapsed menu button -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>


				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">Support</a></li>
					</ul>
				</div>
			</div>
		</nav>


		<div class="clearfix"></div>


		<div class="welcome_text">
			<span class="pull-right">
				<h1>Welcome, Administrator</h1>
			</span>
		</div>


		<div id="entry_form_container" class="col-md-8">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#">Add New User</a></li>
				<li><a href="admin_update_user.html">Update Present Users</a></li>
			</ul>

			<div class="col-sm-6" class="pull-left" style="background=#d3d3d3; width=50%;">
				<form method="POST" action="#">
					<table>
						<label><h3>New System User Entry</h3></label>
						<tr>
							<td>Name: </td>
							<td><input type="text" name="name" placeholder="Name"></td>
						</tr>
						<tr>
							<td>Email ID: </td>
							<td><input type="email" name="email_id" placeholder="Email ID"></td>
						</tr>
						<tr>
							<td>Date of Birth: </td>
							<td><input type="date" name="date_of_birth"></td>
						</tr>
						<tr>
							<td>Role:</td>
							<td>
								<select name = "Role">
									<option>Select Role</option>
									<option value="2">Counselor</option>
									<option value="3">Receptionist</option>
									<option value="4">Admission Officer</option>
									<option value="5">Top Management</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Faculty:</td>
							<td>
								<select name = "Faculty">
									<option>Select Faculty</option>
									<option value="1">Computing</option>
									<option value="2">Networking</option>
									<option value="3">Multimedia</option>
									<option value="4">Management</option>
									<option value="6">N/A</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Gender: </td>
							<td>
								<input type="radio"> Male
								<input type="radio"> Female
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="submit" name="Submit">
								<input type="reset" value="Clear">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>


		<div class="pull-right" class="col-md-3">
			<img src="resources/images/logo.jpg" height="150px" width="160px">
		</div>
	</div>
	<!-- Importing bootstrap framework jquery and javascrip from js/ -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>