<!DOCTYPE html>
<html>
<head>
    <title>Blockchain Ed Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    % if get_flashed_messages():
      <div class="container mt-3">
        % for category, message in get_flashed_messages(with_categories=true):
          <div class="alert alert-${category}">${message}</div>
        % endfor
      </div>
    % endif

    <div class="container mt-5">
        ${self.body()}
    </div>
</body>
</html>
