const pay = () => {
  Payjp.setPublicKey("pk_test_a639b922e7d2e994b4c9e568");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_delivery_address[card_number]"),
      cvc: formData.get("order_delivery_address[card_cvc]"),
      exp_month: formData.get("order_delivery_address[card_exp_month]"),
      exp_year: `20${formData.get("order_delivery_address[card_exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
    


        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);