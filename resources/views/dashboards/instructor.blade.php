<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Instructor Dashboard</title>
    @vite('resources/css/app.css')
</head>
<body class="bg-gray-100 font-sans">

<div class="container mx-auto py-10 px-6">
    <h1 class="text-3xl font-bold mb-6">Welcome, {{ Auth::user()->first_name }}!</h1>

    <div class="bg-white shadow-md rounded p-6">
        <h2 class="text-xl font-semibold mb-4">Instructor Panel</h2>
        <ul class="space-y-2">
            <li><a href="#" class="text-blue-500 hover:underline">View Assigned Batches</a></li>
            <li><a href="#" class="text-blue-500 hover:underline">Track Progress</a></li>
            <li><a href="#" class="text-blue-500 hover:underline">Manage Students</a></li>
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button class="cursor-pointer text-blue-500 hover:underline" type="submit">Logout</button>
            </form>
        </ul>
    </div>
</div>

</body>
</html>
