function set_positions(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.card.draft-card').each(function(i){
        $(this).attr("data-pos",i+1)
    })
}

function ready(){
  if($('div').is('.sortable')){
    // set_positions()
    // call sortable on our div with the sortable class
    // sortable('.sortable')
    // after the order changes
    sortable('.sortable')[0].addEventListener('sortstop', function(e) {
        // array to store new order
        updated_order = []
        // set the updated positions
        // set_positions()

        // populate the updated_order array with the new task positions
        $('.card.draft-card').each(function(i){
            updated_order.push({ id: $(this).data('id'), position: i+1 })
          })

        // send the updated order via ajax

          $.ajax({
              type: "PUT",
              url: `/teams/${$('.team_information').data('id')}/draft_picks`,
              data: { order: updated_order }
          })

    })

}
}


$(document).ready(ready)
