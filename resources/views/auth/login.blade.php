<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>XpertBot Academy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite('resources/css/app.css')
</head>
<body class="bg-slate-700 min-h-screen flex items-center justify-center font-sans">

<div class="w-full max-w-md bg-white shadow-lg rounded-lg p-8 text-center">
    <h1 class="text-xl font-semibold text-gray-800 mb-2">XpertBot Academy</h1>
    <h2 class="text-2xl font-semibold text-gray-700 mb-6">Welcome Back!</h2>

    @if(session('error'))
        <div class="bg-red-100 text-red-600 text-sm p-3 rounded mb-4">
            {{ session('error') }}
        </div>
    @endif

    <form method="POST" action="{{ url('/login') }}" class="space-y-4 text-left">
        @csrf

        <div>
            <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
            <input type="email" name="email" id="email" required autofocus
                   class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:border-transparent">
        </div>

        <div>
            <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
            <input type="password" name="password" id="password" required
                   class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-400 focus:border-transparent">
        </div>

        <div class="flex items-center justify-between text-sm">
        <!-- login with google -->
        <a href="{{ route('auth.google') }}"  class="inline-block px-6 py-2 text-white bg-red-600 rounded-lg shadow">Login with Google</a>
        

            <label class="flex items-center gap-1 text-gray-600">
                <input type="checkbox" class="rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                Remember Me
            </label>
        </div>

        <button type="submit"
                class="cursor-pointer w-full bg-indigo-500 hover:bg-indigo-600 text-white font-semibold py-2 rounded transition">
            Login
        </button>
    </form>
</div>

</body>
</html>
