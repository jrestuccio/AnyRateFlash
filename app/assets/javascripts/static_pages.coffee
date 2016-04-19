
# $('#selectAll()').change(function () {
#     $("input:checkbox").prop('checked',$(this).prop("checked"))

# });

# $('#EveryDay').click(function() {
#  if(this.checked) {
#        $(':checkbox').each(function() {
#            this.checked = true;                        
#        });
#    } 
#    else {
#       $(':checkbox').each(function() {
#            this.checked = false;                        
#        });
#    }
# });


@selectAll = (id, divid) ->

	if $(id).is(':checked')
    	$(divid).find("input:checkbox").prop("checked", true)                   
	else
  		$(divid).find("input:checkbox").prop("checked", false) 



$(document).on('ready page:change', ->
  $("#scheduleDisplay").hide()

  $("input[name=schedule1]").change( () ->
      if this.value == 'Now'
        $("#scheduleDisplay").siledUp()
      else if this.value == 'Future'
        $("#scheduleDisplay").slideDown()
    )               
  )                 


	
	# if $(id).is(':checked')
 #    	$(id).siblings('input[type="checkbox"]').prop("checked", true)                   
 #  	else
 #    	$(id).siblings('input[type="checkbox"]').prop("checked", false)


  # if $(id).is(':checked')
  #   $("input:checkbox").prop("checked", true)                   
  # else
  #   $("input:checkbox").prop("checked", false)  


# function selectAll() {
#     $(":checkbox").prop('checked',$(this).prop("checked"))

# };
