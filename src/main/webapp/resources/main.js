/**
 * 
 */
var firstName = $("#firstName").val();
var lastName = $("#lastName").val();
var email = $("#email").val();
var phone = $("#phone").val();
var json = {firstName: firstName, lastName: lastName, email: email, phone: phone};
console.log('JSON ==============>>>>',json);
function madeAjaxCall(){
	$.ajax({
		type: "post",
		url: "http://localhost:8080/myapp/employee/create",
		cache: false,				
// 		data:'firstName=' + $("#firstName").val() + "&lastName=" + $("#lastName").val() + "&email=" + $("#email").val(),
		data: json,
		success: function(response){
			$('#result').html("");
			var obj = JSON.parse(response);
			$('#result').html("First Name:- " + obj.firstName +"</br>Last Name:- " + obj.lastName  + "</br>Email:- " + obj.email);
		},
		error: function(){						
			alert('Error while request..');
		}
	});
}