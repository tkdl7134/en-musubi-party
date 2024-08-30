
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/survey/allergyModal.css">
</head>
<body>
<div id="allergyModal" class="modal">
    <div class="modal_body">
        <Header>
            <div>アレルギー情報設定</div>
        </Header>
        <div class="tk_division-line-modal"></div>
        <div class="tk_allergy-title">
            <div>アレルギー情報の選択</div>
            <div>該当するアレルギーを選択してvsください</div>
        </div>
        <div class="tk_allergy-mains">
            <div class="tk_allergy-meat">
                <div class="tk_allergy-type-first">肉</div>
                <div class="tk_allergy-contents">
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="Cow">牛肉
                    </label>
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="Pig">豚肉
                    </label>
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="Chicken">鶏肉
                    </label>
                </div>
            </div>

            <div class="tk_allergy-dairyProducts">
                <div class="tk_allergy-type">乳製品</div>
                <div class="tk_allergy-contents">
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="Egg">卵
                    </label>
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="Milk">乳
                    </label>
                </div>
            </div>
            <div class="tk_allergy-type">穀物</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Cow">小麦
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Pig">そば
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">大豆
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">落花生(ピーナッツ)
                </label>
            </div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">カシューナッツ
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">くるみ
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">ごま
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">アーモンド
                </label>
            </div>
            <div class="tk_allergy-type">果物</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Cow">桃
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Pig">バナナ
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">オレンジ
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">キウイフルーツ
                </label>
            </div>
            <div class="tk_allergy-type">魚介類</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Cow">えび
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Pig">かに
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">あわび
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">いか
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">鮭
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">いくら
                </label>
            </div>
            <div class="tk_allergy-type">その他</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Cow">まつたけ
                </label>
                <label class=s"cb3">
                    <input type="checkbox" class="allergyOption" value="Pig">やまいも
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="Chicken">ゼラチン
                </label>
            </div>
        </div>

        <div class="tk_others-allergy">
            <div>該当するアレルギー情報が無い場合は、下記入力欄にアレルギー情報をご入力ください</div>
            <div>その他アレルギー情報入力</div>
            <div>
                <input type="text" id="otherAllergy" placeholder="その他のアレルギー">
            </div>
        </div>
        <div>
            <button class="tk_modal-button" id="addAllergies">追加する</button>
            <button class="tk_modal-button" id="closeModal">閉じる</button>
        </div>
    </div>
</div>
</body>
</html>