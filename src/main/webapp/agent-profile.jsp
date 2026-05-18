<%@ page import="com.realestate.realestateportal.model.User" %>

<%
    User user = (User) session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Agent Profile | Real Estate Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .profile-card {
            max-width: 600px;
            margin: 80px auto;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .card-header {
            background-color: #1a3c5e;
            color: white;
            border-radius: 12px 12px 0 0 !important;
            padding: 24px;
        }

        .profile-item {
            padding: 14px 0;
            border-bottom: 1px solid #eee;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="card profile-card">

        <div class="card-header text-center">
            <h3 class="mb-0">Agent Profile</h3>
            <p class="mb-0 mt-1 opacity-75">
                Manage your account information
            </p>
        </div>

        <div class="card-body p-4">

            <% if(user != null) { %>

                <div class="profile-item">
                    <strong>Full Name</strong>
                    <p class="mb-0 mt-1"><%= user.getName() %></p>
                </div>

                <div class="profile-item">
                    <strong>Email Address</strong>
                    <p class="mb-0 mt-1"><%= user.getEmail() %></p>
                </div>

                <div class="profile-item border-0">
                    <strong>Role</strong>
                    <p class="mb-0 mt-1"><%= user.getRole() %></p>
                </div>

            <% } else { %>

                <div class="alert alert-warning">
                    No user logged in.
                </div>

            <% } %>

        </div>

    </div>

</div>

</body>
</html>