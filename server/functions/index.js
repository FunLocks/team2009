const functions = require('firebase-functions');
const admin = require("firebase-admin");
const express = require('express');

const app = express();

//データベース設定
const serviceAccount = require("./serviceAccountKey.json");
// Initialize the app with a service account, granting admin privileges
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://abcd-78830-default-rtdb.firebaseio.com/"
});
///

// globalオブジェクトに設定 外部ファイルから実行するため
global.db = admin.database();// RealTimeDatabaseのオブジェクト

//ルーター(dbを使用するためdb定義の後に宣言)
const accountRouter = require("./router/account");
const eventRouter = require("./router/event");

//////////////////////////////////////////////ルーティング
app.use('/account', accountRouter);
app.use('/event', eventRouter);
//////////////////////////////////////////////

app.get('/', (req, res) => {
    res.send('Hello ' + req.query.username);
});

// exportsしてfirebase側から呼び出してもらう
exports.app = functions.https.onRequest(app);
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });