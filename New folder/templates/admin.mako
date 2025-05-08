<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .container {
            margin-top: 50px;
        }
        .table {
            background-color: #1e1e1e;
            color: white;
        }
        .table th, .table td {
            border-color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Registered Users</h2>
        <table class="table table-dark table-striped table-bordered rounded">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>New User?</th>
                </tr>
            </thead>
            <tbody>
                % for user in users:
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.email}</td>
                        <td>${"Yes" if user.new_user else "No"}</td>
                    </tr>
                % endfor
            </tbody>
        </table>
    </div>
</body>
</html>
