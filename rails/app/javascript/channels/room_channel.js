import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {

  // ブロードキャストされたメッセージを受け取る
  received(data) {
    // メッセージを表示する箇所の親DOMを取得
    const messages = document.getElementById('messages');

    // 受け取ったhtmlを最後に加える
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  // room_channel.rbのspeakアクションを呼び出す
  speak: function(message) {
    this.perform('speak', {message: message});
    // return this.perform('speak', {message: message});
  }
});

// enterキーが押されたら実行する
// 入力フォームの値や、キーが押された情報をイベントとして受け取れる
window.addEventListener("keypress", function(event) {

  // Enterが押されたか判定する
  if (event.keyCode === 13) {

    // 自身のspeakメソッドを実行する
    // テキストボックスに入力された値を渡す
    appRoom.speak(event.target.value);

    // 入力フォームを空にする
    e.target.value = '';

    // デフォルト動作をしないようにする
    e.preventDefault();
  }
})

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log('***** room_channle.js *****')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // return alert(data['message']);
  },

  speak: function(message) {
    // return this.perform('speak', {message: message});
  }
});
