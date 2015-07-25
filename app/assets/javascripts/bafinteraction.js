$(document).ready(function(){
    $( "#action-button" ).click(function(){
     $(".container").slideUp("slow", function(){
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

