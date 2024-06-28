function limitWordsOnPost(className, wordLimit) {
    const elements = document.querySelectorAll(`.${className}`);
    elements.forEach(element => {
        const text = element.innerText;
        const words = text.split(' ');

        if (words.length > wordLimit) {
            const truncatedText = words.slice(0, wordLimit).join(' ') + '....';
            element.innerText = truncatedText;
        }
    });
}

limitWordsOnPost('second_section_post_text', 25);

function limitWordsOnTitle(className, wordLimit) {
    const elements = document.querySelectorAll(`.${className}`);
    elements.forEach(element => {
        const text = element.innerText;
        const words = text.split(' ');

        if (words.length > wordLimit) {
            const truncatedText = words.slice(0, wordLimit).join(' ') + '....';
            element.innerText = truncatedText;
        }
    });
}

limitWordsOnTitle('second_section_post_tittle', 11);

