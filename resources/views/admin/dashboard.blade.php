<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h1>Welcome, {{ auth()->user()->first_name }}</h1>
<p>You're logged in as admin. Here you can manage users, institutions, and more.</p>
<form action="{{ route('logout') }}" method="POST">
    @csrf
    <button type="submit" style="background: none; border: none; color: #667eea; text-decoration: underline; cursor: pointer;">
        Logout
    </button>
</form>
</body>
</html>


