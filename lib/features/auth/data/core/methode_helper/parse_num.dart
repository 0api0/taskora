int parseNum(dynamic value) {
  if (value is int) {
    return value;
  }

  return int.tryParse(value.toString()) ?? 0;
}
