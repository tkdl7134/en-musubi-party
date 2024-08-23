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
        const addressInput = $("input[name='m_address']");
        const otherAddressInput = $("input[name='m_other_address']");

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
                        $("input[name='m_address']").val(address);
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
        const allergyType = $(e.target).data('type');
        activeAllergyInput = e.target;

        if (this.checked) {
            $("#" + allergyDetailContainer).html(
                `<input type="text" id="allergyDetail" data-refid="${this.id}" class="allergyDetail" name="allergy"
                placeholder="押してください" autocomplete="off" >`
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

        let partyDiv =

            `<div class= "party-member" id="party-member-${partyCount}">
              <input type="hidden" name="companions[${partyCount}].p_accompany_num" value="${partyCount}" />
                <div class="tk_companions-justName">
                     <div class="tk_survey-companions-titleName-container">
                          <div class="tk_survey-accompany-titleName">お連れ様のお名前</div>
                     </div>
                     <div class="tk_survey-companions-input-container">
                        <input type="text" name="companions[${partyCount}].p_fam_kanji" />  <!-- 이름 필드들 -->
                        <input type="text" name="companions[${partyCount}].p_name_kanji" />
                     </div>
                </div>
                <div class="tk_companions-kataName">
                    <div class="tk_survey-companions-titleName-container">
                        <div class="tk_survey-accompany-titleName">カタカナ</div>
                    </div>
                    <div class="tk_survey-companions-input-container">
                        <input type="text" name="companions[${partyCount}].p_fam_kana" />
                        <input type="text" name="companions[${partyCount}].p_name_kana" />
                    </div>
                </div>
                <div class="tk_companions-romeName">
                    <div class="tk_survey-companions-titleName-container">
                        <div class="tk_survey-accompany-titleName">ローマ字</div>
                    </div>
                    <div class="tk_survey-companions-input-container">
                        <input type="text" name="companions[${partyCount}].p_fam_eng" />
                        <input type="text" name="companions[${partyCount}].p_name_eng" />
                    </div>
                </div> 
                <div class="tk_survey-gender-accompany">
                    <div class="tk_survey-companions-titleName-container">
                        <div class="tk_survey-accompany-titleName-2">性別</div>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.7rem;font-size: 1.2rem;">
                        <input type="checkbox" id="maleGender-accompany${partyCount}" name="companions[${partyCount}].p_gender" value="男性"/>
                        <label class="cb1" for="maleGender-accompany${partyCount}"></label>
                        <label for="maleGender-accompany${partyCount}">男性</label>
                        <input type="checkbox" id="femaleGender-accompany${partyCount}" name="companions[${partyCount}].p_gender" value="女性"/>
                        <label class="cb1" for="femaleGender-accompany${partyCount}"></label>
                        <label for="femaleGender-accompany${partyCount}">女性</label>
                    </div>
                </div>
                <div class="tk_survey-accompany">
                    <div class="tk_survey-companions-titleName-container">
                        <div class="tk_survey-accompany-titleName-2">お連れ様について</div>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.7rem;font-size: 1.2rem;">
                        <input type="checkbox" id="adultAccompany${partyCount}" name="companions[${partyCount}].p_accompany_type" value="ご成年"/>
                        <label class="cb1" for="adultAccompany${partyCount}"></label>
                        <label for="adultAccompany${partyCount}">ご成年</label>
                        <input type="checkbox" id="childAccompany${partyCount}" name="companions[${partyCount}].p_accompany_type" value="お子様"/>
                        <label class="cb1" for="childAccompany${partyCount}"></label>
                        <label for="femaleGender${partyCount}">お子様</label>
                        <input type="checkbox" id="babyAccompany${partyCount}" name="companions[${partyCount}].p_accompany_type" value="幼子"/>
                        <label class="cb1" for="babyAccompany${partyCount}"></label>
                        <label for="babyAccompany${partyCount}">幼子</label>
                    </div>
                </div>
                <div class="tk_allergy">
                    <div class="tk_survey-accompany-titleName-2">アレルギー</div>
                    <div class="tk_survey-allergy-checkbox">
                        <input type="checkbox" id="allergyHave-${partyCount}" data-conid="allergyDetailContainer${partyCount}" data-type="type" data-index="${partyCount}" class="allergyHave" name="companions[${partyCount}].p_allergy_or" value="Yes"/>
                        <label class="cb2" for="allergyHave-${partyCount}"></label>
                        <span>アレルギー情報を入力する</span>
                    </div>
                   <div class="tk_survey-allergy-detail2"  id="allergyDetailContainer${partyCount}" >`;
        partyDiv += "</div>";
        partyDiv += partyCount > 0 ? '<button class="remove-party-member" data-id="' + partyCount + '">削除</button>' : '';
        $("#partyContainer").append(partyDiv);
        partyCount++;
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
    const imgDeleteButton = document.getElementById("imgDeleteButton");
    let selectedImgSrc = '';

    // 초기 이미지가 설정되어 있는 경우 src 값을 selectedImgSrc 에 저장
    const initialImgElement  = document.querySelector('.tk_messageImg img');
    if (initialImgElement ) {
        selectedImgSrc = initialImgElement .src;
    }

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
            document.querySelector('.tk_messageImg').innerHTML = `<img src="${selectedImgSrc}" alt="Selected Image" style="width: 100%; height: 100%; border-radius: 30px;"">
                                                                           <input type="hidden" name="me_img" id="meImgInput" value="${selectedImgSrc}">`;
            alert("アップロード完了!");
            defaultImgModal.close();
        }
    });

    document.getElementById('imgUploadButton').addEventListener('click', function () {
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

// $(document).ready(function () {
//     $(".survey-submit-button").on("click", function(event) {
//         event.preventDefault(); // 폼 제출을 기본적으로 막음
//
//         let allValid = true;
//
//         // g_relation_other가 필수인 경우 검사
//         const otherField = document.getElementById('g_relation_other');
//         if (otherField.style.display !== 'none' && !otherField.value.trim()) {
//             allValid = false;
//             alert("ご関係を入力してください");
//
//             otherField.focus();
//             window.scrollTo({
//                 top: otherField.getBoundingClientRect().top + window.pageYOffset - 60,
//                 behavior: 'smooth'
//             });
//
//             return false;
//         }
//
//         // 필수 입력 필드 확인
//         const requiredFields = [
//             // {
//             //     selector: ".tk_survey-guestType input[name='g_guest_type']:nth-of-type(1)",
//             //     errorMessage: "ゲスト様項目をチェックしてください"
//             // },
//             // {
//             //     selector: ".tk_survey-guestType input[name='g_guest_type']:nth-of-type(2)",
//             //     errorMessage: "ゲスト様項目をチェックしてください"
//             // },
//             {selector: ".tk_justName input[name='m_fam_kanji']", errorMessage: "お名前項目を入力してください"},
//             {selector: ".tk_justName input[name='m_name_kanji']", errorMessage: "お名前項目を入力してください"},
//             {selector: ".tk_kataName input[name='m_fam_kana']", errorMessage: "カタカナ項目を入力してください"},
//             {selector: ".tk_kataName input[name='m_name_kana']", errorMessage: "カタカナ項目を入力してください"},
//             {selector: ".tk_romeName input[name='m_fam_eng']", errorMessage: "ローマ字項目を入力してください"},
//             {selector: ".tk_romeName input[name='m_name_eng']", errorMessage: "ローマ字項目を入力してください"},
//             // {
//             //     selector: ".tk_survey-gender input[name='m_gender']:checked",
//             //     errorMessage: "性別項目をチェックしてください"
//             // },
//             {selector: ".tk_address input[name='m_zipcode']", errorMessage: "住所項目を入力してください"},
//             {selector: ".tk_address input[name='m_address']", errorMessage: "住所項目を入力してください"},
//             {selector: ".tk_survey-email input[name='m_email']", errorMessage: "メールアドレス項目を入力してください"},
//             {selector: ".tk_survey-phone input[name='m_phone']", errorMessage: "電話番号項目を入力してください"},
//             {
//                 selector: "#wedding-selection .survey-selection-option.selected",
//                 errorMessage: "挙式・披露宴項目を選択してください"
//             },
//             {
//                 selector: "#afterparty-selection .survey-selection-option.selected",
//                 errorMessage: "アフターパーティー 選択してください"
//             }
//         ];
//         const guestTypeCheckboxes = $(".tk_survey-guestType input[name='g_guest_type']");
//         const genderTypeCheckboxes = $(".tk_survey-gender input[name='m_gender']");
//         let isGuestTypeChecked = guestTypeCheckboxes.is(":checked");
//         let isGenderType = genderTypeCheckboxes.is(":checked");
//
//         if (!isGuestTypeChecked) {
//             alert("ゲスト様項目をチェックしてください");
//             focusOnField(".tk_survey-guestType input[name='g_guest_type']:first");
//             allValid = false;
//         }else if(!isGenderType){
//             alert("性別項目をチェックしてください");
//             console.log(genderTypeCheckboxes[0])
//             console.log($(genderTypeCheckboxes).offset());
//             focusOnField(".tk_survey-gender");
//             allValid = false;
//         }  else {
//
//
//             for (let i = 0; i < requiredFields.length; i++) {
//                 const field = requiredFields[i];
//                 const element = $(field.selector).get(0);
//
//                 if (!element || (element.tagName === "INPUT" || element.tagName === "SELECT") && (!element.value || !element.value.trim())) {
//                     allValid = false;
//                     alert(field.errorMessage);
//
//                     focusOnField(field.selector);
//                     break;
//                 }
//             }
//         }
//         let isValid = true;
//         let firstInvalidInput = null;
//
//         // 모든 입력 필드 검사
//         document.querySelectorAll('input').forEach(function(inputElement) {
//             const existingError = inputElement.parentNode.querySelector('.error-message');
//             console.log(existingError)
//             if (existingError) {
//                 isValid = false;
//                 if (!firstInvalidInput) {
//                     firstInvalidInput = existingError;
//                 }
//             }
//         });
//
//         // 유효하지 않은 필드가 있으면 해당 필드로 스크롤 이동
//         if (!isValid) {
//             console.log("유효성 검사 실패 - 제출이 막힘");
//             console.log(firstInvalidInput);
//             focusOnField(firstInvalidInput);
//             firstInvalidInput.focus();
//             firstInvalidInput.scrollIntoView({ behavior: 'smooth' });
//             return;
//         }
//         if (allValid) {
//             console.log("모든 필드가 유효합니다. 폼을 제출합니다.");
//             $("form").off("submit").submit();  // 여기서 off()로 이벤트 리스너를 제거하고 폼 제출
//         } else {
//             console.log("유효하지 않은 필드가 있어 폼 제출이 막혔습니다.");
//         }
//     });
//
//     function focusOnField(selector) {
//         const element = $(selector);
//         if (!element) {
//             return;
//         }
//         console.log(element)
//         const elementOffset = element.offset().top;
//         console.log(elementOffset)
//
//         $('html, body').animate({
//             scrollTop: elementOffset-60
//         }, 500, function() {
//             element.focus();
//         });
//     }
//
//     $(".survey-selection-option").on("click", function () {
//         $(this).siblings().removeClass("selected");
//         $(this).addClass("selected");
//         const hiddenField = $(this).closest(".survey-selection").siblings("input[type='hidden']");
//         hiddenField.val($(this).data("value"));
//     });
// });


// 관계 입력에 따라 detail 관계가 변경되는 function //
document.addEventListener('DOMContentLoaded', function() {
    updateRelationOptions(); // 초기 로드 시 실행
    document.getElementById('g_relation').addEventListener('change', updateRelationOptions); // 변경 시 실행
});

function updateRelationOptions() {
    // 모든 g_relation_detail 요소의 name 속성을 비활성화
    document.getElementById('g_relation_family').name = '';
    document.getElementById('g_relation_friend').name = '';
    document.getElementById('g_relation_colleagues').name = '';
    document.getElementById('g_relation_other').name = '';
    document.getElementById('g_relation_other').required = false; // 필수 입력 해제

    // 모든 g_relation_detail 요소를 숨김
    document.getElementById('g_relation_family').style.display = 'none';
    document.getElementById('g_relation_friend').style.display = 'none';
    document.getElementById('g_relation_colleagues').style.display = 'none';
    document.getElementById('g_relation_other').style.display = 'none';

    const relationValue = document.getElementById('g_relation').value;

    // 선택한 값에 따라 적절한 요소를 표시하고, name 속성을 활성화
    if (relationValue === '家族') {
        document.getElementById('g_relation_family').style.display = 'inline-block';
        document.getElementById('g_relation_family').name = 'g_relation_detail';
    } else if (relationValue === '親友') {
        document.getElementById('g_relation_friend').style.display = 'inline-block';
        document.getElementById('g_relation_friend').name = 'g_relation_detail';
    } else if (relationValue === '職場同僚') {
        document.getElementById('g_relation_colleagues').style.display = 'inline-block';
        document.getElementById('g_relation_colleagues').name = 'g_relation_detail';
    } else if (relationValue === 'その他') {
        const otherField = document.getElementById('g_relation_other');
        otherField.style.display = 'inline-block';
        otherField.name = 'g_relation_detail';
        otherField.required = true; // 필수 입력 설정
    }
}

// document.addEventListener('DOMContentLoaded', function () {
//     // 허용되지 않은 문자를 입력할 수 없도록 하는 함수
//     function preventInvalidInput(event, allowedChars, maxLength, errorMessage) {
//         const input = event.target;
//
//         // 글자 수 제한 체크
//         if (input.value.length >= maxLength) {
//             event.preventDefault();
//             showErrorMessage(input, `最大${maxLength}文字まで入力可能です。`);
//             return;
//         }
//
//         // 허용된 문자만 입력
//         const inputValue = event.data || '';  // event.data가 null일 경우 빈 문자열로 대체
//         if (inputValue && !allowedChars.test(inputValue)) {
//             event.preventDefault();
//             showErrorMessage(input, errorMessage);
//         } else {
//             clearErrorMessage(input);
//         }
//     }
//     // 오류 메시지를 표시하는 함수
//     function showErrorMessage(input, message) {
//         const existingError = input.parentNode.querySelector('.error-message');
//         if (existingError) {
//             existingError.remove();
//         }
//
//         const errorMessage = document.createElement('span');
//         errorMessage.className = 'error-message';
//         errorMessage.style.color = 'red';
//         errorMessage.style.fontSize = '12px';
//         errorMessage.style.display = 'block';
//         errorMessage.style.marginTop = '5px';
//         errorMessage.textContent = message;
//
//         input.parentNode.appendChild(errorMessage);
//     }
//
//     // 오류 메시지를 제거하는 함수
//     function clearErrorMessage(input) {
//         const existingError = input.parentNode.querySelector('.error-message');
//         if (existingError) {
//             existingError.remove();
//         }
//     }
//
//     // 각 입력 필드에 이벤트 리스너 추가
//     const kanjiInputs = [
//         document.getElementById('kana-fam'),
//         document.getElementById('kana-name')
//     ];
//
//     kanjiInputs.forEach(function (inputElement) {
//         if (inputElement) {
//             inputElement.addEventListener('beforeinput', function (event) {
//                 preventInvalidInput(event, /[\u3000-\u303F\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u0020-\u007E]/, 50);
//             });
//         }
//     });
//
//     const fields = [
//         { id: 'g_relation_other', regex: /./, maxLength: 30},
//         { id: 'eng-fam', regex: /[a-zA-Z\s]/, maxLength: 50, errorMessage: "英語のみ入力可能です。" },
//         { id: 'eng-name', regex: /[a-zA-Z\s]/, maxLength: 50, errorMessage: "英語のみ入力可能です。" },
//         { id: 'email', regex: /[a-zA-Z0-9@.]/, maxLength: 50, errorMessage: "メールアドレス形式で入力してください。" },
//         { id: 'phoneNum', regex: /[0-9\-]/, maxLength: 20, errorMessage: "数字のみ入力可能です。" },
//         { id: 'zipcode', regex: /[0-9\-]/, maxLength: 10, errorMessage: "郵便番号形式で入力してください。" },
//         { id: 'address', regex: /./, maxLength: 100},
//         { id: 'otherAllergy', regex: /./, maxLength: 100},
//         { id: 'allergyDetail', regex: /./, maxLength: 100},
//         { id: 'messageContent', regex: /./, maxLength: 300},
//         { id: 'kana-fam', regex: /[\u3000-\u303F\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u0020-\u007E]/, maxLength: 50, errorMessage: "カタカナのみ入力可能です。" },
//         { id: 'kana-name', regex: /[\u3000-\u303F\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u0020-\u007E]/, maxLength: 50, errorMessage: "カタカナのみ入力可能です。" }
//     ];
//
//     fields.forEach(function (field) {
//         const inputElement = document.getElementById(field.id);
//         if (inputElement) {
//             inputElement.addEventListener('beforeinput', function (event) {
//                 preventInvalidInput(event, field.regex, field.maxLength, field.errorMessage);
//             });
//         }
//     });

    // // 폼 제출 이벤트 리스너 추가
    // const form = document.querySelector('form');
    // form.addEventListener('submit', validateForm);
// });

// .survey-submit-button -> 위시리스트 페이지로


// 해당 조건에 반하는 항목을 입력했을 경우 error 및 scroll 모션 function
document.addEventListener('DOMContentLoaded', function () {

    // 허용되지 않은 문자를 입력할 수 없도록 하는 함수
    function preventInvalidInput(event, allowedChars, maxLength, errorMessage) {
        const input = event.target;

        // 글자 수 제한 체크
        if (input.value.length >= maxLength) {
            event.preventDefault();
            alert(`最大${maxLength}文字まで入力可能です。`);
            focusOnField(input);
            return false;
        }

        // 허용된 문자만 입력
        const inputValue = event.data || '';  // event.data가 null일 경우 빈 문자열로 대체
        if (inputValue && !allowedChars.test(inputValue)) {
            event.preventDefault();
            alert(errorMessage);
            focusOnField(input);
            return false;
        }

        return true;
    }

    // 해당 요소로 스크롤 이동 함수
    function focusOnField(element) {
        const elementOffset = $(element).offset().top;
        $('html, body').animate({
            scrollTop: elementOffset - 60
        }, 500, function () {
            $(element).focus();
        });
    }

    // 유효성 검사를 수행하는 함수
    function validateAndScroll() {
        let allValid = true;

        const fields = [
            { id: 'g_relation_other', regex: /./, maxLength: 30, errorMessage: "ご関係を入力してください" },
            { id: 'eng-fam', regex: /[a-zA-Z\s]/, maxLength: 50, errorMessage: "英語のみ入力可能です。" },
            { id: 'eng-name', regex: /[a-zA-Z\s]/, maxLength: 50, errorMessage: "英語のみ入力可能です。" },
            { id: 'email', regex: /[a-zA-Z0-9@.]/, maxLength: 50, errorMessage: "メールアドレス形式で入力してください。" },
            { id: 'phoneNum', regex: /[0-9\-]/, maxLength: 20, errorMessage: "数字のみ入力可能です。" },
            { id: 'zipcode', regex: /[0-9\-]/, maxLength: 10, errorMessage: "郵便番号形式で入力してください。" },
            { id: 'address', regex: /./, maxLength: 100, errorMessage: "住所項目を入力してください" },
            { id: 'otherAllergy', regex: /./, maxLength: 100, errorMessage: "" },
            { id: 'allergyDetail', regex: /./, maxLength: 100, errorMessage: "" },
            { id: 'messageContent', regex: /./, maxLength: 300, errorMessage: "" },
            { id: 'kana-fam', regex: /[\u3000-\u303F\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u0020-\u007E]/, maxLength: 50, errorMessage: "カタカナのみ入力可能です。" },
            { id: 'kana-name', regex: /[\u3000-\u303F\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u0020-\u007E]/, maxLength: 50, errorMessage: "カタカナのみ入力可能です。" },
            { id: 'm_fam_kanji', regex: /./, maxLength: 50, errorMessage: "お名前項目を入力してください" },
            { id: 'm_name_kanji', regex: /./, maxLength: 50, errorMessage: "お名前項目を入力してください" },
            {
                selector: "#wedding-selection .survey-selection-option.selected",
                errorMessage: "挙式・披露宴項目を選択してください"
            },
            {
                selector: "#afterparty-selection .survey-selection-option.selected",
                errorMessage: "アフターパーティー 選択してください"
            }
        ];

        // 필드별로 유효성 검사 수행
        for (let i = 0; i < fields.length; i++) {
            const field = fields[i];
            const inputElement = field.id ? document.getElementById(field.id) : $(field.selector).get(0);

            if (inputElement) {
                // 입력 필드의 제한 사항을 검사
                if (field.regex && !preventInvalidInput({ target: inputElement }, field.regex, field.maxLength, field.errorMessage)) {
                    allValid = false;
                    return false;
                }

                // 필수 입력 필드가 비어 있는지 검사
                if (!inputElement.value.trim()) {
                    alert(field.errorMessage);
                    focusOnField(inputElement);
                    allValid = false;
                    return false;
                }
            }
        }

        // g_relation_other가 필수인 경우 검사
        const otherField = document.getElementById('g_relation_other');
        if (otherField.style.display !== 'none' && !otherField.value.trim()) {
            alert("ご関係を入力してください");
            focusOnField(otherField);
            allValid = false;
            return false;
        }

        const guestTypeCheckboxes = $(".tk_survey-guestType input[name='g_guest_type']");
        const genderTypeCheckboxes = $(".tk_survey-gender input[name='m_gender']");
        let isGuestTypeChecked = guestTypeCheckboxes.is(":checked");
        let isGenderTypeChecked = genderTypeCheckboxes.is(":checked");

        if (!isGuestTypeChecked) {
            alert("ゲスト様項目をチェックしてください");
            focusOnField(guestTypeCheckboxes.first());
            allValid = false;
            return false;
        } else if (!isGenderTypeChecked) {
            alert("性別項目をチェックしてください");
            focusOnField(genderTypeCheckboxes.first());
            allValid = false;
            return false;
        }

        return allValid;
    }

    // 폼 제출 시 유효성 검사
    $(".survey-submit-button").on("click", function (event) {
        event.preventDefault(); // 폼 제출을 기본적으로 막음

        if (validateAndScroll()) {
            $("form").off("submit").submit();  // 유효성 검사를 통과하면 폼 제출
        }
    });

    // 선택된 옵션을 시각화
    $(".survey-selection-option").on("click", function () {
        $(this).siblings().removeClass("selected");
        $(this).addClass("selected");
        const hiddenField = $(this).closest(".survey-selection").siblings("input[type='hidden']");
        hiddenField.val($(this).data("value"));
    });

});


// 편지 이미지 버튼 애니메이션 및 form 태그 버튼 기능 추가 //
document.addEventListener("DOMContentLoaded", function () {

    const enMusubiEnvelope = document.querySelector(".survey-submit-button");
    const enMusubiEnvelopeTop = document.querySelector(".main-enParty-envelope-top");
    const enMusubiEnvelopePaper = document.querySelector(".main-enParty-envelope-paper");
    const enMusubiEnvelopeText = document.querySelector(".main-enMusubi-envelope-text");
    const surveyForm = document.getElementById("surveyForm");


    enMusubiEnvelope.addEventListener("click", function () {
        enMusubiEnvelopeTop.classList.add("change-color");
        enMusubiEnvelopePaper.classList.add("move-up");
        enMusubiEnvelopeText.classList.add("enlarge");
        setTimeout(function () {
            surveyForm.submit();
        }, 1000);
    });

    enMusubiEnvelopePaper.addEventListener("transitionend", function () {
        enMusubiEnvelopeTop.classList.remove("change-color");
        enMusubiEnvelopePaper.classList.remove("move-up");
        enMusubiEnvelopeText.classList.remove("enlarge");
    });

});

