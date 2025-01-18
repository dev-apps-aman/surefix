class FormValidators {
  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateIFSC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the IFSC code';
    }
    if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
      return 'Enter a valid IFSC code';
    }
    return null;
  }

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the account number';
    }
    if (value.length < 6 || value.length > 18) {
      return 'Account number must be between 6 and 18 digits';
    }
    return null;
  }

  static String? validateConfirmAccountNumber(
      String? value, String accountNum) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your account number';
    }
    if (value != accountNum) {
      return 'Account numbers do not match';
    }
    return null;
  }

  static String? validateVehicleNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter vehicle number';
    }

    if (!RegExp(r'^[A-Z0-9]{1,15}$').hasMatch(value)) {
      return 'Enter a valid vehicle number';
    }
    return null;
  }
}
