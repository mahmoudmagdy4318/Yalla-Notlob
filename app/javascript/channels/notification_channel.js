import consumer from "./consumer";

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    console.log("notification barrier is settled!");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("data:", data);
    $("#notfdiv").text(data.content);
    // Called when there's incoming data on the websocket for this channel
  },
});
