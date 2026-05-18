<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Contact Agent | Real Estate Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .contact-card {
            max-width: 650px;
            margin: 70px auto;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .card-header {
            background-color: #1a3c5e;
            color: white;
            border-radius: 12px 12px 0 0 !important;
            padding: 24px;
        }

        .btn-primary {
            background-color: #1a3c5e;
            border-color: #1a3c5e;
        }

        .btn-primary:hover {
            background-color: #16324f;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="card contact-card">

        <div class="card-header text-center">
            <h3 class="mb-0">Contact Agent</h3>
            <p class="mb-0 mt-1 opacity-75">
                Send your inquiry directly
            </p>
        </div>

        <div class="card-body p-4">

            <form action="contact" method="post">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Your Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Email Address</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Subject</label>
                    <input type="text" name="subject" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Message</label>
                    <textarea name="message" rows="5" class="form-control"></textarea>
                </div>

                <div class="d-grid mt-4">
                    <button type="submit" class="btn btn-primary btn-lg">
                        Send Message
                    </button>
                </div>

            </form>

        </div>

    </div>

</div>

</body>
</html>