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
window.onclick = function(event) {
    var modal = document.getElementById('myModal');
    var deleteModal = document.getElementById('deleteModal');

    if (event.target == modal) {
        modal.style.display = 'none';
    }

    if (event.target == deleteModal) {
        deleteModal.style.display = 'none';
    }
}
document.getElementById('mainCloseBtn').onclick = function() {
    document.getElementById('myModal').style.display = 'none';
}
document.getElementById('deleteCloseBtn').onclick = function() {
    document.getElementById('deleteModal').style.display = 'none';
}

// 삭제 버튼 클릭 시 모달을 표시하고, 댓글 ID를 저장
document.querySelectorAll('.delete-btn').forEach(button => {
    button.addEventListener('click', function() {
        var commentId = this.getAttribute('data-id');
        var correctCode = document.querySelector('.yr_comment_item[data-id="' + commentId + '"] input[name="correct-code"]').value;

        // 모달에 commentId와 correctCode를 저장
        document.getElementById('deleteModal').setAttribute('data-id', commentId);
        document.getElementById('deleteModal').setAttribute('data-correct-code', correctCode);

        // 모달 표시
        document.getElementById('deleteModal').style.display = 'block';
    });
});

document.getElementById('confirmDeleteBtn').onclick = function() {
    var modal = document.getElementById('deleteModal');
    var enteredPassword = document.getElementById('deletePassword').value;
    var correctPassword = modal.getAttribute('data-correct-code');
    var commentId = modal.getAttribute('data-id');

    if (enteredPassword === correctPassword) {

        fetch('/event-comment/' + commentId, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (response.ok) {
                    // 삭제 성공 시, 해당 댓글 삭제
                    var commentItem = document.querySelector('.yr_comment_item[data-id="' + commentId + '"]');
                    if (commentItem) {
                        commentItem.parentNode.removeChild(commentItem);
                    }

                } else {
                    alert('삭제 실패');
                }
            })
            .catch(error => console.error('Error:', error))
            .finally(() => {
                // 모달 닫기
                modal.style.display = 'none';
                // input 창 초기화
                document.getElementById('deletePassword').value = '';
            });
    } else {
        alert('パスワードが一致しません。');
    }
}
