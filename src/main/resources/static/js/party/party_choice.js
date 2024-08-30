window.addEventListener('load', function () {
    setTimeout(function() {
        document.getElementById('loadingScreen').style.display = 'none';
    }, 3000);
});


document.querySelectorAll('.open-modal').forEach(button => {
    button.addEventListener('click', function () {
        document.getElementById('lineIdModal').style.display = 'block';

    });
});

document.querySelector('.close').addEventListener('click', function () {
    document.getElementById('lineIdModal').style.display = 'none';
});


document.getElementById('lineIdForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const lineId = document.getElementById('lineId').value;
    const partnerID = document.getElementById('partnerID').value;
    console.log(partnerID)

    const formData = {
        ep_lineID: lineId,
        partnerID: partnerID
    };

    fetch('/party/main/choice', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);

            // post 보내고 모달창 안보이게
            document.getElementById('lineIdModal').style.display = 'none';

            // POST가 성공하면 PUT 요청을 수행하여 Line ID를 가져옴
            return fetch('/party/main/choice/line', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ partnerID: partnerID })
            });
        })
        .then(response => response.json())
        .then(data => {
            console.log('PUT Success:', data);

            const epLineID = data[0].ep_lineID;
            console.log('ep_lineID:', epLineID);

            if (epLineID) {
                const lineIdContainer = document.querySelector('.main-enParty-envelope-text p');
                lineIdContainer.innerHTML = `
            <span style="color: #FF5A55; font-size: 16px;">✿</span>
            <span style="color: #3F3F3F; font-size: 18px;">${epLineID}</span>
            <span style="color: #FF5A55; font-size: 16px;">✿</span>`;

                const mainEnvelope = document.querySelector('.main-envelope');
                mainEnvelope.classList.add('move-up');
            } else {
                console.error('ep_lineID not found');
            }

        })
        .catch(error => {
            console.error('Error:', error);
        });
});