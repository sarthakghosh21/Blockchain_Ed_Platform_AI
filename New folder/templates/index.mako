<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login/Signup</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2 class="mb-4">Blockchain Education Platform</h2>
    <form method="POST">
        <div class="form-group">
            <input class="form-control" type="email" name="email" placeholder="Email" required>
        </div>
        <div class="form-group">
            <input class="form-control" type="password" name="password" placeholder="Password" required>
        </div>
        <button class="btn btn-primary" type="submit" name="action" value="login">Login</button>
        <button class="btn btn-secondary" type="submit" name="action" value="signup">Signup</button>
    </form>
</body>
</html>
