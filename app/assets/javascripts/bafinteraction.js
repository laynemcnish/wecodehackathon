$(document).ready(function(){
    $( "#action-button" ).click(function(){
     $(".index.vertical-center").slideUp(10000, function(){
        //animation complete
     });
    });
});

$(document).ready(function(){
    $(".form-control input-md").keypress(function(e) {

         if(e.which == 13) {
             e.preventDefault();
             $(".index.vertical-center").slideUp(10000, function(){
                 //animation ends
             });
          };
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

