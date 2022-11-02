//이미지 클릭시, login_join_view로 이동
document.querySelector(".scoll-down1").addEventListener("click", (e) => {
  document.querySelector(".login_join_view").scrollIntoView({ behavior: "smooth" });
});

//JOIN 클릭시, join_view로 이동
document.querySelector(".scoll-down2").addEventListener("click", (e) => {
  document.querySelector(".join_view").scrollIntoView({ behavior: "smooth" });
});