String getException(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return 'Invalid email address. Please check and try again.';
    case 'invalid-credential':
      return 'Invalid Credentials. Please check and try again.';
    case 'user-not-found':
      return 'User not found. Please register before logging in.';
    case 'wrong-password':
      return 'Incorrect password. Please enter the correct password.';
    case 'user-disabled':
      return 'Your account has been disabled. Please contact support.';
    case 'too-many-requests':
      return 'Too many login attempts. Please try again later.';
    case 'email-already-in-use':
      return 'Email is already in use. Please use a different email.';
    // Add more cases as needed for specific error codes
    default:
      return 'An error occurred. Please try again later.';
  }
}
