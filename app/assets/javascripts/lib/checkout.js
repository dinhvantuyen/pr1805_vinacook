$(document).on("click", "button#checkout-next1", function(event){
  event.preventDefault();
  var name = $(this).parent().parent().parent().find("#address-name").text();
  var email = $(this).parent().parent().parent().find("#address-email").text();
  var address = $(this).parent().parent().parent().find("#address-address").text();
  var city = $(this).parent().parent().parent().find("#address-city").text();
  var country = $(this).parent().parent().parent().find("#address-country").text();
  var phone = $(this).parent().parent().parent().find("#address-phone").text();
  var authenticity_token = $(this).parent().parent().parent().parent().find('#authenticity_token').val();
  $.ajax({
    method: "POST",
    url: "/address",
    data: {name: name, email: email, address: address, city: city, country: country, phone: phone, authenticity_token: authenticity_token},
    dataType: "script",
  });
})


$(document).on("click", "button#checkout-next2", function(event){
  event.preventDefault();
  var name = $(this).parent().parent().parent().find("#address-name-1").text();
  var email = $(this).parent().parent().parent().find("#address-email-1").text();
  var address = $(this).parent().parent().parent().find("#address-address-1").text();
  var city = $(this).parent().parent().parent().find("#address-city-1").text();
  var country = $(this).parent().parent().parent().find("#address-country-1").text();
  var phone = $(this).parent().parent().parent().find("#address-phone-1").text();
  var authenticity_token = $(this).parent().parent().parent().parent().find('#authenticity_token').val();
  $.ajax({
    method: "POST",
    url: "/address",
    data: {name: name, email: email, address: address, city: city, country: country, phone: phone, authenticity_token: authenticity_token},
    dataType: "script",
  });
})
