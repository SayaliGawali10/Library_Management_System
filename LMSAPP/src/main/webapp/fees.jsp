<form action="/changeBook" method="get">
    <!-- Hidden student ID (ensure this value is dynamically set in the backend) -->
    <input type="hidden" name="id" value="12345"> <!-- Replace 12345 with dynamic student ID -->
    
    <div class="book-selection-container">
        <label for="bookSelect">Select New Book</label>
        <select name="book" id="bookSelect" class="form-control">
            <option value="Java">Java Programming</option>
            <option value="Python">Python Programming</option>
            <option value="C">C Programming</option>
            <option value="C++">C++ Programming</option>
            <option value=".NET">.NET Programming</option>
            <option value="OOPs">Object-Oriented Programming</option>
        </select>
    </div>
    
    <div class="pay-btn-container">
        <button type="submit" class="btn btn-custom">
            <i class="fas fa-arrow-right"></i> Change Book
        </button>
    </div>
</form>
