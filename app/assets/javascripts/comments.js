$(document).ready(function() {
  fetchComments()
  createComment()
})

function fetchComments(){
   $.ajax({
      url: "/api/v1/leagues/" + $("#league-id").val() + "/comments",
      method: 'GET',
    }).done(function(data){
      for (var i = 0; i < data.length; i++) {
        $('#league-comments').append('<p class="commment">' + data[i].message + '</p>');
      }
    }).fail(function(error){
      console.error(error);
    });

  };



function createComment() {
  $("#create-comment").on("click", function() {
    var commentParams = {
      comment: {
        message: $("#comment-message").val()
      }

    }

    $.ajax({
      type:    "POST",
      url:     "/api/v1/leagues/" + $("#league-id").val() + "/comments",
      data:    commentParams,
      success: function(newComment) {
        $('#league-comments').html('')
        fetchComments()
      },
      error: function(xhr) {
        console.log(xhr.responseText)
      }
    })
  })
}
