import 'dart:typed_data';

/**
 * Returns a bigint that converted from a int array with big-endian encoding.
 * and the values type must be in [Uint8List], [Uint16Lit]
 */
BigInt _arrayToBigInt(List<int> values) {
  var bits = 0;
  if (values is Uint8List) {
    bits = 8;
  } else if (values is Uint16List) {
    bits = 16;
  } else {
    throw ArgumentError('values type must be in int8List, Uint16Lit');
  }

  BigInt result = BigInt.from(0);
  final reversed = values.reversed.toList();

  for (int i = 0; i < reversed.length; i++) {
    result += BigInt.from(reversed[i]) << (bits * i);
  }
  return result;
}

BigInt bytesToBigInt(Uint8List values) {
  return _arrayToBigInt(values);
}

BigInt uint16ListToBigInt(Uint16List values) {
  return _arrayToBigInt(values);
}
