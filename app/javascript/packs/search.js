document.addEventListener('turbolinks:load', () => {
    const searchForm = document.querySelector('#search-form-container form');
  
    searchForm.addEventListener('submit', (event) => {
      event.preventDefault();
      Rails.fire(searchForm, 'submit');
    });
  });