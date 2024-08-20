$(document).ready(function () {
    // --- 전체 슬라이드에 공통으로 사용되는 기능 ---

    // 메시지를 일정 시간 후에 사라지게 하는 함수 정의
    function showMessageWithTimeout(elementId, message, timeout) {
        var element = $('#' + elementId);
        element.text(message).show(); // 메시지를 표시

        setTimeout(function() {
            element.fadeOut(); // 일정 시간 후 메시지를 사라지게 함
        }, timeout);
    }

    var $slider = $('.slider-container');
    var $prevButton = $('.prev-button');
    var $nextButton = $('.next-button');
    var $checkButton = $('#check-ID');
    var totalSlides = $slider.find('.slide').length;
    var emailVerified = false;  // 이메일 인증 상태 추적 변수

    // 슬라이더 설정 (전체 슬라이드)
    $slider.slick({
        dots: true,
        infinite: false,
        arrows: false,
        draggable: false,
    });

    // 슬라이드 변경 시 이전 및 다음 버튼 상태 제어 (전체 슬라이드)
    $slider.on('afterChange', function (event, slick, currentSlide) {
        updateNextButtonState(currentSlide);
        if (currentSlide === 0) {
            $prevButton.hide();
        } else {
            $prevButton.show();
        }

        if (currentSlide === totalSlides - 1) {
            $nextButton.hide();
            $('#submitButton').show(); // 마지막 슬라이드에서 등록 완료 버튼 보이기
        } else {
            $nextButton.show();
            $('#submitButton').hide(); // 다른 슬라이드에서 등록 완료 버튼 숨기기
        }
    });

    // 다음 버튼 클릭 시 다음 슬라이드로 이동 (전체 슬라이드)
    $nextButton.on('click', function () {
        $slider.slick('slickNext');
    });

    // 이전 버튼 클릭 시 이전 슬라이드로 이동 (전체 슬라이드)
    $prevButton.on('click', function () {
        $slider.slick('slickPrev');
    });

    // 입력란의 변경을 감지하여 다음 버튼 활성화 상태 업데이트 (전체 슬라이드)
    $('.slide :input').on('input change', function () {
        var currentSlide = $slider.slick('slickCurrentSlide');
        updateNextButtonState(currentSlide);
    });

    // 다음 버튼 활성화 상태 업데이트 함수 (전체 슬라이드)
    function updateNextButtonState(currentSlide) {
        var $currentInputs = $slider.find('.slide').eq(currentSlide).find(':input');
        var allFilled = true;

        $currentInputs.each(function () {
            if ($(this).val().trim() === '') {
                allFilled = false;
                return false;
            }
        });

        // 이메일 인증 확인 추가 (슬라이드 3의 경우)
        if (currentSlide === 2 && !emailVerified) {
            allFilled = false;
        } else if (currentSlide === 2 && emailVerified) {
            allFilled = true;
        }

        console.log('All inputs filled', allFilled);

    console.log(currentSlide)
        if (currentSlide === 3 && $("#IDFeedback").text() !== "사용 가능한 아이디입니다." && $("#passwordFeedback").text() !== '사용 가능한 패스워드입니다.') {
            allFilled = false;
            console.log('돌고나서 true')
        } else if (currentSlide === 3 && $('#IDFeedback').text() === '사용 가능한 아이디입니다.' && $('#passwordFeedback').text() === '사용 가능한 패스워드입니다.'){
            allFilled = true;
            console.log('돌고나서 false')
        }
        $nextButton.prop('disabled', !allFilled);
        console.log('Next button disabled state', $nextButton.prop('disabled'));
    }

    // 초기 상태에서 첫 슬라이드의 버튼 비활성화 확인
    updateNextButtonState(0);

    // --- 슬라이드 1: 영문 이름 입력 기능 ---

    // 영문 이름 입력 시 영문만 입력 가능하도록 설정 (슬라이드 1)
    $('#m_fam_eng, #m_name_eng').on('input', function () {
        this.value = this.value.replace(/[^a-zA-Z]/g, '');
    });

    // --- 슬라이드 2: 생년월일 입력 제한 기능 ---

    // 연도 입력 제한 (슬라이드 2)
    document.getElementById('year').addEventListener('input', function() {
        var year = parseInt(this.value, 10);

        if (this.value.length === 4) { // 네 자리 숫자일 때만 검증
            if (year < 1924 || year > 2006) {
                this.value = ''; // 범위를 벗어나면 값을 지움
                showMessageWithTimeout('yearError', '입력하신 연도를 다시 한 번 더 확인 부탁드립니다.', 3000);
            } else {
                $('#yearError').text(''); // 오류 메시지 지우기
            }
        }
    });

    // 월 입력 제한 (슬라이드 2)
    document.getElementById('month').addEventListener('input', function() {
        var month = parseInt(this.value, 10);

        if (month < 1 || month > 12) {
            this.value = ''; // 1~12가 아니면 값을 지움
            showMessageWithTimeout('monthError', '월은 1월부터 12월 사이여야 합니다.', 3000);
        } else {
            $('#monthError').text(''); // 오류 메시지 지우기
        }
    });

    // 일 입력 제한 (슬라이드 2)
    document.getElementById('day').addEventListener('input', function() {
        var day = parseInt(this.value, 10);
        var month = parseInt(document.getElementById('month').value, 10);
        var year = parseInt(document.getElementById('year').value, 10);

        // 월과 연도가 모두 유효한 경우에만 유효한 일수를 계산
        if (!isNaN(month) && month >= 1 && month <= 12 && !isNaN(year) && year >= 1924 && year <= 2006) {
            var daysInMonth = new Date(year, month, 0).getDate(); // 해당 월의 최대 일수 계산

            if (isNaN(day) || day < 1 || day > daysInMonth) {
                this.value = ''; // 유효한 일이 아니면 값을 지움
                showMessageWithTimeout('dayError', '일은 1일부터 ' + daysInMonth + '일 사이여야 합니다.', 3000);
            } else {
                $('#dayError').text(''); // 오류 메시지 지우기
            }
        } else {
            this.value = ''; // 유효하지 않은 월 또는 연도일 경우 일 값도 초기화
            showMessageWithTimeout('dayError', '유효한 월과 연도를 먼저 입력하세요.', 3000);
        }
    });

    // --- 슬라이드 3: 전화번호 및 이메일 인증 기능 ---

    // 전화번호 입력 제한 (슬라이드 3)
    document.getElementById('phone').addEventListener('input', function() {
        var phone = this.value.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거

        if (phone.length < 3) {
            // 숫자 3자리 이하 입력 시 그대로 표시
            this.value = phone;
        } else if (phone.length < 7) {
            // 3~7자리 입력 시 '000-0000' 형식으로 표시
            this.value = phone.slice(0, 3) + '-' + phone.slice(3);
        } else if (phone.length <= 11) {
            // 8~11자리 입력 시 '000-0000-0000' 형식으로 표시
            this.value = phone.slice(0, 3) + '-' + phone.slice(3, 7) + '-' + phone.slice(7);
        } else {
            // 11자리 이상 입력 방지
            this.value = phone.slice(0, 3) + '-' + phone.slice(3, 7) + '-' + phone.slice(7, 11);
        }
    });

    // 이메일 인증 코드 전송 (슬라이드 3)
    $('#sendCodeButton').on('click', function () {
        var email = $('#email').val().trim(); // 이메일 입력값에서 공백 제거

        if (email === "") {
            showMessageWithTimeout('emailError', '이메일 주소를 입력해주세요.', 3000); // 이메일이 비어있을 경우 경고 메시지 표시
            $('#verificationCodeGroup').hide(); // 인증 코드 입력란 숨기기
        } else {
            $('#emailError').text(''); // 오류 메시지 지우기
            $.ajax({
                url: '/api/verify-email/send-code',
                type: 'POST',
                data: { email: email },
                success: function (response) {
                    console.log("Email sent successfully:", response);
                    showMessageWithTimeout('emailSuccess', response, 3000); // 성공 메시지 표시
                    $('#verificationCodeGroup').show(); // 이메일 전송이 성공하면 인증 코드 입력란 보이기
                },
                error: function () {
                    console.log("Email sending failed.");
                    showMessageWithTimeout('emailError', '이메일 전송에 실패했습니다.', 3000);
                    $('#verificationCodeGroup').hide(); // 전송 실패 시에도 인증 코드 입력란 숨기기
                }
            });
        }
    });

    // 이메일 인증 코드 확인 (슬라이드 3)
    $('#verifyCodeButton').on('click', function () {
        var email = $('#email').val().trim(); // 이메일 입력값에서 공백 제거
        var code = $('#verificationCode').val();

        // 기존 메시지를 완전히 초기화 (내용 지우고, 스타일 리셋)
        $('#verifyMessage').text('').css('color', '');

        $.ajax({
            url: '/api/verify-email/verify-code',
            type: 'POST',
            data: { email: email, code: code },
            success: function (response) {
                if (response === 'Verification code verified successfully.') {
                    $('#verifyMessage').text('인증이 성공적으로 완료되었습니다.').css('color', 'green');
                    emailVerified = true;  // 이메일 인증 성공 시 상태 업데이트
                    console.log('Verification successful, updating next button state');
                    updateNextButtonState($slider.slick('slickCurrentSlide')); // 인증 코드가 확인되면 버튼 상태 업데이트
                } else {
                    showMessageWithTimeout('verifyMessage', '인증 코드가 올바르지 않습니다.', 3000);
                    emailVerified = false;
                }
            },
            error: function () {
                showMessageWithTimeout('verifyMessage', '인증 확인 중 오류가 발생했습니다.', 3000);
                emailVerified = false;
            }
        });
    });

    // --- 슬라이드 4: 아이디 및 패스워드 입력 기능 ---

    // 아이디 입력 제한 및 중복 확인 버튼 활성화/비활성화 (슬라이드 4)
    $('#ID').on('input', function () {
        this.value = this.value.replace(/[^a-zA-Z0-9]/g, ''); // 알파벳과 숫자 이외의 문자를 제거
        var ID = this.value;
        var IDPattern = /^[A-Za-z][A-Za-z0-9]{5,19}$/;
        var feedback = '';

        if (ID.length < 6 || ID.length > 20) {
            feedback = '아이디는 6자 이상, 20자 이하로 입력해야 합니다.';
            $checkButton.prop('disabled', true); // 중복 확인 버튼 비활성화
        } else if (!IDPattern.test(ID)) {
            feedback = '아이디는 알파벳으로 시작하고 숫자만 포함할 수 있습니다.';
            $checkButton.prop('disabled', true); // 중복 확인 버튼 비활성화
        } else {
            feedback = '';
            $checkButton.prop('disabled', false); // 중복 확인 버튼 활성화
        }

        $('#IDFeedback').text(feedback);
    });

    // 아이디 중복 확인 (슬라이드 4)
    $('#check-ID').on('click', function () {
        var ID = $('#ID').val();

        console.log(ID);

        $.ajax({
            url: '/check-id',  // 서버에서 아이디 중복 검사를 처리하는 URL
            type: 'POST',
            data: { ID: ID },
            success: function (response) {
                if (response === '사용 가능한 아이디입니다.') {
                    $('#IDFeedback').text('사용 가능한 아이디입니다.').css('color', 'green');
                } else {
                    $('#IDFeedback').text('이미 사용 중인 아이디입니다.').css('color', 'red');
                }
            },
            error: function () {
                $('#IDFeedback').text('아이디 확인 중 오류가 발생했습니다.').css('color', 'red');
            }
        });
    });

    // 패스워드 입력 제한 및 유효성 검사 (슬라이드 4)
    $('#password').on('input', function () {
        var password = this.value;
        var feedback = '';
        var minLength = 8;
        var maxLength = 32;
        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,32}$/;

        if (password.length < minLength) {
            feedback = '패스워드는 최소 8자 이상이어야 합니다.';
        } else if (password.length > maxLength) {
            feedback = '패스워드는 최대 32자 이하이어야 합니다.';
        } else if (!regex.test(password)) {
            feedback = '패스워드는 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.';
        } else {
            feedback = '사용 가능한 패스워드입니다.';
        }

        $('#passwordFeedback').text(feedback);

    });


//     // 이메일 인증 확인 추가 (슬라이드 3의 경우)
//     if (currentSlide === 2 && !emailVerified) {
//         allFilled = false;
//     } else if (currentSlide === 2 && emailVerified) {
//         allFilled = true;
//     }
//
//     console.log('All inputs filled', allFilled);
//     $nextButton.prop('disabled', !allFilled);
//     console.log('Next button disabled state', $nextButton.prop('disabled'));
// }


    // 패스워드 표시/숨기기 기능 (슬라이드 4)
    $('#showPassword').on('change', function () {
        var passwordField = $('#password');
        if ($(this).is(':checked')) {
            passwordField.attr('type', 'text');
        } else {
            passwordField.attr('type', 'password');
        }
    });

    // --- 슬라이드 5: 일본 우편번호를 통해 주소 자동 검색 기능 ---

    // 일본 우편번호를 통해 주소 자동 검색 (슬라이드 5)
    $('#searchAddress').on('click', function () {
        var zipcode = $('#zipcode').val().replace(/[^0-9]/g, ''); // 우편번호에서 숫자만 추출
        if (zipcode.length === 7) {
            $.ajax({
                url: `https://zipcloud.ibsnet.co.jp/api/search?zipcode=${zipcode}`,
                dataType: 'jsonp',
                success: function (data) {
                    if (data.results) {
                        var result = data.results[0];

                        // 첫 번째 입력란에 도도부현(都道府県) + 시구정촌(市区町村) 정보 입력
                        var stateCity = `${result.address1} ${result.address2}`;
                        $('#state-city').val(stateCity);

                        // 두 번째 입력란에 정명(町名) 정보 입력
                        var townArea = `${result.address3}`;
                        $('#town').val(townArea);

                        // 세 번째 입력란은 사용자가 직접 입력해야 하므로 건드리지 않음
                    } else {
                        showMessageWithTimeout('zipcodeError', '해당 우편번호에 대한 주소를 찾을 수 없습니다.', 3000);
                    }
                },
                error: function () {
                    showMessageWithTimeout('zipcodeError', '주소 검색 중 오류가 발생했습니다. 다시 시도해주세요.', 3000);
                }
            });
        } else {
            showMessageWithTimeout('zipcodeError', '유효한 우편번호를 입력해주세요.', 3000);
        }
    });

    // 우편번호 필드에 기본값 설정 (슬라이드 5)
    var defaultZipFormat = "〒000-0000";
    $('#zipcode').val(defaultZipFormat);

    // 우편번호 필드 입력 시 형식 유지 및 자동 포맷팅 (슬라이드 5)
    $('#zipcode').on('input', function () {
        var inputValue = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 추출

        if (inputValue.length <= 3) {
            // 숫자가 3자리 미만이면 그 숫자만 표시
            $(this).val('〒' + inputValue);
        } else if (inputValue.length <= 7) {
            // 3자리 입력되면 '-' 추가하고 나머지 숫자 표시
            $(this).val('〒' + inputValue.slice(0, 3) + '-' + inputValue.slice(3));
        } else {
            // 7자리 이상 입력되면 7자리까지만 유지
            $(this).val('〒' + inputValue.slice(0, 3) + '-' + inputValue.slice(3, 7));
        }
    });

    // 포커스 시 기본 값을 지우도록 설정 (슬라이드 5)
    $('#zipcode').on('focus', function () {
        if ($(this).val() === "〒000-0000") {
            $(this).val('〒');
        }
    });

    // 포커스 아웃 시 비어 있으면 기본 값으로 복원 (슬라이드 5)
    $('#zipcode').on('blur', function () {
        if ($(this).val() === '〒' || $(this).val() === '') {
            $(this).val("〒000-0000");
        }
    });

    // --- 마지막 슬라이드: 등록 완료 버튼 클릭 시 폼 제출 기능 ---

    // 등록 완료 버튼 클릭 시 폼 제출 처리 (전체 슬라이드)
    $('#submitButton').on('click', function () {
        // 모든 입력값 수집
        var formData = {
            m_id: $('#ID').val(),
            m_pw: $('#password').val(),
            m_fam_kanji: $('#m_fam_kanji').val(),
            m_name_kanji: $('#m_name_kanji').val(),
            m_fam_kana: $('#m_fam_kana').val(),
            m_name_kana: $('#m_name_kana').val(),
            m_fam_eng: $('#m_fam_eng').val(),
            m_name_eng: $('#m_name_eng').val(),
            m_birth: $('#year').val() + '-' + $('#month').val().padStart(2, '0') + '-' + $('#day').val().padStart(2, '0'), // 연, 월, 일을 합쳐서 m_birth 생성
            m_gender: $('input[name="gender"]:checked').val(),
            m_email: $('#email').val(),
            m_phone: $('#phone').val(),
            m_address: $('#state-city').val() + ' ' + $('#town').val() + ' ' + $('#building').val(),
            m_zipcode: $('#zipcode').val(),
        };

        // 여기서 formData를 서버에 전송하거나 처리할 수 있습니다.
        console.log('Button clicked');
        console.log(formData); // formData 확인용 콘솔 출력

        // AJAX로 데이터 전송
        $.ajax({
            url: '/register/submit', // 서버의 회원가입 처리 URL
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function (response) {
                console.log(response);  // 서버 응답 확인
                if (response === 'Registration successful') {
                    var memberId = formData.m_id;
                    window.location.href = '/myInfo?m_id=' + memberId;
                } else {
                    showMessageWithTimeout('submitError', '처리 중 문제가 발생했습니다.', 3000);
                }
            }
        });
    });

    $('#submitButton').hide(); // 기본적으로 숨김, 마지막 슬라이드에서만 보이도록 설정
});
