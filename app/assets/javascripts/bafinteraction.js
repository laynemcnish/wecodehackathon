$(document).ready(function(){
    $( "#action-button" ).click(function(){
    $(".row").slideUp(500)
            .delay(498)
    });
});

// Drag and drop code

$(document).ready(function(){
    // Drag and drop code
    $(drag);

    function drag() {
        $(".dragme").draggable();
    };

});
