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
let activeAllergyInput; // 활성화된 알러지 인풋창.
let selectedAllergies = []; // 선택된 알러지들
// 알러지 체크박스 띄울 시 input창 띄우기
$(function () {
    etcAllergy();

    $(document).on("change", ".allergyHave", function (e) {
        const allergyDetailContainer = e.target.dataset.conid;
        activeAllergyInput = e.target;
        if (this.checked) {
            $("#" + allergyDetailContainer).html(
                `<input type="text" id="allergyDetail" data-refid="${this.id}" class="allergyDetail" name="allergy"
                'placeholder="アレルギー詳細を入力してください " autocomplete="off" >`
            );
        } else {
            $("#" + allergyDetailContainer).html("");
        }
    });


    // 인풋 필드 클릭 시 모달을 띄우는 이벤트 핸들러 추가
    $(document).on("click", ".allergyDetail", function (e) {
        if (e.target.value === '') {      // 선택된 알러지가 하나라도 있는 경우
            $("#reset").click();
        } else {
            $("#etc-allergy").empty();
            checkAllergy(e.target);
        }

        loadModal();
    });

});

function checkAllergy(allergyDetail) {
    let findAllergyObj = selectedAllergies.find((allergyObj) => {
        if (allergyObj.id === allergyDetail.dataset.refid) {
            return allergyObj;
        }
    });
    console.log(findAllergyObj);
    $(".allergyOption").each(function (option, i) {
        if (findAllergyObj.option.includes($(this).val())) {
            option.selected = true;
        }
    });
    etcAllergyTag(findAllergyObj.other);
}

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

function etcAllergyTag(value) {
    if (value.length === 0) return;

    let val = [];
    if (Array.isArray(value)) {
        value.forEach((v) => {
            val.push(v);
        });
    } else {
        val.push(value);
    }
    document.getElementById('otherAllergy').value = '';
    val.forEach((v) => {
        console.log('how many?' + v)
        let wrap = $("<span class='allergy-wrap'></span>");
        let add = $("<span class='allergy-tag' data-val='" + v + "'></span>").text(v);
        let del = $("<span class='allergy-del'>x</span>");
        $(wrap).append(add);
        $(wrap).append(del);
        $("#etc-allergy").append(wrap);
        // 기타 알레르기 input창 입력 후 이전 입력된 내용 초기화
    });

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
        etcAllergyTag(val);

    });

    $(document).on("click", ".allergy-wrap", (e) => {
        $(e.target).closest(".allergy-wrap").remove();
    });
    // 추가를 눌렀다는건 알러지 정보를 하나라도 입력했다는거
    $("#addAllergies").click(() => {
        const selectedAllergies2 = [];
        let allergy = {id: activeAllergyInput.id, option: [], other: []};


        // 선택된 알러지들에 들어있는 obj가 있는지 없는지 (있으면 값의 수정, 없으면 만들어주기)
        let findAllergyObj = selectedAllergies.find((allergyObj) => allergyObj.id === allergy.id);
        if (findAllergyObj) {
            // 선택된 체크박스 값을 수집
            findAllergyObj.option = [];
            findAllergyObj.other = [];
            $(".allergyOption:checked").each(function () {
                findAllergyObj.option.push($(this).val());
                selectedAllergies2.push($(this).val());
            })
            // 기타 알레르기 항목 수집
            $(".allergy-tag").each(function () {
                findAllergyObj.other.push(this.dataset.val);
                // allergy.other.push(this.dataset.val);
                selectedAllergies2.push(this.dataset.val);
            });
        } else {
            $(".allergyOption:checked").each(function () {
                allergy.option.push($(this).val());
                selectedAllergies2.push($(this).val());
            })
            // 기타 알레르기 항목 수집
            $(".allergy-tag").each(function () {
                allergy.other.push(this.dataset.val);
                // allergy.other.push(this.dataset.val);
                selectedAllergies2.push(this.dataset.val);
            });
            selectedAllergies.push(allergy);
        }
        // 수집된 알레르기 항목을 #allergyDetail 입력 필드에 입력
        const detailInput = document.querySelector('[data-refid="' + activeAllergyInput.id + '"]');
        $(detailInput).val(selectedAllergies2.join(", "));

        // 모달을 닫음
        closeModal();
        console.log("추가하고 나면 뭐가 들어있니~? --")
        console.log(selectedAllergies)
    })

    $("#reset").click(() => {
        $('.allergyOption').each(function () {
            $(this).prop('checked', false);
        });
        $('.allergy-wrap').remove();
    });
}

