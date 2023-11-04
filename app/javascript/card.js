const pay = () => {
  let isSubmitting = false;
  const waitForPayjp = setInterval(function() {
    if (typeof Payjp !== 'undefined') {
      clearInterval(waitForPayjp);
      

      const publicKey = gon.public_key
      const payjp = Payjp(publicKey)
      const itemPrice = gon.item_price;

    


      const elements = payjp.elements();
      const numberElement = elements.create('cardNumber');
      const expiryElement = elements.create('cardExpiry');
      const cvcElement = elements.create('cardCvc');

      const form = document.getElementById("charge-form");

      numberElement.mount('#number-form');
      expiryElement.mount('#expiry-form');
      cvcElement.mount('#cvc-form');

      form.addEventListener("submit", (e) => {

        if (isSubmitting) {
          return;
        }
        isSubmitting = true;
        payjp.createToken(numberElement).then(function (response) {
         
          if (response.error) {
            alert('カード情報が正しくありません。');
          } else {
            const token = response.id;
            const renderDom = document.getElementById("charge-form");
            const tokenObj = `<input value=${token} name='token' type="hidden">`;
            renderDom.insertAdjacentHTML("beforeend", tokenObj);
          }
          numberElement.clear();
          expiryElement.clear();
          cvcElement.clear();
          document.getElementById("charge-form").submit();
        });
        e.preventDefault();
      });
    }
  }, 10);
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);

