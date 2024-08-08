document.addEventListener("DOMContentLoaded", function () {
    const partyLists = document.querySelectorAll(".yr_party_list");
    const partyWelcome = document.querySelector(".yr_party_welcome");

    const listAllContent = document.querySelector(".yr_list_all");
    const listItems = document.querySelectorAll(".yr_list");

    const randomContent = document.querySelector(".yr_random");
    const randomButton = document.querySelector(".yr_random_button");
    const randomLoading = document.querySelector(".yr_random_loading");
    const randomGroup = document.querySelector(".yr_random_group");

    const typeContent = document.querySelector(".yr_type");
    const typeItems = document.querySelectorAll(".yr_type_item");
    const typeButton = document.querySelector("#yr_type_button");
    const typeGroup = document.querySelector(".yr_type_group");
    const typeMention = document.querySelector(".yr_type_mention");
    const typeGroupSelect = document.querySelector(".yr_type_group_select");

    const choiceContent = document.querySelector(".yr_choice");
    const choiceItems = document.querySelectorAll(".yr_list_choice");
    let choiceCount = 0;

    listAllContent.style.display = "none";
    randomLoading.style.display = "none";
    randomGroup.style.display = "none";
    typeGroupSelect.style.display = "none";

    partyLists.forEach((list) => {
        list.addEventListener("click", function (event) {
            event.stopPropagation();

            partyLists.forEach((item) => {
                item.classList.remove("expanded");
                item.classList.add("collapsed");
            });

            this.classList.remove("collapsed");
            this.classList.add("expanded");

            // partyLists.forEach((el) => el.classList.remove("expanded"));
            // this.classList.add("expanded");

            partyWelcome.classList.add("hidden");

            if (this.classList.contains("all")) {
                listAllContent.style.display = "block";
                showListItems();
            } else {
                listAllContent.style.display = "none";
                hideListItems();
            }
            if (this.classList.contains("random")) {
                randomContent.style.display = "block";
            } else {
                randomContent.style.display = "none";
            }
            if (this.classList.contains("type")) {
                typeContent.style.display = "block";
            } else {
                typeContent.style.display = "none";
            }

            if (this.classList.contains("choice")) {
                choiceContent.style.display = "block";
                showListItems2();
            } else {
                choiceContent.style.display = "none";
                hideListItems2();
            }
        });
    });

    // 참가자 리스트 하나씩 차례로 보이게 하는 효과
    function showListItems() {
        listItems.forEach((item, index) => {
            setTimeout(() => {
                item.classList.add("visible");
            }, index * 300);
        });
    }

    function hideListItems() {
        listItems.forEach((item) => {
            item.classList.remove("visible");
        });
    }

    function showListItems2() {
        choiceItems.forEach((item, index) => {
            setTimeout(() => {
                item.classList.add("visible");
            }, index * 300);
        });
    }
    function hideListItems2() {
        choiceItems.forEach((item) => {
            item.classList.remove("visible");
        });
    }

    // 랜덤버튼 눌렀을때 애니메이션 효과
    randomButton.addEventListener("click", function () {
        randomButton.style.display = "none";
        randomLoading.style.display = "block";

        setTimeout(() => {
            randomLoading.style.display = "none";
            randomGroup.style.display = "block";
        }, 1500);
    });

    // type 토글시 색변경
    typeItems.forEach((item) => {
        item.addEventListener("click", () => {
            item.classList.toggle("selected");
        });
    });

    // type 제출 누르면 그룹 결과 화면으로 가기
    typeButton.addEventListener("click", function () {
        typeGroup.style.display = "none";
        typeButton.style.display = "none";
        typeMention.style.display = "none";

        typeGroupSelect.style.display = "block";
        setTimeout(() => {
            typeGroupSelect.style.opacity = "1";
        }, 20);
    });

    // choice 하면 안쪽에 그림자
    choiceItems.forEach((item) => {
        item.addEventListener("click", () => {
            if (item.classList.contains("selected")) {
                item.classList.remove("selected");
                choiceCount--;
            } else {
                if (choiceCount < 3) {
                    item.classList.add("selected");
                    choiceCount++;
                }
            }
        });
    });

    // 다른 화면 눌렀을 때 초기화
    function resetAllLists() {
        partyLists.forEach((item) => {
            item.classList.remove("expanded");
            item.classList.remove("collapsed");
        });
        // partyLists.forEach((el) => el.classList.remove("expanded"));
        partyWelcome.classList.remove("hidden");

        listAllContent.style.display = "none";
        randomContent.style.display = "none";
        choiceContent.style.display = "none";
        typeContent.style.display = "none";

        hideListItems();
    }
    document.addEventListener("click", resetAllLists);

    document
        .getElementById("yr_choice_button")
        .addEventListener("click", function () {
            if (choiceCount > 0) {
                document.querySelector(".yr_party_wrapper").classList.add("hidden");
                const selectedContainer = document.querySelector(
                    ".yr_selected_choices"
                );
                selectedContainer.innerHTML = "";
                choiceItems.forEach((item) => {
                    if (item.classList.contains("selected")) {
                        const clone = item.cloneNode(true);
                        clone.classList.remove("selected");
                        selectedContainer.appendChild(clone);
                    }
                });
                selectedContainer.classList.add("visible");
            } else {
                alert("1名以上を選んでください。");
            }
        });

    // 참가자 명단
    const participants = [
        "河・ユリ",
        "キム・ユジョン",
        "パク・ジョンウン",
        "イ·テゴン",
        "ジョン・ジェフン",
        "ナム・ヒョンウ",
    ];

    function shuffle(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
    }
    // 20명 초과일 경우 그룹은 5~6명, 이하는 3~4명
    function createGroups(participants) {
        let groupSize;
        const numberOfParticipants = participants.length;

        if (numberOfParticipants > 20) {
            groupSize = 5 + Math.floor(Math.random() * 2); // 5 or 6명 그룹
        } else {
            groupSize = 3 + Math.floor(Math.random() * 2); // 3 or 4명 그룹
        }

        shuffle(participants);

        const groups = [];
        for (let i = 0; i < numberOfParticipants; i += groupSize) {
            groups.push(participants.slice(i, i + groupSize));
        }
        return groups;
    }

    // 그룹명 지어주기
    const groups = createGroups(participants);
    const groupNames = "ABCDEFGHIJKL".split("");

    const participantToGroupMap = new Map();

    groups.forEach((group, index) => {
        group.forEach((participant) => {
            participantToGroupMap.set(participant, groupNames[index]);
        });
    });

    // 그룹을 화면에 표시
    const randomGroupElement = document.querySelector(".yr_random_group p");
    let groupText = "";

    participantToGroupMap.forEach((group, participant) => {
        groupText += `<p>${participant} is in group ${group}</p>`;
    });

    randomGroupElement.innerHTML = groupText;

    // 랜덤 버튼 클릭 시 그룹명을 띄우는 기능
    document
        .querySelector(".yr_random_button")
        .addEventListener("click", function () {
            const randomIndex = Math.floor(Math.random() * groups.length);
            document.querySelector(".yr_random_group p").textContent =
                groupNames[randomIndex];

            document.querySelector(".yr_random_group p").textContent = groupName;
        });
});
