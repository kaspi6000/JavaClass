<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file = "inc/asset.jsp" %>
<style>

</style>
<script>
	$(() => {
		
	});
</script>
</head>
<body>
	<div class = "container">
	
		<%-- <%
		String title = "Board";
		String subtitle = "..";
		%>
		<%@ include file = "inc/header.jsp" %> --%>
		
		<jsp:include page = "inc/header.jsp">
			<jsp:param value = "1" name = "mode"/>
		</jsp:include>
		
		<!-- <h2 class = "page-header">Board <small><i>..</i></small></h2> -->
		
		<!-- https://www.generatedata.com -->
		<table class = "table table-striped">
			<tr>
				<th>no</th>
				<th>subject</th>
				<th>name</th>
				<th>regdate</th>
				<th>read</th>
			</tr>
			<tr>
				<td>1</td>
				<td>tincidunt vehicula risus.</td>
				<td>August</td>
				<td>01/04/2019</td>
				<td>66</td>
			</tr>
			<tr>
				<td>2</td>
				<td>porttitor interdum. Sed</td>
				<td>Graham</td>
				<td>01/21/2019</td>
				<td>4</td>
			</tr>
			<tr>
				<td>3</td>
				<td>sollicitudin commodo ipsum.</td>
				<td>Devin</td>
				<td>07/24/2017</td>
				<td>40</td>
			</tr>
			<tr>
				<td>4</td>
				<td>aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet</td>
				<td>Lance</td>
				<td>02/25/2019</td>
				<td>50</td>
			</tr>
			<tr>
				<td>5</td>
				<td>ultrices sit amet,</td>
				<td>Ciaran</td>
				<td>02/16/2018</td>
				<td>47</td>
			</tr>
			<tr>
				<td>6</td>
				<td>interdum. Sed auctor odio a</td>
				<td>Curran</td>
				<td>06/22/2017</td>
				<td>69</td>
			</tr>
			<tr>
				<td>7</td>
				<td>pede sagittis augue, eu tempor erat neque non quam.</td>
				<td>Cadman</td>
				<td>06/10/2018</td>
				<td>91</td>
			</tr>
			<tr>
				<td>8</td>
				<td>et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus.</td>
				<td>Clark</td>
				<td>02/16/2018</td>
				<td>59</td>
			</tr>
			<tr>
				<td>9</td>
				<td>Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in</td>
				<td>Cole</td>
				<td>08/05/2018</td>
				<td>5</td>
			</tr>
			<tr>
				<td>10</td>
				<td>lacus. Ut nec urna et arcu imperdiet</td>
				<td>Clarke</td>
				<td>10/27/2017</td>
				<td>34</td>
			</tr>
			<tr>
				<td>11</td>
				<td>convallis, ante lectus convallis</td>
				<td>Dylan</td>
				<td>08/25/2018</td>
				<td>88</td>
			</tr>
			<tr>
				<td>12</td>
				<td>taciti sociosqu ad litora torquent per</td>
				<td>Ryan</td>
				<td>08/06/2018</td>
				<td>7</td>
			</tr>
			<tr>
				<td>13</td>
				<td>eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer</td>
				<td>Zeus</td>
				<td>10/20/2017</td>
				<td>21</td>
			</tr>
			<tr>
				<td>14</td>
				<td>dictum. Proin eget</td>
				<td>Quinlan</td>
				<td>01/22/2018</td>
				<td>91</td>
			</tr>
			<tr>
				<td>15</td>
				<td>malesuada</td>
				<td>Brody</td>
				<td>01/29/2018</td>
				<td>11</td>
			</tr>
			<tr>
				<td>16</td>
				<td>lacus. Quisque</td>
				<td>Walker</td>
				<td>10/19/2018</td>
				<td>62</td>
			</tr>
			<tr>
				<td>17</td>
				<td>est, congue a, aliquet</td>
				<td>Bevis</td>
				<td>04/27/2017</td>
				<td>1</td>
			</tr>
			<tr>
				<td>18</td>
				<td>sem</td>
				<td>Aidan</td>
				<td>05/20/2017</td>
				<td>57</td>
			</tr>
			<tr>
				<td>19</td>
				<td>magna. Duis dignissim tempor arcu.</td>
				<td>Hunter</td>
				<td>11/16/2017</td>
				<td>74</td>
			</tr>
			<tr>
				<td>20</td>
				<td>facilisi. Sed neque. Sed eget</td>
				<td>Caleb</td>
				<td>12/09/2017</td>
				<td>40</td>
			</tr>
			<tr>
				<td>21</td>
				<td>nisi nibh lacinia orci, consectetuer euismod est arcu ac</td>
				<td>Benjamin</td>
				<td>11/10/2018</td>
				<td>5</td>
			</tr>
			<tr>
				<td>22</td>
				<td>ac</td>
				<td>Noah</td>
				<td>11/16/2018</td>
				<td>60</td>
			</tr>
			<tr>
				<td>23</td>
				<td>pede. Praesent eu dui. Cum</td>
				<td>Nasim</td>
				<td>08/20/2017</td>
				<td>25</td>
			</tr>
			<tr>
				<td>24</td>
				<td>ligula. Aenean gravida nunc</td>
				<td>Tanek</td>
				<td>02/12/2018</td>
				<td>69</td>
			</tr>
			<tr>
				<td>25</td>
				<td>eros. Nam consequat dolor vitae dolor.</td>
				<td>Phillip</td>
				<td>05/10/2017</td>
				<td>48</td>
			</tr>
			<tr>
				<td>26</td>
				<td>non,</td>
				<td>Ashton</td>
				<td>03/31/2019</td>
				<td>95</td>
			</tr>
			<tr>
				<td>27</td>
				<td>elementum purus, accumsan</td>
				<td>Brenden</td>
				<td>11/18/2018</td>
				<td>19</td>
			</tr>
		</table>
	</div>
</body>
</html>