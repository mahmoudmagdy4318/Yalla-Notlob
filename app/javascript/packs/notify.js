$(document).ready(() => {
  $("#notBell").on("click", (e) => {
    e.stopPropagation();
    $("#notBtn").click();
  });
});
