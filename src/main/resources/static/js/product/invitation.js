// Google Maps API를 초기화하는 함수
function initMap() {
    // 첫 번째 지도 초기화
    const map1 = new google.maps.Map(document.getElementById("je_wedding-map"), {
        center: { lat: 37.5665, lng: 126.978 }, // 초기 중심점 (서울)
        zoom: 15,
    });

    // 두 번째 지도 초기화
    const map2 = new google.maps.Map(
        document.getElementById("je_reception-map"),
        {
            center: { lat: 37.5665, lng: 126.978 }, // 초기 중심점 (서울)
            zoom: 15,
        }
    );

    // 첫 번째 지도에 대한 우편번호와 주소 가져오기 및 마커 추가
    const postcode1 = document
        .getElementById("je_wedding-map")
        .getAttribute("data-postcode");
    const address1 = document
        .getElementById("je_wedding-map")
        .getAttribute("data-address");
    geocodeAddress(postcode1, address1, map1);

    // 두 번째 지도에 대한 우편번호와 주소 가져오기 및 마커 추가
    const postcode2 = document
        .getElementById("je_reception-map")
        .getAttribute("data-postcode");
    const address2 = document
        .getElementById("je_reception-map")
        .getAttribute("data-address");
    geocodeAddress(postcode2, address2, map2);
}

function geocodeAddress(postcode, address, map) {
    const geocoder = new google.maps.Geocoder();

    // 우편번호와 주소를 결합하여 지오코딩
    const fullAddress = `${postcode} ${address}`;

    geocoder.geocode({ address: fullAddress }, function (results, status) {
        if (status === "OK") {
            const location = results[0].geometry.location;

            // 마커 생성
            const marker = new google.maps.Marker({
                map: map,
                position: location,
            });

            // 지도의 중심을 마커 위치로 설정
            map.setCenter(location);

            // 마커 클릭 이벤트 추가
            google.maps.event.addListener(marker, "click", function () {
                openGoogleMaps(location);
            });

            // 지도 클릭 이벤트 추가
            google.maps.event.addListener(map, "click", function () {
                openGoogleMaps(location);
            });
        } else {
            console.error(
                "Geocode was not successful for the following reason: " + status
            );
        }
    });
}

function openGoogleMaps(location) {
    const lat = location.lat();
    const lng = location.lng();
    const isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);

    var url = "";
    if (isMobile) {
        // 모바일 디바이스에서는 구글 맵 애플리케이션이 열리도록 설정
        url = `geo:${lat},${lng}?q=${lat},${lng}`;
    } else {
        // 데스크탑에서는 구글 맵 웹사이트가 열리도록 설정
        url = `https://www.google.com/maps?q=${lat},${lng}`;
    }

    window.open(url, "_blank");
}

// -----------------------------------------------------------------------
// 사진리스트
var photo = document.getElementById("je_view-photo");
var thumbnail = document.querySelectorAll("#je_share-photos-list > li > img");

for (var i = 0; i < thumbnail.length; i++)
    thumbnail[i].addEventListener("click", function () {
        photo.style.transition = "opacity 1s ease";
        photo.style.opacity = 0.5;

        setTimeout(() => {
            photo.setAttribute("src", this.getAttribute("src"));
            photo.style.opacity = 1;
        }, 500);
    });

// -----------------------------------------------------------------------
// .main-grouplist-envelope -> 참가한 이벤트 리스트
document.addEventListener("DOMContentLoaded", function () {
    const surveyEnvelope = document.querySelector(".main-survey-envelope");
    const surveyEnvelopeTop = document.querySelector(
        ".main-survey-envelope-top"
    );
    const surveyEnvelopePaper = document.querySelector(
        ".main-survey-envelope-paper"
    );
    const surveyEnvelopeText = document.querySelector(
        ".main-survey-envelope-text"
    );

    surveyEnvelope.addEventListener("click", function () {
        surveyEnvelopeTop.classList.add("change-color");
        surveyEnvelopePaper.classList.add("move-up");
        surveyEnvelopeText.classList.add("enlarge");

        var m_id = document.getElementById('memberID').value;
        console.log(m_id); // 세션 값이 출력됩니다.
        setTimeout(function () {
            window.location.href =`/survey/${sessionScope.authenticatedMember.m_id}-${sessionScope.e_no}`;
        }, 2000);
    });

    surveyEnvelopePaper.addEventListener("transitionend", function () {
        surveyEnvelopeTop.classList.remove("change-color");
        surveyEnvelopePaper.classList.remove("move-up");
        surveyEnvelopeText.classList.remove("enlarge");
    });
});
