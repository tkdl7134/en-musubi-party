// guest-type(게스트 타입) 체크 하나만 할 수 있도록 기능
document.addEventListener("DOMContentLoaded", function () {
    const groomGuestCheckbox = document.getElementById("groomGuest");
    const brideGuestCheckbox = document.getElementById("brideGuest");

    groomGuestCheckbox.addEventListener("change", function () {
        if (this.checked) {
            brideGuestCheckbox.checked = false;
        }
    });

    brideGuestCheckbox.addEventListener("change", function () {
        if (this.checked) {
            groomGuestCheckbox.checked = false;
        }
    });
});

// gender(성별) 체크 하나만 할 수 있도록 기능
document.addEventListener("DOMContentLoaded", function () {
    const maleGenderCheckbox = document.getElementById("maleGender");
    const femaleGenderCheckbox = document.getElementById("femaleGender");
    const othersGenderCheckbox = document.getElementById("othersGender");

    maleGenderCheckbox.addEventListener("change", function () {
        if (this.checked) {
            femaleGenderCheckbox.checked = false;
            othersGenderCheckbox.checked = false;
        }
    });

    femaleGenderCheckbox.addEventListener("change", function () {
        if (this.checked) {
            maleGenderCheckbox.checked = false;
            othersGenderCheckbox.checked = false;
        }
    });

    othersGenderCheckbox.addEventListener("change", function () {
        if (this.checked) {
            maleGenderCheckbox.checked = false;
            femaleGenderCheckbox.checked = false;
        }
    });
});

$(function () {
    // 주소 api 가져오는 Ajax
    const japanAddressApi = () => {
        let searchValue;
        const searchPostcodeInput = $(".search-postcode");
        const addressInput = $("input[name='a_address']");
        const otherAddressInput = $("input[name='other-address']");

        searchPostcodeInput.on("input", () => {
            searchValue = searchPostcodeInput.val();
            // 우편번호가 지워질 때 주소 필드로 지움
            if (searchValue === "") {
                addressInput.val("");
                otherAddressInput.val("");
            }
        });

        $(".search-post-btn").on("click", (event) => {
            event.preventDefault();
            $.get(`https://api.zipaddress.net/?zipcode=${searchValue}`)
                .done((response) => {
                    console.log(response);
                    if (response.code === 200) {
                        const address = response.data.fullAddress;
                        $("input[name='a_address']").val(address);
                    } else {
                        console.log("Address not found");
                    }
                })
                .fail((error) => {
                    console.log(error);
                });
        });
    };
    japanAddressApi();
});

// 알러지 체크박스 띄울 시 input창 띄우기
$(function () {
    etcAllergy();

    $("#allergyHave").change(function () {
        if (this.checked) {
            $("#allergyDetailContainer").html(
                '<input type="text" id="allergyDetail" name="allergy" ' +
                'placeholder="アレルギー詳細を入力してください " autocomplete="off" >'
            );

            // 인풋 필드 클릭 시 모달을 띄우는 이벤트 핸들러 추가
            $("#allergyDetail").click(function () {
                console.log("확인");
                loadModal();
            });
        } else {
            $("#allergyDetailContainer").html("");
        }
    });
});

function loadModal() {
    $("#allergyModal").css("display", "flex");

    // 이벤트 핸들러를 다시 바인딩
    $("#addAllergies").off("click").click(function () {
        addAllergies();
    });

    $("#closeModal").off("click").click(function () {
        closeModal();
        // input 요소 초기화
        document.getElementById('otherAllergy').value = '';
    });

    $("#modalCloseButton").off("click").click(function () {
        closeModal();
        // input 요소 초기화
        document.getElementById('otherAllergy').value = '';
    });
}

function closeModal() {
    $("#allergyModal").css("display", "none");
}

function addAllergies() {
    const selectedAllergies = [];
    $(".allergyOption:checked").each(function () {
        selectedAllergies.push($(this).val());
    });

    const otherAllergy = $("#otherAllergy").val();
    if (otherAllergy) {
        selectedAllergies.push(otherAllergy);
    }

    const parentInput = $("#allergyDetail");
    if (parentInput) {
        parentInput.val(selectedAllergies.join(","));
    }

    closeModal();
}

function etcAllergy() {
    $("#etc-btn").click(() => {
        const val = $("#otherAllergy").val().trim();

        // 빈 내용일 경우 추가하지 않음
        if (val === "") {
            return
        }

        // 중복 알레르기 태그 방지
        let duplicate = false;
        $("#etc-allergy .allergy-tag").each(function () {
            if ($(this).text() === val) {
                duplicate = true;
                return false;
            }
        });

        if (duplicate) {
            alert("すでに追加されたアレルギーです");
            return;
        }

        let wrap = $("<span class='allergy-wrap'></span>");
        let add = $("<span class='allergy-tag'></span>").text(val);
        let del = $("<span class='allergy-del'>x</span>");
        $(wrap).append(add);
        $(wrap).append(del);
        $("#etc-allergy").append(wrap);
        // 기타 알레르기 input창 입력 후 이전 입력된 내용 초기화
        document.getElementById('otherAllergy').value = '';
    });

    $(document).on("click", ".allergy-wrap", (e) => {
        $(e.target).closest(".allergy-wrap").remove();
    });

    $("addAllergies").click(() => {
        const selectedAllergies = [];

        // 선택된 체크박스 값을 수집
        $(".allergyOption:checked").each(function () {
            selectedAllergies.push($(this).val());
        })

        // 기타 알레르기 항목 수집
        $("#etc-allergy span").each(function () {
            console.log("#etc-allergy span");
            selectedAllergies.push($(this).text());
        });

        // 수집된 알레르기 항목을 #allergyDetail 입력 필드에 입력
        $("allergyDetail").val(selectedAllergies.join(", "));

        // 모달을 닫음
        closeModal();
    })
}


