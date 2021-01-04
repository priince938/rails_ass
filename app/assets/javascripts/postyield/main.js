// ajax call to check the no of employee in a particular city 
$(document).ready(function(){
$("#employee_city_id").change(function () {
    
    var id = $("#employee_city_id").val();
    console.log(id);
    console.log('/count?city_id='+id);

    $.ajax({
      url:'/count?city_id='+id , type: 'get', dataType: 'script',
        processData: false,
         
    });
  });
});