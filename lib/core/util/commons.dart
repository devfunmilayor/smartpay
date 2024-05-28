class Commons {
  static String maskEmail(String email) {
    final int atIndex = email.indexOf('@');
    if (atIndex <= 2) {
      return email;
    }

    final String localPart = email.substring(0, atIndex);
    final String domainPart = email.substring(atIndex);

    final String maskedLocalPart = localPart[0] +
        '*' * (localPart.length - 3) +
        localPart.substring(localPart.length - 2);

    return maskedLocalPart + domainPart;
  }
}
