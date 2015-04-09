$('#pet_list').html("<%= escape_javascript(render @pets) %>");
$('#cart').html("<%= escape_javascript(render @cart) %>");
