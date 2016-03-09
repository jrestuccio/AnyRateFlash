
// $('#selectAll()').change(function () {
//     $("input:checkbox").prop('checked',$(this).prop("checked"))

// });

// $('#EveryDay').click(function() {
//  if(this.checked) {
//        $(':checkbox').each(function() {
//            this.checked = true;                        
//        });
//    } 
//    else {
//       $(':checkbox').each(function() {
//            this.checked = false;                        
//        });
//    }
// });


function selectAll() {

  if(this.checked) {
       $(':checkbox').each(function() {
           this.checked = true;                        
       });
   } 
   else {
      $(':checkbox').each(function() {
           this.checked = false;                        
       });
   }
};

// function selectAll() {
//     $(":checkbox").prop('checked',$(this).prop("checked"))

// };
