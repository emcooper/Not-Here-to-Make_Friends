var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.card.draft-card').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}


var ready;
ready = function(){
    set_positions();
    // call sortable on our div with the sortable class
    sortable('.sortable');
}

$(document).ready(ready);
