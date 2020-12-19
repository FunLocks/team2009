//express初期化
const express = require('express');
const app = express();
//body-parser
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
//router作成
const router = express.Router();//ルーティング処理を複数ファイルに分けるときに使用するもの

//ref作成
userRef = db.ref("/users");

//uidも返すようにする
router.post('/login', function (req, res) {
    const reqname = req.body.name;
    const reqpass = req.body.pass;
    userRef.orderByChild('name')
        .startAt(reqname)
        .endAt(reqname)
        .once('value')
        .then(function (dataSnapshot) {
            var snapPass;
            var snapUid;
            dataSnapshot.forEach(function (children) {
                snapPass = children.val().pass;
                snapUid = children.val().uid;
            });
            if (snapPass == reqpass) {
                console.log("log1");
                //認証完了
                const obj = {
                    name: reqname,
                    pass: reqpass,
                    uid: snapUid
                };
                const json = JSON.stringify(obj);
                res.send(json);
            }
            else {
                console.log("log2");
                //パスワードが正しくない
                res.send("error");
            }
        })
        .catch((err) => {
            //ユーザー名が正しくない
            res.send("error");
        });
});
//uidも返す
router.post('/register', (req, res) => {
    //userをデータベースに登録
    const name = req.body.name;
    const pass = req.body.pass;
    const onlinegame = req.body.onlinegame;
    const trpg = req.body.trpg;
    const cardgame = req.body.cardgame;
    const meeting = req.body.meeting;
    const presentation = req.body.presentation;
    const textchat = req.body.textchat;
    //push
    const newUserRef = userRef.push();
    const uid = newUserRef.key;
    newUserRef.set({
        name: name,
        pass: pass,
        uid: uid,
        interest: {
            onlinegame: onlinegame,
            trpg: trpg,
            cardgame: cardgame,
            meeting: meeting,
            presentation: presentation,
            textchat: textchat
        }
    }, (error) => {
        if (error) res.send("error");
        else {
            const obj = {
                name: name,
                pass: pass,
                uid: uid
            };
            const json = JSON.stringify(obj);
            res.send(json);
        }
    });
});
module.exports = router;