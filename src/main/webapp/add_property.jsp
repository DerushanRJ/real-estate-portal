<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.realestate.realestateportal.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Property - Real Estate Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .navbar { background-color: #1a3c5e; }
        .card { border-radius: 12px; box-shadow: 0 2px 15px rgba(0,0,0,0.08); border: none; }
        .btn-primary { background-color: #1a3c5e; border-color: #1a3c5e; }
        .btn-primary:hover { background-color: #16324f; }
        footer { background-color: #1a3c5e; color: white; padding: 24px 0; margin-top: 50px; }
    </style>
</head>
<body>

<%
    User loggedIn = (User) session.getAttribute("loggedInUser");
%>

<nav class="navbar navbar-dark px-4 py-3">
    <a class="navbar-brand fw-bold fs-5" href="index.jsp">🏠 Real Estate Portal</a>
</nav>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card p-4">
                <h3 class="fw-bold mb-4">Add New Property</h3>
                <form action="seller?action=add" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Property Title</label>
                        <input type="text" name="title" class="form-control" placeholder="e.g. Modern 3-Bedroom Apartment" required>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Property Type</label>
                            <select name="type" class="form-select" required>
                                <option value="Apartment">Apartment</option>
                                <option value="Villa">Villa</option>
                                <option value="Land">Land</option>
                                <option value="Commercial">Commercial</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Price (LKR)</label>
                            <input type="number" step="0.01" name="price" class="form-control" placeholder="0.00" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Location</label>
                        <input type="text" name="location" class="form-control" placeholder="City, District" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="4" placeholder="Describe the property features..." required></textarea>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary py-2 fw-bold">Publish Property</button>
                        <a href="seller?action=list" class="btn btn-outline-secondary py-2">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<footer class="text-center">
    <p class="mb-0">© 2026 Real Estate Portal | Seller Panel</p>
</footer>

</body>
</html>
