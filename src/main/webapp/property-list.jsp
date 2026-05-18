<%@ page import="java.util.List" %>
<%@ page import="com.realestate.realestateportal.model.Property" %>
<%@ page import="com.realestate.realestateportal.service.PropertyService" %>

<%
    PropertyService propertyService = new PropertyService();
    List<Property> properties = propertyService.getAllProperties();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Property Listings | Real Estate Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .page-header {
            background: linear-gradient(135deg, #1a3c5e 0%, #2d6a9f 100%);
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
        }

        .property-card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
            transition: transform 0.2s;
            height: 100%;
        }

        .property-card:hover {
            transform: translateY(-4px);
        }

        .price {
            color: #1a3c5e;
            font-size: 1.4rem;
            font-weight: bold;
        }

        .badge-custom {
            background-color: #1a3c5e;
        }
    </style>
</head>
<body>

<div class="page-header text-center">
    <div class="container">
        <h1 class="fw-bold">Available Properties</h1>
        <p class="lead">Browse our latest property listings</p>
    </div>
</div>

<div class="container mb-5">

    <div class="row g-4">

        <% for(Property property : properties) { %>

        <div class="col-md-6 col-lg-4">

            <div class="card property-card p-3">

                <div class="card-body">

                    <span class="badge badge-custom mb-3">
                        <%= property.getType() %>
                    </span>

                    <h4 class="fw-bold">
                        <%= property.getTitle() %>
                    </h4>

                    <p class="text-muted mb-2">
                       Location: <%= property.getLocation() %>
                    </p>

                    <p>
                        <%= property.getDescription() %>
                    </p>

                    <div class="price mb-3">
                        $<%= String.format("%,.0f", property.getPrice()) %>
                    </div>

                    <a href="contact.jsp" class="btn btn-primary w-100">
                        Contact Agent
                    </a>

                </div>

            </div>

        </div>

        <% } %>

    </div>

</div>

</body>
</html>