const e_no = document.querySelector("#eventNo").value;
console.log(e_no);
window.onload = () => {
    loadFundingList(e_no);
    insertFunding(e_no)
}

// CRUD
function loadFundingList(e_no){
    fetch(`/${e_no}/wishlist-setting/funding/all`)
        .then(response => response.json())
        .then(allFundingWish => {
            const fundingList = document.querySelector("#existing-fundingList");

            // 다시 로드할 때 기존 값 초기화
            fundingList.innerHTML = '';

            allFundingWish.forEach(funding => {
                const item = document.querySelector(".item.temp").cloneNode(true);
                // 데이터 삽입
                item.querySelector('.je_funding-name').innerText = funding.wl_product;
                item.querySelector('.je_funding-price input').placeholder = funding.wl_price + '　円';

                item.classList.remove('temp');
                fundingList.appendChild(item);

                // update button 활성화
                item.querySelector('#fundingItem-update-button').addEventListener("click", () => {
                    console.log(funding.wl_no);
                    updateFunding(e_no, funding.wl_no);
                });

                // delete button 활성화
                item.querySelector('#fundingItem-delete-button').addEventListener("click", () => {
                    console.log(funding.wl_no);
                    deleteFunding(e_no, funding.wl_no);
                });

            })
        })
}

function insertFunding(e_no){
    const itemNameEl = document.querySelector("#fundingItem-name");
    const itemPriceEl = document.querySelector("#fundingItem-price");
    const insertBtn = document.querySelector("#fundingItem-insert-button");

    insertBtn.addEventListener("click", () => {
        const obj = {
            wl_product : itemNameEl.value,
            wl_price : itemPriceEl.value,
            e_no : e_no
        }
        console.log(obj);

        fetch(`/${e_no}/wishlist-setting/funding`, {
            method : "POST",
            headers : {
                'Content-Type' : 'application/json'
            },
            body: JSON.stringify(obj)
        }).then(response=> {
            console.log('성공')
            loadFundingList(e_no);
            itemNameEl.value = '';
            itemPriceEl.value = '';
        })
    });
}

function updateFunding(e_no, wl_no){
    const newPrice = document.querySelector("#new-price").value;
    const obj = {
        wl_price : newPrice
    };
    console.log(obj)

    fetch(`/${e_no}/wishlist-setting/funding/${wl_no}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(obj)
    }).then(response => response.json())
        .then(result => {
            console.log(result)
            loadFundingList(e_no)
        })
}

function deleteFunding(e_no, wl_no){
    fetch(`/${e_no}/wishlist-setting/funding/${wl_no}`, {
        method: 'DELETE',
        headers : {
            'Content-Type' : 'application/json'
        }
    }).then(response => response.json())
        .then(result => {
            loadFundingList(e_no)
        })
}


// TOP button
function goToTop() {
    const position =
        document.documentElement.scrollTop || document.body.scrollTop;
    if (position) {
        window.requestAnimationFrame(() => {
            window.scrollTo(0, position - position / 10);
            goToTop();
        });
    }
}