$(document).ready(function () {
    let partyCount = 0;

    // Function to allow only one checkbox to be selected within each div
    function handleCheckboxGroup(groupClass) {
        $(document).on('change', `.${groupClass} input[type="checkbox"]`, function() {
            let $checkboxGroup = $(this).closest(`.${groupClass}`).find('input[type="checkbox"]');
            $checkboxGroup.not(this).prop('checked', false);
        });
    }

    // Initial call to set up the checkboxes for existing elements
    handleCheckboxGroup('tk_survey-accompany');
    handleCheckboxGroup('tk_survey-gender-accompany');

    $("#addPartyMember").change(function () {
        if (this.checked) {
            addPartyMemberDiv();
            $("#addPartyButton").show();
        } else {
            $("#partyContainer").empty();
            $("#addPartyButton").hide();
            partyCount = 0;
        }
    });

    $("#addPartyButton").click(function () {
        addPartyMemberDiv();
    });

    function addPartyMemberDiv() {
        partyCount++;
        let partyDiv =
            `<div class= "party-member" id="party-member-${partyCount}">
              <input type="hidden" name="companions[${partyCount}].p_accompany_num" value="${partyCount}" />
              <div class="tk_justName">
                   <div class="tk_survey-titleName">お名前</div>
                       <input type="text" name="m_name_first" />
                       <input type="text" name="m_name_second}" />
              </div>
              <div class="tk_kataName">
                   <div class="tk_survey-titleName">カタカナ</div>
                       <input type="text" name="m_name_kana_first" />
                       <input type="text" name="m_name_kana_second" />
               </div>
               <div class="tk_romeName">
                   <div class="tk_survey-titleName">ローマ字</div>
                       <input type="text" name="m_name_rome_first" />
                       <input type="text" name="m_name_rome_second" />
               </div> 
               <div class="tk_survey-accompany">
                   <div class="tk_survey-titleName">お連れ様について</div>
                   <div>
                       <input
                           type="checkbox" id="adultAccompany${partyCount}" name="p_accompany_type" value="ご成年"/>
                       <label class="cb1" for="adultAccompany${partyCount}"></label>
                       <label for="adultAccompany${partyCount}">ご成年</label>
                       <input
                           type="checkbox" id="childAccompany${partyCount}" name="p_accompany_type" value="お子様"/>
                       <label class="cb1" for="childAccompany${partyCount}"></label>
                       <label for="femaleGender${partyCount}">お子様</label>
                       <input
                           type="checkbox" id="babyAccompany${partyCount}" name="p_accompany_type" value="幼子"/>
                       <label class="cb1" for="babyAccompany${partyCount}"></label>
                       <label for="babyAccompany${partyCount}">幼子</label>
                   </div>
               </div>
               <div class="tk_survey-gender-accompany">
                   <div class="tk_survey-titleName">性別</div>
                   <div>
                       <input
                           type="checkbox" id="maleGender-accompany${partyCount}" name="m_gender" value="男性"/>
                       <label class="cb1" for="maleGender-accompany${partyCount}"></label>
                       <label for="maleGender-accompany${partyCount}">男性</label>
                       <input
                           type="checkbox" id="femaleGender-accompany${partyCount}" name="m_gender" value="女性"/>
                       <label class="cb1" for="femaleGender-accompany${partyCount}"></label>
                       <label for="femaleGender-accompany${partyCount}">女性</label>
                       <input
                           type="checkbox" id="othersGender-accompany${partyCount}" name="m_gender" value="その他"/>
                       <label class="cb1" for="othersGender-accompany${partyCount}"></label>
                       <label for="othersGender-accompany${partyCount}">その他</label>
                  </div>
               </div>
               <div class="tk_allergy">
                   <div class="tk_survey-titleName">アレルギー</div>
                   <div class="tk_survey-allergy-checkbox">
                       <input type="checkbox" id="allergyHave-${partyCount}" data-conid="allergyDetailContainer${partyCount}" class="allergyHave" name="allergy_or" value="Yes"/>
                       <label class="cb2" for="allergyHave-${partyCount}"></label>
                       <span>アレルギー情報を入力する</span>
                   </div>
                   <div class="tk_survey-allergy-detail"  id="allergyDetailContainer${partyCount}" >`;
        partyDiv += "</div>";
        partyDiv += partyCount > 1 ? '<button class="remove-party-member" data-id="' + partyCount + '">削除する</button>' : '';
        $("#partyContainer").append(partyDiv);

        // Apply the checkbox group handler to the newly added divs
        handleCheckboxGroup('tk_survey-accompany');
        handleCheckboxGroup('tk_survey-gender-accompany');
    }

    $(document).on("click", ".remove-party-member", function () {
    const id = $(this).data("id");
    $("#party-member-" + id).remove();
    })

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

    document.getElementById('imgInput').addEventListener('change', function (event) {
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

document.addEventListener('DOMContentLoaded', () => {
    const handleSelection = (selectionId, inputId) => {
        const selection = document.getElementById(selectionId);
        const hiddenInput = document.getElementById(inputId);

        selection.addEventListener('click', (event) => {
            const clickedOption = event.target.closest('.survey-selection-option');

            if (clickedOption) {
                const allOptions = selection.querySelectorAll('.survey-selection-option img');

                // 모든 이미지 숨기기
                allOptions.forEach(img => {
                    img.classList.remove('visible');
                    img.classList.add('hidden');
                });

                // 클릭된 옵션의 이미지 보이기
                const img = clickedOption.querySelector('img');
                if (img) {
                    img.classList.remove('hidden');
                    img.classList.add('visible');
                }

                // 클릭된 옵션의ㅣ data-value 값을 hidden input에 설정
                const value = clickedOption.getAttribute('data-value');
                hiddenInput.value = value;
                console.log(value)
            }
        });
    };

    handleSelection('wedding-selection', 'g_attend_wedding');
    handleSelection('afterparty-selection', 'g_attend_afterparty');

});

document.addEventListener("DOMContentLoaded", function() {
    // Function to allow only one checkbox to be selected within a given div
    function handleCheckboxGroup(div) {
        const checkboxes = div.querySelectorAll('input[type="checkbox"]');

        checkboxes.forEach(function(checkbox) {
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                    checkboxes.forEach(function(box) {
                        if (box !== checkbox) {
                            box.checked = false;
                        }
                    });
                }
            });
        });
    }

    // Observe the body for new divs being added
    const observer = new MutationObserver(function(mutationsList) {
        for (let mutation of mutationsList) {
            if (mutation.type === 'childList') {
                mutation.addedNodes.forEach(function(node) {
                    if (node.nodeType === 1 && node.classList.contains('tk_survey-accompany')) {
                        handleCheckboxGroup(node);
                    }
                    if (node.nodeType === 1 && node.classList.contains('tk_survey-gender-accompany')) {
                        handleCheckboxGroup(node);
                    }
                });
            }
        }
    });

    // Start observing the document for new divs being added
    observer.observe(document.body, { childList: true, subtree: true });

    // Initial call to set up existing divs
    document.querySelectorAll('.tk_survey-accompany').forEach(handleCheckboxGroup);
    document.querySelectorAll('.tk_survey-gender-accompany').forEach(handleCheckboxGroup);
});