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
    $("#notMenu").append(data.content.body);
    $("#notCount").text(eval($("#notCount").text()) + 1);
    // Called when there's incoming data on the websocket for this channel
  },
});
