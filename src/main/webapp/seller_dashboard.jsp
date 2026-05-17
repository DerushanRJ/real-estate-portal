<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.realestate.realestateportal.model.User" %>
<%@ page import="com.realestate.realestateportal.model.Property" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Dashboard - Real Estate Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .navbar { background-color: #1a3c5e; }
        .hero-mini {
            background: linear-gradient(135deg, #1a3c5e 0%, #2d6a9f 100%);
            color: white;
            padding: 40px 0;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-primary { background-color: #1a3c5e; border-color: #1a3c5e; }
        .btn-primary:hover { background-color: #16324f; }
        .card { border-radius: 12px; box-shadow: 0 2px 15px rgba(0,0,0,0.08); border: none; }
        footer { background-color: #1a3c5e; color: white; padding: 24px 0; margin-top: 50px; }
    </style>
</head>
<body>

<%
    User loggedIn = (User) session.getAttribute("loggedInUser");
    List<Property> properties = (List<Property>) request.getAttribute("properties");
%>

<!-- Navbar -->
<nav class="navbar navbar-dark px-4 py-3 d-flex justify-content-between">
    <a class="navbar-brand fw-bold fs-5" href="index.jsp">🏠 Real Estate Portal</a>
    <div>
        <% if (loggedIn != null) { %>
            <span class="text-white me-3">Seller: <%= loggedIn.getName() %></span>
            <a href="index.jsp" class="btn btn-outline-light btn-sm me-2">Home</a>
            <a href="user?action=logout" class="btn btn-outline-light btn-sm">Logout</a>
        <% } %>
    </div>
</nav>

<div class="hero-mini">
    <div class="container">
        <h1>Seller Dashboard</h1>
        <p>Manage your property listings efficiently</p>
    </div>
</div>

<div class="container">
    <% String success = request.getParameter("success"); %>
    <% if ("added".equals(success)) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            Property added successfully!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } else if ("updated".equals(success)) { %>
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            Property updated successfully!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } else if ("deleted".equals(success)) { %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            Property deleted successfully!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold">My Listings</h3>
        <a href="seller?action=add" class="btn btn-primary px-4">+ Add New Property</a>
    </div>

    <div class="card p-4">
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Location</th>
                        <th>Price (LKR)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (properties == null || properties.isEmpty()) { %>
                        <tr>
                            <td colspan="5" class="text-center py-4 text-muted">No properties found. Start by adding one!</td>
                        </tr>
                    <% } else { 
                        for (Property p : properties) { %>
                        <tr>
                            <td class="fw-bold"><%= p.getTitle() %></td>
                            <td><span class="badge bg-secondary"><%= p.getType() %></span></td>
                            <td><%= p.getLocation() %></td>
                            <td><%= String.format("%.2f", p.getPrice()) %></td>
                            <td>
                                <a href="seller?action=edit&id=<%= p.getId() %>" class="btn btn-sm btn-outline-primary me-1">Edit</a>
                                <form action="seller?action=delete&id=<%= p.getId() %>" method="POST" style="display:inline;">
                                    <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure?')">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<footer class="text-center">
    <p class="mb-0">© 2026 Real Estate Portal | Seller Panel</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
