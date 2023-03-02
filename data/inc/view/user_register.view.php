<div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
</div>
<form action="user.php?action=register" method="POST">
    <h3>Login</h3>

    <label for="username">Username</label>
    <input type="text" placeholder="Username" id="username" name="username">

    <label for="usermail">mail</label>
    <input type="email" placeholder="Email@gmail.com" id="usermail" name="usermail">

    <label for="password">Password</label>
    <input type="password" placeholder="Password" id="password" name="password">
    <input type="password" placeholder="Verify password" id="password2" name="password2">

    <input type="submit" name="reg" id="submit" value="Register">
</form>