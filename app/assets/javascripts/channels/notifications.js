App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    // document.getElementById("notifications").innerHTML = data.html;
    // 👆的只是取代，不能增加节点，我像知道如何增加子节点。
    $("#notifications").prepend(data.html);
  }
});
