
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

@selectAll = (id) ->

  if $(id).is(':checked')
    $("input:checkbox").prop("checked", true)                   
  else
    $("input:checkbox").prop("checked", false)                     


# function selectAll() {
#     $(":checkbox").prop('checked',$(this).prop("checked"))

# };
