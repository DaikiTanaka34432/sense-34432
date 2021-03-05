if (document.URL.match(/new/) || document.URL.match(/edit/)){
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) =>{
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // imageElement.setAttribute('class', "image-element")
      // let imageElementNum = document.querySelectorAll('.image-element').length
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('style', "width:33vh; height:33vh;");
      
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);

      // 画像複数枚投稿時のコード？
      // ファイル選択ボタンを生成
      // const inputHTML = document.createElement('input')
      // inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      // inputHTML.setAttribute('name', 'item[images][]')
      // inputHTML.setAttribute('type', 'file')
      // 上の記述より<input id="message_image_[番号]" name="message[images][]" type="file"> が生成される。

      // 生成したHTMLの要素をブラウザに表示させる
      // imageElement.appendChild(inputHTML);

      // inputHTML.addEventListener('change',(e) =>{
      //   file = e.target.files[0];
      //   blob =window.URL.createObjectURL(file);

      //   createImageHTML(blob); 
      // })
    };
    
    document.getElementById('item-image').addEventListener('change',function(e){
      const imageContent = document.querySelector('img')
      if (imageContent){
      imageContent.remove();
      }

      const file = e.target.files[0];
      const blob =window.URL.createObjectURL(file);
      
      createImageHTML(blob);
    });
  });
}