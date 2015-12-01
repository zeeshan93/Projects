<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring Jquery Ajax Demo</title>
<style>

#insertform
{
     display:none;
	padding: 10px;
}

#updateForm
{
	display:none;
	padding: 10px;
	
}
Table.GridOne {
	padding: 3px;
	margin: 0;
	background: lightyellow;
	border-collapse: collapse;	
	width:35%;
}
Table.GridOne Td {	
	padding:2px;
	border: 1px solid #ff9900;
	border-collapse: collapse;
}
table1 {
  
    border-collapse: collapse;
    		border: 1px solid black;
		width:50%;
}
th1 {
  background: #f8f8f8; 
  font-weight: bold;    
    padding: 2px;
}
</style>
<script type="text/javascript">
console.log('path',window.location.pathname);
console.log('url',window.location.href);
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<p>
<div id="insertform">
	<p style="font-weight: bolder;">&nbsp;Add a new employee here</p>

	<form name="employeeForm" method="post">	
		<table cellpadding="0" cellspacing="0" border="1" class="GridOne">
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" id="firstName" value=""></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName" id="lastName" value=""></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" id="email" value=""></td>
			</tr>
			<tr>
				<td>Phone number</td>
				<td><input type="text" name="phone" id="phone" value=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="Create Employee" onclick="madeAjaxCall();"></td>
			</tr>
		</table>
	</form>
 </div>
 </p>
 
 <div id="updateForm">
	<p style="font-weight: bolder;">&nbsp;Update employee here</p>
	<form name="employeeForm" method="post">
	ID : <input type="text" name="id" id="id1" disabled="disabled">	
		<table cellpadding="0" cellspacing="0" border="1" class="GridOne">
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName" id="firstName1" value=""></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName" id="lastName1" value=""></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" id="email1" value=""></td>
			</tr>
			<tr>
				<td>Phone number</td>
				<td><input type="text" name="phone" id="phone1" value=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="Update Employee" onclick="madeUpdateAjaxCall();"></td>
			</tr>
		</table>
	</form>

 </div>

<p>
	<br>&nbsp; <button type="button" class="btn btn-success" id="button1" onClick="openForm()">+ ADD</button> &nbsp; <button type="button" class="btn btn-primary" onclick="madeAjaxButtonCall();" id="clickbutton">Employee List</button>
</p>

<table id = "personDataTable" class="table table-bordered">
	<tr>
		<th class = "th1">ID</th>
		<th class = "th1">FIRST NAME</th>
		<th class = "th1">LAST NAME</th>
		<th class = "th1">EMAIL</th>
		<th class = "th1">PHONE</th>
		<th colspan="2"> ACTION</th>
	</tr>	
</table>

<script type="text/javascript">
function openForm()
{
	 if ($("#insertform").is(":hidden")){
              $("#insertform").show("slow");
	}
	else{
		$("#insertform").hide("slow");
	}
}

var list;

function editAjaxCall(id){
	console.log(id);
	 if ($("#updateForm").is(":hidden")){
         $("#updateForm").show("slow");
	}
	else{
		$("#updateForm").hide("slow");
	}
	
		$.ajax({
			headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
			dataType: "json",
			type: "get",
			url: "/myapp/employee/"+id,
			
			success: function(response){

				console.log(response);

				if(response!=null){
					$("#id1").val(response.id);
					$("#firstName1").val(response.firstName);
					$("#lastName1").val(response.lastName);
					$("#email1").val(response.email);
					$("#phone1").val(response.phone);
				}

			},
			error: function(){						
				alert('Error while request..');
			}
		});
	
}

function madeUpdateAjaxCall(){
	var id=$("#id1").val();
	var firstName = $("#firstName1").val();
	var lastName = $("#lastName1").val();
	var email = $("#email1").val();
	var phone = $("#phone1").val();

	$.ajax({
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		dataType: "json",
		type: "put",
		url: "/myapp/employee/update/"+id,
		data: JSON.stringify({
            firstName: $("#firstName1").val(),
            lastName: $("#lastName1").val(),
            email: $("#email1").val(),
            phone: $("#phone1").val()
        }),
		success: function(response){

			console.log(response);
			alert("Code: " + response.code +"\nMessage: " + response.message);
			$("#updateForm").hide("slow");
			madeAjaxButtonCall();
		},
		error: function(){						
			alert('Error while request..');
		}
	});
	
}

function madeAjaxCall(){
	var firstName = $("#firstName").val();
	var lastName = $("#lastName").val();
	var email = $("#email").val();
	var phone = $("#phone").val();

	$.ajax({
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		dataType: "json",
		type: "post",
		url: "/myapp/employee/create",
		data: JSON.stringify({
            firstName: $("#firstName").val(),
            lastName: $("#lastName").val(),
            email: $("#email").val(),
            phone: $("#phone").val()
        }),
		success: function(response){

			console.log(response);
			alert("Code : " + response.code +"\nMessage:- " + response.message);
			$("#insertform").hide("slow");
		},
		error: function(){						
			alert('Error while request..');
		}
	});
}

function madeAjaxDeleteCall(id){
	console.log(id);
	$.ajax({
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		dataType: "json",
		type: "get",
		url: "/myapp/employee/delete/"+id,
		
		success: function(response){

			console.log(response);
			alert("Code : " + response.code +"\nMessage:- " + response.message);
			madeAjaxButtonCall();
		},
		error: function(){						
			alert('Error while request..');
		}
	});
}

function madeAjaxButtonCall(){
	 $("#personDataTable").html("");

	$.ajax({
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		 dataType: "json",
		type: "get",
		url: "/myapp/employee/list",


		success: function(response){
			list = response;
		$("#personDataTable").append('<tr> '+
				'<th class = "th1">ID</th> '+
				'<th class = "th1">FIRST NAME</th>  '+
				'<th class = "th1">LAST NAME</th> '+
				'<th class = "th1">EMAIL</th> '+
				'<th class = "th1">PHONE</th>  '+
				'<th colspan="2"> ACTION</th> '+
			    '</tr>	');

			var tr;
			var arr;
	        for (var i = 0; i < response.length; i++) {
	        	var row = $("<tr id = emp-" + response[i].id + "/>");
	            $("#personDataTable").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
	            row.append($("<td>" + response[i].id + "</td>"));
	            row.append($("<td class = 'emp-name'>" + response[i].firstName + "</td>"));
	            row.append($("<td>" + response[i].lastName + "</td>"));
	            row.append($("<td>" + response[i].email + "</td>"));
	            row.append($("<td>" + response[i].phone + "</td>"));
	            arr = [response[i].id,response[i].firstName+""];
	            row.append($("<td><button type='button' class='btn btn-link' onClick='editAjaxCall("+ response[i].id+");'>Update</button></td>"));
	            row.append($("<td><button type='button' class='btn btn-link' onClick='madeAjaxDeleteCall("+ response[i].id +");'>Delete</button></td>"));
	        }
	   },

			
		error: function(){						
			alert('Error while request..');
		}
	});
}




</script>
</body>
</html>