$('#cart').html("<%= escape_javascript(render @cart) %>");
$('#pet_list').html("<%= escape_javascript(render @pets) %>");