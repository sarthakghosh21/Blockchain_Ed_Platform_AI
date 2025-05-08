<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Certificate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .container {
            margin-top: 50px;
        }
        .certificate-card {
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }
        .certificate-card h3 {
            color: #0d6efd;
        }
        .certificate-card p {
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="certificate-card">
            <h3>Congratulations, ${user.name}!</h3>
            <p>You have successfully completed the course.</p>
            <p>Course: Blockchain Basics</p>
            <p>Date: ${certificate_date}</p>
            <hr>
            <p>Certificate ID: ${certificate_id}</p>
        </div>
    </div>
</body>
</html>
