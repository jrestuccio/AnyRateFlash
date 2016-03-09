

$('#setAllDays').click(function () {
   
    if ($(this).is(':checked')) {
        $('#Monday,#Tuesday,#Wednesday,#Thursday,#Friday,#Saturday,#Sunday').prop('checked', true);

    } else {
        $('#Monday,#Tuesday,#Wednesday,#Thursday,#Friday,#Saturday,#Sunday').prop('checked', false);
    }

});