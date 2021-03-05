jQuery(function(){
  $('#employee_section').on('click', function(event) {
    location.href = "/employees";
  });
  $('#manager_section').on('click', function(event) {
    location.href = "/managers";
  });
});
