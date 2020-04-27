$(document).ready(() => {
  $("#notBell").on("click", (e) => {
    e.stopPropagation();
    $("#notBtn").click();
    let user_id = document.cookie.split("=")[
      document.cookie.split("=").length - 1
    ];
    $.ajax({
      url: "/notification/nots",
      type: "GET",
      dataType: "json",
      beforeSend: function (xhr) {
        xhr.setRequestHeader(
          "X-CSRF-Token",
          $('meta[name="csrf-token"]').attr("content")
        );
      },
      data: { user_id: user_id },
      success: function (data) {
        $("#notCount").text(0);
      },
      error: function (err) {
        console.log("erororor");
      },
    });
  });

  $(".joinBtn").on("click", (e) => {
    console.log(e.target.id);
    let user_id = document.cookie.split("=")[
      document.cookie.split("=").length - 1
    ];
    $.ajax({
      url: "/notification/join",
      type: "GET",
      dataType: "json",
      beforeSend: function (xhr) {
        xhr.setRequestHeader(
          "X-CSRF-Token",
          $('meta[name="csrf-token"]').attr("content")
        );
      },
      data: { id: e.target.id, user_id: user_id },
      success: function (data) {
        window.location.href = `/orders/${data.success}`;
      },
      error: function (err) {
        console.log("erororor");
      },
    });
  });
});
