$(document).ready(ready)

function ready(){
  if($('div').is('.sortable')){
    sortable('.sortable')[0].addEventListener('sortstop', function() {
      updated_order = []
      $('.card.draft-card').each(function(i){
          updated_order.push({ id: $(this).data('id'), position: i+1 })
        })
        $.ajax({
            type: "PUT",
            url: `/teams/${$('.team_information').data('id')}/draft_picks`,
            data: { order: updated_order }
      })
    })
  }
}
