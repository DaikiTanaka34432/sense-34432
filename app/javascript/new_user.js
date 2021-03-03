 function select () {
    // ユーザー選択の要素を取得
    const userSelect = document.querySelector("#user_select");
    
    userSelect.addEventListener('change', function(){
      let num = userSelect.selectedIndex;
      if (num === 1 ) {
        // 芸人専用入力フォームの要素を取得＆display表示したまま
        document.getElementById("office").style.display="block";
        document.getElementById('career-year').style.display="block";
      }else {
        document.getElementById("office").style.display="";
        document.getElementById('career-year').style.display="";
        const blank = document.getElementById("user_career_1i")
        blank.setAttribute("type", "hidden");
      }
    });
 };
window.onload = select;
