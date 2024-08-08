$(function () {
    $("#specialDate").datepicker({
        // changeYear: true,
        // changeMonth: true,
    });
    $("#specialDate").datepicker("fadeIn", $(this).val());
});

$.datepicker.setDefaults({
    dateFormat: "yy.mm.dd DD",
    prevText: "先月",
    nextText: "来月",
    monthNames: [
        "1月",
        "2月",
        "3月",
        "4月",
        "5月",
        "6月",
        "7月",
        "8月",
        "9月",
        "10月",
        "11月",
        "12月",
    ],
    monthNamesShort: [
        "1月",
        "2月",
        "3月",
        "4月",
        "5月",
        "6月",
        "7月",
        "8月",
        "9月",
        "10月",
        "11月",
        "12月",
    ],
    dayNames: ["日", "月", "火", "水", "木", "金", "土"],
    dayNamesShort: ["日", "月", "火", "水", "木", "金", "土"],
    dayNamesMin: ["日", "月", "火", "水", "木", "金", "土"],
    showMonthAfterYear: true,
    yearSuffix: "年",
});

//------------------------------------------------------------------------

$(document).ready(function () {
    // 결혼식 시작 시간
    $("#timepickerM").timepicker({
        timeFormat: "HH:mm",
        interval: 10,
        minTime: "10:00",
        maxTime: "20:00",
        startTime: "10:00",
        dynamic: false,
        dropdown: true,
        scrollbar: false,
        change: function (time) {
            var formattedTime =
                time.getHours().toString().padStart(2, "0") + //TIME 객체에서 시각 가져오기
                ":" +
                time.getMinutes().toString().padStart(2, "0"); //TIME 객체에서 분 가져오기
            $("#je_mainEvent-time").text(formattedTime); // 선택된 시간을 출력할 div에 반영
        },
    });
    // 결혼식 모임 시간
    $("#timepickerMa").timepicker({
        timeFormat: "HH:mm",
        interval: 10,
        minTime: "10:00",
        maxTime: "20:00",
        startTime: "10:00",
        dynamic: false,
        dropdown: true,
        scrollbar: false,
        change: function (time) {
            var formattedTime =
                time.getHours().toString().padStart(2, "0") + //TIME 객체에서 시각 가져오기
                ":" +
                time.getMinutes().toString().padStart(2, "0"); //TIME 객체에서 분 가져오기
            $("#je_mainEvent-gatherTime").text("集合 " + " " + formattedTime); // 선택된 시간을 출력할 div에 반영
        },
    });
    // 피로연 시작시간
    $("#timepicker-r").timepicker({
        timeFormat: "HH:mm",
        interval: 10,
        minTime: "10:00",
        maxTime: "20:00",
        startTime: "10:00",
        dynamic: false,
        dropdown: true,
        scrollbar: false,
        change: function (time) {
            var formattedTime =
                time.getHours().toString().padStart(2, "0") + //TIME 객체에서 시각 가져오기
                ":" +
                time.getMinutes().toString().padStart(2, "0"); //TIME 객체에서 분 가져오기
            $(" #je_sideEvent-time").text(formattedTime); // 선택된 시간을 출력할 div에 반영
        },
    });

    // 피로연 모임 시간
    $("#timepicker-ra").timepicker({
        timeFormat: "HH:mm",
        interval: 10,
        minTime: "10:00",
        maxTime: "20:00",
        startTime: "10:00",
        dynamic: false,
        dropdown: true,
        scrollbar: false,
        change: function (time) {
            var formattedTime =
                time.getHours().toString().padStart(2, "0") + //TIME 객체에서 시각 가져오기
                ":" +
                time.getMinutes().toString().padStart(2, "0"); //TIME 객체에서 분 가져오기
            $("#je_sideEvent-gatherTime").text("集合 " + " " + formattedTime); // 선택된 시간을 출력할 div에 반영
        },
    });
});
