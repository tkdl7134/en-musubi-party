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
        let add = $("<span class='allergy-tag' data-val='"+val+"'></span>").text(val);
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

    $("#addAllergies").click(() => {
        const selectedAllergies = [];
        // 선택된 체크박스 값을 수집
        $(".allergyOption:checked").each(function () {
            selectedAllergies.push($(this).val());
        })
        // 기타 알레르기 항목 수집
        $(".allergy-tag").each(function () {
            console.log(this.dataset.val);
            selectedAllergies.push(this.dataset.val);
        });

        // 수집된 알레르기 항목을 #allergyDetail 입력 필드에 입력
        $("#allergyDetail").val(selectedAllergies.join(", "));

        // 모달을 닫음
        closeModal();
    })

    $("#reset").click(()=>{
        $('.allergyOption').each(function (){
            $(this).prop('checked',false);
        });
        $('.allergy-wrap').remove();
    });
}

$(document).ready(function (){
    let partyCount = 0;

    $("#addPartyMember").change(function () {
        if (this.checked) {
            addPartyMemberDiv();
            $("#addPartyButton").show();
        }else {
            $("#partyContainer").empty();
            $("#addPartyButton").hide();
            partyCount = 0;
        }
    });

    $("addPartyButton").click(function (){
        addPartyMemberDiv();
    });

    function addPartyMemberDiv() {
        partyCount++;
        const partyDiv = $(
            '<div class= "party-member" id="party-member-${partyCount}">' +
            '  <div class="tk_justName">' +
            '       <div class="tk_survey-titleName">お名前</div>' +
            '           <input type="text" name="m_name_first" />' +
            '           <input type="text" name="m_name_second}" />' +
            '  </div>' +
            '  <div class="tk_kataName">' +
            '       <div class="tk_survey-titleName">カタカナ</div>' +
            '           <input type="text" name="m_name_kana_first" />' +
            '           <input type="text" name="m_name_kana_second" />' +
            '   </div>' +
            '   <div class="tk_romeName">' +
            '       <div class="tk_survey-titleName">ローマ字</div>' +
            '           <input type="text" name="m_name_rome_first" /> ' +
            '           <input type="text" name="m_name_rome_second" />' +
            '   </div> ' +
            '   <div class="tk_survey-accompany">' +
            '       <div class="tk_survey-titleName">お連れ様について</div>' +
            '       <div>' +
            '           <input' +
            '               type="checkbox" id="adultAccompany" name="p_accompany_type" value="ご成年"/>' +
            '           <label class="cb1" for="adultAccompany"></label>' +
            '           <label for="adultAccompany_${partyCount}">ご成年</label>' +
            '           <input' +
            '               type="checkbox" id="childAccompany" name="p_accompany_type" value="お子様"/>' +
            '           <label class="cb1" for="childAccompany"></label>' +
            '           <label for="femaleGender_${partyCount}">お子様</label>' +
            '           <input' +
            '               type="checkbox" id="babyAccompany" name="p_accompany_type" value="幼子"/>' +
            '           <label class="cb1" for="babyAccompany"></label>' +
            '           <label for="babyAccompany_${partyCount}">幼子</label>' +
            '       </div>' +
            '   </div>' +
            '   <div class="tk_survey-gender-accompany">' +
            '       <div class="tk_survey-titleName">性別</div>' +
            '       <div>' +
            '           <input' +
            '               type="checkbox" id="maleGender-accompany}" name="m_gender" value="男性"/>' +
            '           <label class="cb1" for="maleGender-accompany}"></label>' +
            '           <label for="maleGender-accompany_${partyCount}">男性</label>' +
            '           <input' +
            '               type="checkbox" id="femaleGender-accompany}" name="m_gender" value="女性"/>' +
            '           <label class="cb1" for="femaleGender-accompany}"></label>' +
            '           <label for="femaleGender-accompany">女性</label>' +
            '           <input' +
            '               type="checkbox" id="othersGender-accompany" name="m_gender" value="その他"/>' +
            '           <label class="cb1" for="othersGender-accompany"></label>' +
            '           <label for="othersGender-accompany">その他</label>' +
            '      </div>' +
            '   </div> ' +
            '   <div class="tk_allergy">\n' +
            '       <div class="tk_survey-titleName">アレルギー</div>\n' +
            '       <div class="tk_survey-allergy-checkbox">\n' +
            '           <input type="checkbox" id="allergyHave" class="allergyHave" name="allergy_or" value="Yes"/>' +
            '           <label class="cb2" for="allergyHave"></label>\n' +
            '           <span>アレルギー情報を入力する</span>' +
            '       </div>' +
            '       <div class="tk_survey-allergy-detail" id="allergyDetailContainer" >' +
            (partyCount > 1 ? '<button class="remove-party-member" data-id="' + partyCount + '">削除する</button>' : '') +
            '</div>'
        );
        $("#partyContainer").append(partyDiv)
    }

    $(document).on("click", ".remove-party-member", function () {
        const id = $(this).data("id");
        $('party-member-${id}').remove();
    })

    $(document).on("change", ".allergyHave", function() {
        const id = $(this).data("id");
        if (this.checked) {
            $(`#allergyDetailContainer_${id}`).html(
                `<input type="text" id="allergyDetail_${id}" name="allergy_${id}" placeholder="アレルギー詳細を入力してください " autocomplete="off" />`
            );

            // 알레르기 input 필드 클릭 시 모달을 띄우는 이벤트 핸들러 추가
            $(`#allergyDetail_${id}`).click(function () {
                console.log("확인", id);
                loadModal(id);
            });
        } else {
            $(`#allergyDetailContainer_${id}`).html("");
        }
    });

})

$(function () {

    const openImgModalButton = document.getElementById("defaultImgButton");
    const closeImgModalButton = document.getElementById("closeImgModalButton");
    const defaultImgModal = document.getElementById("defaultImgModal");
    const confirmImgButton = document.getElementById("confirmImgButton");
    const imgDeleteButton = document.getElementById("ImgDeleteButton");
    let selectedImgSrc = '';

    openImgModalButton.addEventListener("click", () => {
        defaultImgModal.showModal();
    });

    closeImgModalButton.addEventListener("click", () => {
        defaultImgModal.close();
    });

    confirmImgButton.addEventListener("click", () => {
        defaultImgModal.close();
    });

    document.querySelectorAll('.sample-imgList-item').forEach(item => {
        item.addEventListener('click', () => {
            document.querySelectorAll('.sample-imgList-item').forEach(i => i.style.border = '5px solid transparent');
            item.style.border = '5px solid coral';
            selectedImgSrc = item.querySelector('img').src;
        });
    });

    confirmImgButton.addEventListener("click", () => {
        if (selectedImgSrc) {
            document.querySelector('.tk_messageImg').innerHTML = `<img src="${selectedImgSrc}" alt="Selected Image" style="width: 100%; height: 100%;">`;
            alert("アップロード完了!");
            defaultImgModal.close();
        }
    });

        document.getElementById('ImgUploadButton').addEventListener('click', function () {
            document.getElementById('imgInput').click();
    })

    document.getElementById('imgInput').addEventListener('change',function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('messageImg').innerHTML = `<img src="${e.target.result}" alt="Uploaded Image" style="width: 100%; height: 100%;">`;
            }
            reader.readAsDataURL(file);
        }
    });

        imgDeleteButton.addEventListener("click", () => {
            document.querySelector('.tk_messageImg').innerHTML = '';
            document.getElementById('imgInput').value = ''; // 파일 입력 필드 초기화
    });
});

