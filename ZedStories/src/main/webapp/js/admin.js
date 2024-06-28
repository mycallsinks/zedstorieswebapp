function openModal(postId, category, title, author, location, text, image, contactDetails) {
    document.getElementById('editPostId').value = postId;
    document.getElementById('editCategory').value = category;
    document.getElementById('editTitle').value = title;
    document.getElementById('editAuthor').value = author;
    document.getElementById('editLocation').value = location;
    document.getElementById('editText').value = text;
    document.getElementById('editContactDetails').value = contactDetails;

    // Display the modal
    var modal = document.getElementById('editModal');
    modal.style.display = 'block';
}

function closeModal() {
    // Close the modal
    var modal = document.getElementById('editModal');
    modal.style.display = 'none';
}

function saveChanges() {
    // Collect form data
    var formData = new FormData(document.getElementById('editForm'));

    // Perform form validation here if needed

    // Perform asynchronous POST request to servlet
    fetch('editpost', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (response.ok) {
            // Optionally handle success response
            closeModal(); // Close modal on success
            // Optionally reload or update UI
        } else {
            // Handle error response
            console.error('Edit post request failed');
        }
    })
    .catch(error => {
        console.error('Error during edit post request:', error);
    });
}

// Close the modal if user clicks outside of it
window.onclick = function(event) {
    var modal = document.getElementById('editModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}