$(document).ready(function () {
    var $slider = $('.slider-container');
    var $prevButton = $('.prev-button');
    var $nextButton = $('.next-button');
    var $checkButton = $('#check-ID');
    var totalSlides = $slider.find('.slide').length;

    $slider.slick({
        dots: true,
        infinite: false,
        arrows: false,
        draggable: false,
    });

    $slider.on('afterChange', function (event, slick, currentSlide) {
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

    $nextButton.on('click', function () {
        $slider.slick('slickNext');
    });

    $prevButton.on('click', function () {
        $slider.slick('slickPrev');
    });

    flatpickr("#birthdate", {
        dateFormat: "Y-m-d", // 내부적으로 저장되는 날짜 형식
        maxDate: "today", // 오늘 날짜까지 선택 가능
        defaultDate: "2000-01-01", // 기본 선택 날짜 설정
        altInput: true, // 대체 입력 필드 사용
        altFormat: "Y年m月d日", // UI에 표시될 일본식 날짜 형식
        locale: "ja", // 일본어 로케일 설정
    });

    // 이메일 인증 코드 전송
    $('#sendCodeButton').on('click', function () {
        var email = $('#email').val();

        $.ajax({
            url: '/api/verify-email/send-code',
            type: 'POST',
            data: { email: email },
            success: function (response) {
                alert(response);
                $('#verificationCodeGroup').show();
            },
            error: function () {
                alert('이메일 전송에 실패했습니다.');
            }
        });
    });

    // 이메일 인증 코드 확인
    $('#verifyCodeButton').on('click', function() {
        var email = $('#email').val();
        var code = $('#verificationCode').val();
        console.log(email);
        console.log(code);

        // 기존 메시지를 완전히 초기화 (내용 지우고, 스타일 리셋)
        $('#verifyMessage').text('').css('color', '');

        $.ajax({
            url: '/api/verify-email/verify-code',
            type: 'POST',
            data: { email: email, code: code },
            success: function(response) {

                console.log(response);

                if (response === 'Verification code verified successfully.') {
                    $('#verifyMessage').text('인증이 성공적으로 완료되었습니다.').css('color', 'green');
                } else {
                    $('#verifyMessage').text('인증 코드가 올바르지 않습니다.').css('color', 'red');
                }
            },
            error: function() {
                alert('인증 확인 중 오류가 발생했습니다.');
            }
        });
    });

    // 영문만 입력 가능하도록 설정
    $('#m_fam_eng, #m_name_eng').on('input', function () {
        this.value = this.value.replace(/[^a-zA-Z]/g, '');
    });

    // 전화번호 입력 제한
    $('#phone').on('input', function () {
        this.value = this.value.replace(/[^0-9\+\-]/g, '');
    });

// ID入力制限 ・ 重複確認ボタンのON&OFF
    $('#ID').on('input', function () {
        this.value = this.value.replace(/[^a-zA-Z0-9]/g, ''); // 알파벳과 숫자 이외의 문자를 제거
        var ID = this.value;
        var IDPattern = /^[A-Za-z][A-Za-z0-9]{5,19}$/;
        var feedback = '';

        console.log(ID);

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

    // ID重複確認
    $('#check-ID').on('click', function() {
        var ID = $('#ID').val();

        $.ajax({
            url: '/check-id',  // 서버에서 아이디 중복 검사를 처리하는 URL
            type: 'POST',
            data: { ID: ID },
            success: function(response) {
                if (response === '사용 가능한 아이디입니다.') {
                    $('#IDFeedback').text('사용 가능한 아이디입니다.').css('color', 'green');
                } else {
                    $('#IDFeedback').text('이미 사용 중인 아이디입니다.').css('color', 'red');
                }
            },
            error: function() {
                alert('아이디 확인 중 오류가 발생했습니다.');
            }
        });
    });

    // 패스워드 입력 제한 및 유효성 검사
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

    // 패스워드 표시/숨기기 기능
    $('#showPassword').on('change', function () {
        var passwordField = $('#password');
        if ($(this).is(':checked')) {
            passwordField.attr('type', 'text');
        } else {
            passwordField.attr('type', 'password');
        }
    });

    // 일본 우편번호를 통해 주소 자동 검색
    $('#searchAddress').on('click', function () {
        var zipcode = $('#zipcode').val().replace(/[^0-9]/g, ''); // 우편번호에서 숫자만 추출
        if (zipcode.length === 7) { // 유효한 일본 우편번호는 7자리입니다.
            $.ajax({
                url: `https://zipcloud.ibsnet.co.jp/api/search?zipcode=${zipcode}`,
                dataType: 'jsonp',
                success: function (data) {
                    if (data.results) {
                        var result = data.results[0];
                        var address = `${result.address1} ${result.address2} ${result.address3}`;
                        $('#address').val(address);
                    } else {
                        alert('해당 우편번호에 대한 주소를 찾을 수 없습니다.');
                    }
                },
                error: function () {
                    alert('주소 검색 중 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        } else {
            alert('유효한 우편번호를 입력해주세요.');
        }
    });

    // 우편번호 필드에 기본값 설정
    var defaultZipFormat = "〒000-0000";
    $('#zipcode').val(defaultZipFormat);

    // 우편번호 필드 입력 시 형식 유지
    $('#zipcode').on('input', function () {
        var inputValue = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 추출

        if (inputValue.length <= 3) {
            $(this).val('〒' + inputValue + '-' + '0000'.slice(inputValue.length));
        } else if (inputValue.length <= 7) {
            $(this).val('〒' + inputValue.slice(0, 3) + '-' + inputValue.slice(3) + '0000'.slice(inputValue.length - 3));
        } else {
            $(this).val('〒' + inputValue.slice(0, 3) + '-' + inputValue.slice(3, 7));
        }
    });

    // 포커스 시 기본 값을 지우도록 설정
    $('#zipcode').on('focus', function () {
        if ($(this).val() === defaultZipFormat) {
            $(this).val('〒');
        }
    });

    // 포커스 아웃 시 비어 있으면 기본 값으로 복원
    $('#zipcode').on('blur', function () {
        if ($(this).val() === '〒' || $(this).val() === '') {
            $(this).val(defaultZipFormat);
        }
    });

    // 등록 완료 버튼 클릭 시 폼 제출 처리
    $('#submitButton').on('click', function() {
        // 모든 입력값 수집
        var formData = {
            m_fam_kanji: $('#m_fam_kanji').val(),
            m_name_kanji: $('#m_name_kanji').val(),
            m_fam_kana: $('#m_fam_kana').val(),
            m_name_kana: $('#m_name_kana').val(),
            m_fam_eng: $('#m_fam_eng').val(),
            m_name_eng: $('#m_name_eng').val(),
            m_gender: $('input[name="gender"]:checked').val(),
            m_birth: $('#birthdate').val(),
            m_phone: $('#phone').val(),
            m_email: $('#email').val(),
            m_id: $('#username').val(),
            m_pw: $('#password').val(),
            m_zipcode: $('#zipcode').val(),
            m_address: $('#address').val() + ' ' + $('#building').val() // 주소와 건물주소 결합
        };
console.log(formData);
        // AJAX로 데이터 전송
        $.ajax({
            url: '/register/submit', // 서버의 회원가입 처리 URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                console.log(response);  // 서버 응답 확인
                if (response === 'Registration successful') {
                    var memberId = formData.m_id;
                    window.location.href = '/myInfo?m_id=' + memberId;
                } else {
                    alert('처리 중 문제가 발생했습니다.');
                }
            }
        });
    });

    $('#submitButton').hide(); // 기본적으로 숨김, 마지막 슬라이드에서만 보이도록 설정
});
