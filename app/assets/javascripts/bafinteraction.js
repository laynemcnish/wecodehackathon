$(document).ready(function(){
    $( "#action-button" ).click(function(){
     $(".row").slideUp(.slideUp(500).delay(100),function(){
        //animation complete
     });
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

