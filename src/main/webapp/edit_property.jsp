<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.realestate.realestateportal.model.User" %>
<%@ page import="com.realestate.realestateportal.model.Property" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Property - Real Estate Portal</title>
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
    Property property = (Property) request.getAttribute("property");
%>

<nav class="navbar navbar-dark px-4 py-3">
    <a class="navbar-brand fw-bold fs-5" href="index.jsp">🏠 Real Estate Portal</a>
</nav>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card p-4">
                <h3 class="fw-bold mb-4">Edit Property</h3>
                <% if (property == null) { %>
                    <div class="alert alert-danger">Property not found.</div>
                <% } else { %>
                <form action="seller?action=update&id=<%= property.getId() %>" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Property Title</label>
                        <input type="text" name="title" class="form-control" value="<%= property.getTitle() %>" required>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Property Type</label>
                            <select name="type" class="form-select" required>
                                <option value="Apartment" <%= "Apartment".equals(property.getType()) ? "selected" : "" %>>Apartment</option>
                                <option value="Villa" <%= "Villa".equals(property.getType()) ? "selected" : "" %>>Villa</option>
                                <option value="Land" <%= "Land".equals(property.getType()) ? "selected" : "" %>>Land</option>
                                <option value="Commercial" <%= "Commercial".equals(property.getType()) ? "selected" : "" %>>Commercial</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Price (LKR)</label>
                            <input type="number" step="0.01" name="price" class="form-control" value="<%= property.getPrice() %>" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Location</label>
                        <input type="text" name="location" class="form-control" value="<%= property.getLocation() %>" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="4" required><%= property.getDescription() %></textarea>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary py-2 fw-bold">Update Property</button>
                        <a href="seller?action=list" class="btn btn-outline-secondary py-2">Cancel</a>
                    </div>
                </form>
                <% } %>
            </div>
        </div>
    </div>
</div>

<footer class="text-center">
    <p class="mb-0">© 2026 Real Estate Portal | Seller Panel</p>
</footer>

</body>
</html>
