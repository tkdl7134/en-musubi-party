document.addEventListener("DOMContentLoaded", function() {
    const tabHeaders = document.querySelectorAll(".hw_tab_header");

    tabHeaders.forEach((header) => {
        const tabItems = header.querySelectorAll(".hw_tab__item");
        const tabContents = header.nextElementSibling.querySelectorAll(".hw_tab_content");

        tabItems.forEach((item, index) => {
            item.addEventListener("click", (e) => {
                e.preventDefault();
                tabItems.forEach((content) => {
                    content.classList.remove("active");
                });
                tabContents.forEach((content) => {
                    content.classList.remove("active");
                });
                tabItems[index].classList.add("active");
                tabContents[index].classList.add("active");
            });
        });
    });

    const topButton = document.querySelector(".top_button");
    topButton.addEventListener("click", (e) => {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });

    const moreButton = document.querySelector(".hw_more_button");
    const detailTableWrapper = document.querySelector(".hw_detail_wrapper");
    const hwCon = document.querySelector(".hw_invitation_main");
    let concon = document.querySelector("#canvas-content-container");
    moreButton.addEventListener("click", () => {
        if (detailTableWrapper.style.display === "none" || detailTableWrapper.style.display === "") {
            detailTableWrapper.style.display = "block";
            moreButton.textContent = "クリック";
            let currentHeight = parseFloat(hwCon.style.height) || 0; // 현재 높이가 설정되지 않은 경우 0으로 초기화
            let newHeight = currentHeight + 300;
            concon.style.height = newHeight + "px";
        } else {
            detailTableWrapper.style.display = "none";
            moreButton.textContent = "クリック";
            let currentHeight = parseFloat(concon.style.height) || 0; // 현재 높이가 설정되지 않은 경우 0으로 초기화
            let newHeight = currentHeight - 300;
            concon.style.height = newHeight + "px";
        }
    });

    window.sortBy = function(type) {
        const form = document.querySelector("form");
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "sortType";
        input.value = type;
        form.appendChild(input);
        form.submit();
    };
});








// 로고 버튼 클릭 이벤트
document.addEventListener('DOMContentLoaded', (event) => {
    const mainLogo = document.querySelector(".mainLogo");
    const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");

    mainLogo.addEventListener('click', (event) => {
        event.preventDefault();
        mainLogo.style.cursor = "pointer";
        location.href='MainC';
    });



// ////////// ////////// ////////// ////////// ////////// //////////
// 메뉴 버튼 클릭 이벤트
    const menus = document.querySelector(".yj-main-menu");
    const navi = document.querySelector(".yj-main-nav");
    console.log(menus);
    console.log(navi);
    menus.addEventListener("click", function() {
        console.log(menus);
        console.log(navi);
        const menuBtn = menus.querySelector("img");
        if (navi.classList.contains("nav-hidden")) {
            menuBtn.src = "main/imgFolder/yj-main-menu2.png";
            navi.classList.remove("nav-hidden");
            navi.classList.add("nav-show");
        } else {
            menuBtn.src = "main/imgFolder/yj-main-menu1.png";
            navi.classList.remove("nav-show");
            navi.classList.add("nav-hidden");
        }
    });


});




