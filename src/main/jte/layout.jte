@import gg.jte.Content

@param String title
@param Content content

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-primary navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center gap-2 px-4 mb-0" href="/">
            <img width="40" src="/dolphin128x128.png" alt="dolphin">
            <span>Dolphin Swim Academy</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav gap-3">
                <li class="nav-item">
                    <a class="nav-link" href="/classes">Classes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/students">Students</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Coaches</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5 col">
    ${content}
</div>

<footer class="page-footer fixed-bottom bg-primary">
    <div class="container text-center text-white py-3">
        <p>Copyright &copy Dolphins Swim Academy 2026 <br> Dolphin icon is created by <a class="text-white">Freepik</a> from <a class="text-white">Flaticon</a></p>
    </div>
</footer>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
