const pay = () => {
  const form= document.getElementById("charge-form");
  form.addEventListener("submit", (e)=> {
    e.preventDefault(); // Railsにおけるフォーム送信処理をキャンセル
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);