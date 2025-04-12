<h1>Welcome, {{ auth()->user()->first_name }}</h1>
<p>You're logged in as admin. Here you can manage users, institutions, and more.</p>
<form action="{{ route('logout') }}" method="POST">
    @csrf
    <button type="submit" style="background: none; border: none; color: #667eea; text-decoration: underline; cursor: pointer;">
        Logout
    </button>
</form>
