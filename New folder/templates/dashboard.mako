<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Welcome, {user.email}</h2>
    <ul class="list-group">
        % for course in courses:
            <li class="list-group-item"><a href="/quiz/${course.id}">${course.name}</a></li>
        % endfor
    </ul>
</body>
</html>
