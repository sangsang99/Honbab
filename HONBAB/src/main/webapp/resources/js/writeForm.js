//JOIN 클릭시, join_view로 이동
document.querySelector(".scoll-down2").addEventListener("click", (e) => {
  document.querySelector(".join").scrollIntoView({ behavior: "smooth" });
});	


document.querySelector("#up").addEventListener("click", (e) => {
  document.querySelector(".img-sequence").scrollIntoView({ behavior: "smooth" });
});	
