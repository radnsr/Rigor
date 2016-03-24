<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<%@include file="head_css.jsp"%>

<!-- PAGE LEVEL STYLES -->
<link href="assets/css/layout2.css" rel="stylesheet" />
<link href="assets/plugins/flot/examples/examples.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/plugins/timeline/timeline.css" />
<!-- END PAGE LEVEL  STYLES -->

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="top_menu.jsp"%>
		<%@include file="left_menu.jsp"%>

		<div id="content">
		<div class="inner" style="min-height: 700px;"></div>
		</div>

		<%@include file="right_menu.jsp"%>
	</div>

	<%@include file="footer.jsp"%>
	<%@include file="head_js.jsp"%>
	<!-- PAGE LEVEL SCRIPTS -->
	<script src="assets/plugins/flot/jquery.flot.js"></script>
	<script src="assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="assets/plugins/flot/jquery.flot.stack.js"></script>
	<script src="assets/js/for_index.js"></script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>