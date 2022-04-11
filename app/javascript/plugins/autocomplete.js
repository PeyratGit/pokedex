import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function () {
  const names = JSON.parse(document.querySelector('.search-bar').dataset.names)
  const searchInput = document.getElementById('search-input');

  if (names && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function (term, suggest) {
        term = term.toLowerCase();
        const choices = names;
        const matches = [];
        for (let i = 0; i < choices.length; i++)
          if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
        suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
