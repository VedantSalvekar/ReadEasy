(function(){
    var form = document.getElementById('file-form');
    var fileSelect = document.getElementById('myfile');
    var uploadButton = document.getElementById('submit');
    var statusDiv = document.getElementById('status');

    form.onsubmit = function(event) {
        event.preventDefault();

        statusDiv.innerHTML = 'Uploading . . . ';

        // Get the files from the input
        var files = fileSelect.files;

        // Create a FormData object.
        var formData = new FormData();

        //Grab only one file since this script disallows multiple file uploads.
        var file = files[0]; 

        //Check the file type.
        if (!file.type.match('image.*')) {
            statusDiv.innerHTML = 'You cannot upload this file because it’s not an image.';
            return;
        }

        if (file.size >= 2000000 ) {
            statusDiv.innerHTML = 'You cannot upload this file because its size exceeds the maximum limit of 2 MB.';
            return;
        }

         // Add the file to the AJAX request.
        formData.append('myfile', file, file.name);

        // Set up the request.
        var xhr = new XMLHttpRequest();

        // Open the connection.
        xhr.open('POST', 'BookImageUpload', true);


        // Set up a handler for when the task for the request is complete.
        xhr.onload = function () {
          if (xhr.status === 200) {
            statusDiv.innerHTML = 'Your upload is successful..';
            
          } else {
            statusDiv.innerHTML = 'An error occurred during the upload. Try again.';
          }
        };
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4) {
                document.getElementById("image-name").value = xhr.responseText;
                document.getElementById("book-info-submit").disabled = false;
            }
        };

        // Send the data.
        xhr.send(formData);
    }
})();