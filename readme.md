![](https://i.imgur.com/xG74tOh.png)

Para fixar todo o conhecimento adquirido ao longo do módulo, desenvolveremos uma aplicação que realiza a cotação de moedas.
Sua missão será:
- Consumir a API https://docs.awesomeapi.com.br/api-de-moedas;
- Fornecer as opções de moedas a serem cotadas, sendo elas: Real, Libra Esterlina, Dólar Americano, Dólar Canadense, Peso Argentino e Iene;
- Seguir a proposta de layout do Figma https://www.figma.com/file/BagX31a8VTHzCldH9vsEvF/Cotador?node-id=0%3A1;
- Exibir as telas em uma PageView com indicador de página ativa;
    - Bloquear o avanço nas páginas através de scroll;
- No resultado, alterar a cor do valor de compra da moeda seguindo a regra:
    - Valor menor que 1 sendo exibido como verde;
    - Valor maior ou igual a 1, e menor que 5, sendo exibido como amarelo;
    - Valor maior ou igual a 5, sendo exibido como vermelho;
- O botão de avanço deve conter uma variação de "loading", que será exibida enquanto a chamada para a API ocorre, entre a página de cotação e a de resultado;

### Importante
- Utilizar repository;
- Fazer gestão de estado com um método diferente do setState, escolha qualquer package de acordo com seu gosto;
- Tokenizar as cores do Figma num arquivo separado;
- Utilizar Enums para simbolizar as moedas;