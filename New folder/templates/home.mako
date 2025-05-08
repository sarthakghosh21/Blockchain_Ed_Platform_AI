<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login / Signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .form-container {
            max-width: 400px;
            margin: 80px auto;
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h3 class="text-center mb-4">Welcome to the Platform</h3>
        <form method="POST">
            <div class="mb-3">
                <label for="email" class="form-label">Email (@slopewallet only)</label>
                <input type="email" class="form-control" id="email" name="email" required>
                
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Enter Portal</button>
            </div>
        </form>

        % if message:
            <div class="alert alert-warning mt-3" role="alert">
                ${message}
            </div>
        % endif
    </div>
</body>
</html>
