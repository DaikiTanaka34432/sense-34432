const pay = () => {
  Payjp.setPublicKey("pk_test_f67181a0fa3d0d0ec83a636d");
  const form= document.getElementById("charge-form");
  form.addEventListener("submit", (e)=> {
    e.preventDefault(); // Railsにおけるフォーム送信処理をキャンセル

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);  
  
    const card ={
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) =>{
      if  (status ==200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);