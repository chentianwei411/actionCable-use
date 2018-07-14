if (document.getElementsByName("current-user").length > 0) {
  App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
    // 也可以写在函数里，只有true的时候才能连接。
    // shouldConnect: function() {
    //   return document.getElementsByName("current-user").length > 0;
    // }

    connected: function() {
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      // $("#notifications").prepend(data.html);
      var para = document.createElement('div')
      document.getElementById("notifications").appendChild(para)
      document.getElementById("notifications").lastChild.innerHTML = data.html
    }
  });
}
