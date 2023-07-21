import tinymce from 'tinymce';
import 'tinymce/themes/silver';
import 'tinymce/plugins/paste';
import 'tinymce/plugins/link';
import 'tinymce/plugins/lists';
import 'tinymce/plugins/image';
import 'tinymce/plugins/imagetools';

document.addEventListener('DOMContentLoaded', function () {
  const textArea = document.getElementById('inputDescription');
  if (textArea) {
    tinymce.init({
      selector: '#inputDescription',
      plugins: 'paste link lists image imagetools',
      toolbar: 'undo redo | formatselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent | link image',
      image_title: true,
      image_description: false,
    });
  }
});
