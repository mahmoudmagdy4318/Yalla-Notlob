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
    let user_id = document.cookie.split("=")[
      document.cookie.split("=").length - 1
    ];
    let newNot;
    if (user_id == data.content.user_id) {
      if (data.content.btn == "join") {
        newNot = `
      <div class="row bg-secondary">
        <span class="dropdown-item">${data.content.body}</span>
        <span>
              <span class="notifySpan" >${data.content.id}<span>
              <a class="btn btn-info joinBtn" id=${data.content.id} style="cursor:pointer;" 
                 >${data.content.btn}
              </a>
        </span>
      </div>
      `;
      } else if (data.content.btn == "show") {
        newNot = `
      <div class="row bg-secondary">
        <span class="dropdown-item">${data.content.body}</span>
        <span>
              <span class="notifySpan">${data.content.id}<span>
              <a class="btn btn-secondary notifyBtn" style="cursor:pointer;" 
                 href="/orders/${data.content.order_id}">${data.content.btn}
              </a>
        </span>
      </div>
      `;
      }
      $("#notMenu").append(newNot);
      $("#notCount").text(eval($("#notCount").text()) + 1);
    }
    // Called when there's incoming data on the websocket for this channel
  },
});
