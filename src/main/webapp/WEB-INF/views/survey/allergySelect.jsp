
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/survey/allergyModal.css">
</head>
<body>
<div id="allergyModal" class="modal">
    <div class="modal_body">
        <Header>
            <div>アレルギー情報設定</div>
        </Header>
    <div class="tk_allergy-title">
        <div>アレルギー情報の選択</div>
        <div>該当するアレルギーを選択してください</div>
    </div>
    <div class="tk_allergy-mains">
        <div class="tk_allergy-meat">
            <div class="tk_allergy-type">肉</div>
            <div class="tk_allergy-contents">
                <label>
                    <input type="checkbox" class="allergyOption" value="Cow">牛肉
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Pig">豚肉
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Chicken">鶏肉
                </label>
            </div>
        </div>

        <div class="tk_allergy-dairyProducts">
            <div class="tk_allergy-type">乳製品</div>
            <div class="tk_allergy-contents">
                <label>
                    <input type="checkbox" class="allergyOption" value="Egg">卵
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Milk">乳
                </label>
            </div>
        </div>

        <div class="tk_allergy-meat">
            <div class="tk_allergy-type">穀物</div>
            <div class="tk_allergy-contents">
                <label>
                    <input type="checkbox" class="allergyOption" value="Cow">小麦
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Pig">そば
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Chicken">大豆
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Chicken">落花生(ピーナッツ)
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Chicken">カシューナッツ
                </label>
                <br>
                <label>
                    <input type="checkbox" class="allergyOption" value="Chicken">くるみ
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Chicken">ごま
                </label>
                <label>
                    <input type="checkbox" class="allergyOption" value="Chicken">鶏肉
                </label>
            </div>
        </div>

        <input type="text" id="otherAllergy" placeholder="その他のアレルギー">

        <button class="tk_modal-button" id="addAllergies">追加する</button>
        <button class="tk_modal-button" id="closeModal">閉じる</button>

    </div>
    </div>
</div>
</body>
</html>