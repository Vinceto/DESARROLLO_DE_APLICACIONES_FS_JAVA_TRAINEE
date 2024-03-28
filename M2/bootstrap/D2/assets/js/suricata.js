function expandirTexto(button) {
    var cardBody = button.parentElement;
    var cardText = cardBody.querySelector('.card-text');

    if (cardText.style.maxHeight === '3em') {
        cardText.style.maxHeight = 'none';
        button.textContent = 'Ver menos';
    } else {
        cardText.style.maxHeight = '3em';
        button.textContent = 'Ver más';
    }
}