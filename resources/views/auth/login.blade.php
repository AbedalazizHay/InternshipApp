<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>XpertBot Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        /* Card Container */
        .login-container {
            background: #fff;
            padding: 2rem;
            border-radius: 0.75rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 1.5rem;
            font-size: 2rem;
            color: #4a4a4a;
        }

        /* Error Message */
        .error {
            background: #ffe6e6;
            color: #c0392b;
            padding: 0.75rem;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .form-group {
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .form-group input[type="email"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-group input[type="email"]:focus,
        .form-group input[type="password"]:focus {
            border-color: #667eea;
            outline: none;
        }

        button {
            background: #667eea;
            border: none;
            padding: 0.75rem;
            color: #fff;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 0.5rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #5469d4;
        }

        /* Responsive tweaks */
        @media (max-width: 480px) {
            .login-container {
                margin: 1rem;
                padding: 1.5rem;
            }
            .login-container h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>XpertBot Login</h2>

    @if(session('error'))
        <div class="error">{{ session('error') }}</div>
    @endif

    <form method="POST" action="{{ url('/login') }}">
        @csrf

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" required autofocus>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required>
        </div>

        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>
