const express = require('express');
const app = express();
//body-parser
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

eventRef = db.ref('/events');
userRef = db.ref("/users");

const router = express.Router();//ルーティング処理を複数ファイルに分けるときに使用するもの
//イベント投稿
router.post('/', (req, res) => {//index.jsのapp.useの時点で"/event"が与えられているので、"/"だけでいい！！
    //データベースにイベント追加
    const name = req.body.name;
    const useruid = req.body.useruid;
    const title = req.body.title;
    const year = req.body.year;
    const month = req.body.month;
    const day = req.body.day;
    const hours = req.body.hours;
    const minutes = req.body.minutes;
    const url = req.body.url;
    const text = req.body.text;
    const category = req.body.category;
    console.log("aaa");
    const newEventRef = eventRef.push();
    const uid = newEventRef.key;
    newEventRef.set({
        title: title,
        url: url,
        maker: name,
        text: text,
        year: year,
        month: month,
        day: day,
        hours: hours,
        minutes: minutes,
        category: category,
        participant: 0,
        uid: uid
    }, (error) => {
        if (error) {
            console.log(error)
            res.send("error");
        } else {
            const obj = {
                title: title,
                url: url,
                maker: name,
                text: text,
                year: year,
                month: month,
                day: day,
                hours: hours,
                minutes: minutes,
                category: category,
                participant: 0,
                uid: uid
            };
            //userのイベントにも登録しておく！
            userRef.child(useruid).child("myevent").push().set({
                eventuid: uid
            }, (error) => {
                if (error) { res.send("error"); }
            });
            const json = JSON.stringify(obj);
            res.send(json);
        }
    });
});

//イベント情報取得
router.get('/', (req, res) => {
    const eventuid = req.query.eventuid;
    eventRef.child(eventuid).once('value')
        .then(function (dataSnapshot) {
            res.send(dataSnapshot.toJSON());
        })
        .catch((err) => {
            res.send(err);
        });
});

//おすすめイベント取得、興味度で割合表示
router.get('/recommend', (req, res) => {
    const useruid = req.query.useruid;
    const eventnum = req.query.eventnum;
    //ユーザー名から興味度を取得、興味度が一番高いイベントを取得
    userRef.child(useruid).child("interest").once("value")
        .then(function (dataSnapshot) {
            var snapOnlinegame = dataSnapshot.val().onlinegame;
            var snapTrpg = dataSnapshot.val().trpg;
            var snapCardgame = dataSnapshot.val().cardgame;
            var snapMeeting = dataSnapshot.val().meeting;
            var snapPresentation = dataSnapshot.val().presentation;

            var numArray = [snapOnlinegame, snapTrpg, snapCardgame, snapMeeting, snapPresentation];
            var max = 0;
            var maxindex = 0;
            for (let i = 0; i < numArray.length; i++) {
                if (max < numArray[i]) {
                    max = numArray[i];
                    maxindex = i;
                }
            }
            console.log(max);
            console.log(maxindex);
            var valArray = [];
            switch (maxindex) {
                case 0:
                    eventRef.orderByChild("category").startAt('onlinegame').endAt('onlinegame').limitToFirst(parseInt(eventnum))
                        .once("value").then((dataSnapshot) => {
                            dataSnapshot.forEach(function (children) {
                                valArray.push(children.val());
                            });
                            res.send(valArray);
                        }).catch((err) => {
                            res.send("error");
                        });
                    break;
                case 1:
                    console.log("1case");
                    console.log(eventnum);
                    //limitToFirstは足りないとerror
                    eventRef.orderByChild("category").startAt('trpg').endAt('trpg').limitToFirst(parseInt(eventnum))
                        .once("value").then(function (dataSnapshot) {
                            dataSnapshot.forEach(function (children) {
                                valArray.push(children.val());
                            });
                            res.send(valArray);//送信形式を検討
                        }).catch((err) => {
                            res.send("error");
                        });
                    break;
                case 2:
                    eventRef.orderByChild("category").startAt('cardgame').endAt('cardgame').limitToFirst(parseInt(eventnum))
                        .once("value").then((dataSnapshot) => {
                            dataSnapshot.forEach(function (children) {
                                valArray.push(children.val());
                            });
                            res.send(valArray);
                        }).catch((err) => {
                            res.send("error");
                        });
                    break;
                case 3:
                    eventRef.orderByChild("category").startAt('meeting').endAt('meeting').limitToFirst(parseInt(eventnum))
                        .once("value").then((dataSnapshot) => {
                            dataSnapshot.forEach(function (children) {
                                valArray.push(children.val());
                            });
                            res.send(valArray);
                        }).catch((err) => {
                            res.send("error");
                        });
                    break;
                case 4:
                    eventRef.orderByChild("category").startAt('presentation').endAt('presentation').limitToFirst(parseInt(eventnum))
                        .once("value").then((dataSnapshot) => {
                            dataSnapshot.forEach(function (children) {
                                valArray.push(children.val());
                            });
                            res.send(valArray);
                        }).catch((err) => {
                            res.send("error");
                        });
                    break;
            }
        })
        .catch((err) => {
            res.send(err);
        });
});


//タイトルを簡易検索(前方一致検索)
router.get('/search', (req, res) => {
    //データベースから情報取得して追加
    const text = req.query.text;
    eventRef.orderByChild('title').startAt(text).endAt(text + '\uf8ff').once('value')
        .then(function (dataSnapshot) {
            var Array = [];
            dataSnapshot.forEach(function (children) {
                Array.push(children.val());
            });
            res.send(Array);
        })
        .catch((err) => {
            res.send(err);
        });
});

//イベントに参加登録。イベントを検索して、ユーザの名前を追加、
router.post('/join', (req, res) => {
    const eventuid = req.body.eventuid;
    const useruid = req.body.useruid;
    //userにそのイベントがすでに入っているか確認する必要あり！

    userRef.child(useruid).child("myevent").orderByChild("eventuid").startAt(eventuid).endAt(eventuid).once("value")
        .then(function (dataSnapshot) {
            var datanum = 0;
            dataSnapshot.forEach(function (children) {
                datanum++;
            });
            if (datanum == 0) {
                userRef.child(useruid).child("myevent").push().set({
                    eventuid: eventuid
                }, (error) => {
                    if (error) { res.send("error"); }
                });
                //イベントの参加人数を増やす
                eventRef.child(eventuid).once('value')
                    .then(function (dataSnapshot) {
                        const nowpart = dataSnapshot.val().participant;
                        const updatepart = nowpart + 1;
                        eventRef.child(eventuid).update({
                            participant: updatepart
                        });
                    })
                    .catch((err) => {
                        res.send(err);
                    });
                res.send("ok");

            }
            else { res.send("alreadyJoin"); }
        })
        .catch((err) => {
            res.send(err);
        });




});

module.exports = router;