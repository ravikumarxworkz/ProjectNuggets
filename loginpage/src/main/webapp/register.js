function validateForm() {
  var username = document.getElementById('username').value;
  var email = document.getElementById('email').value;
  var passwords = document.getElementById('passwords').value;
  var confirmPassword = document.getElementById('confirmPassword').value;
  document.getElementById('usernameError').textContent = '';
  document.getElementById('ageError').textContent = '';
  document.getElementById('emailError').textContent = '';
  document.getElementById('confirmPasswordError').textContent = '';

  if (username.length < 4) {
    document.getElementById('usernameError').textContent = 'Username should not be less than 4 characters!';
    return false;
  }
  if (email.indexOf('@') === -1) {
    document.getElementById('emailError').textContent = 'Email should contain "@"!';
    return false;
  }

  if (passwords !== confirmPassword) {
    document.getElementById('confirmPasswordError').textContent = 'Confirm Password does not match with Password!';
    return false;
  }
  alert('Registration successful!');
  return true;
}