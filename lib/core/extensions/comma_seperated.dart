extension CommaSeparatedString on String {
  String insertCommas() {
    if (isEmpty) return this;
    return [
      substring(0, 1),
      for (var i = 1; i < length; i += 3)
        substring(i, i + 3 > length ? length : i + 3)
    ].join(',');
  }
}