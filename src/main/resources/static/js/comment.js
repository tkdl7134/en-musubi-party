var modal = document.getElementById("myModal");
var btn = document.getElementById("openModalBtn");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

document.querySelectorAll('.delete-btn').forEach(button => {
    button.addEventListener('click', function() {
        var commentId = this.getAttribute('data-id');
        fetch('/event-comment/' + commentId, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (response.ok) {
                    var commentItem = document.querySelector('.yr_comment_item[data-id="' + commentId + '"]');
                    if (commentItem) {
                        commentItem.parentNode.removeChild(commentItem);
                    }
                } else {
                    alert('삭제 실패');
                }
            })
            .catch(error => console.error('Error:', error));
    });
});

