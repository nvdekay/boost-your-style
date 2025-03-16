<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Change Password</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/custom.css"> <!-- File CSS tùy chỉnh -->
</head>
<body class="bg-light">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-lg p-4 rounded" style="max-width: 450px; width: 100%;">
            <div class="text-center">
                <h2 class="fw-bold text-primary">Change Password</h2>
                <p class="text-muted">Please enter your new password</p>
            </div>
            <form action="reset" method="post">
                <div class="mb-3">
                    <label class="form-label fw-semibold">New Password</label>
                    <input type="password" class="form-control" name="newPassword" placeholder="Enter new password" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Confirm Password</label>
                    <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm new password" required>
                </div>
                <div class="text-danger text-center mb-3"><b>${mess}</b></div>
                <button type="submit" class="btn btn-primary w-100">Confirm</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
