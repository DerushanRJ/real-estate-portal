<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.realestate.realestateportal.model.Property" %>
<%@ page import="com.realestate.realestateportal.service.PropertyService" %>

<%
    PropertyService propertyService = new PropertyService();
    List<Property> properties = propertyService.getAllProperties();

    String[] images = {
            "Apartment1.jpg",
            "Apartment2.jpg",
            "Apartment3.jpg",
            "Apartment4.jpg"
    };
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
            padding: 70px 0;
            margin-bottom: 50px;
        }

        .property-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            height: 100%;
            background: white;
        }

        .property-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 28px rgba(0,0,0,0.12);
        }

        .card-img-top {
            height: 230px;
            object-fit: cover;
        }

        .price {
            color: #1a3c5e;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .badge-custom {
            background-color: #1a3c5e;
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.85rem;
        }

        .btn-primary {
            background-color: #1a3c5e;
            border-color: #1a3c5e;
            padding: 10px;
            font-weight: 600;
        }

        .btn-primary:hover {
            background-color: #16324f;
            border-color: #16324f;
        }

        .card-body p {
            color: #555;
        }
    </style>
</head>
<body>

<div class="page-header text-center">
    <div class="container">
        <h1 class="fw-bold">Available Properties</h1>
        <p class="lead">
            Discover luxury apartments and premium living spaces
        </p>
    </div>
</div>

<div class="container mb-5">

    <div class="row g-4">

        <%
            for(int i = 0; i < properties.size(); i++) {

                Property property = properties.get(i);
        %>

        <div class="col-md-6 col-lg-4">

            <div class="card property-card">

                <!-- Property Image -->
                <img src="images/<%= images[i % images.length] %>"
                     class="card-img-top"
                     alt="Property Image">

                <div class="card-body p-4">

                    <!-- Property Type -->
                    <span class="badge badge-custom mb-3">
                        <%= property.getType() %>
                    </span>

                    <!-- Property Title -->
                    <h4 class="fw-bold mb-2">
                        <%= property.getTitle() %>
                    </h4>

                    <!-- Location -->
                    <p class="text-muted mb-2">
                        Location: <%= property.getLocation() %>
                    </p>

                    <!-- Description -->
                    <p class="mb-3">
                        <%= property.getDescription() %>
                    </p>

                    <!-- Price -->
                    <div class="price mb-4">
                        $<%= String.format("%,.0f", property.getPrice()) %>
                    </div>

                    <!-- Contact Button -->
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