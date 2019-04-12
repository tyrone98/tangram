import 'package:tangram/src/util/numbers.dart';
import 'package:test/test.dart';
import 'dart:typed_data';

void main() {
  group("numbers", () {
    test(".byteToBigInt() convert Uint8List to bigint", () {
      expect(
          bytesToBigInt(
              Uint8List.fromList([0x22, 0x34, 0x44, 0x12, 0x33, 0x55])),
          equals(BigInt.from(0x223444123355)));
    });
    test(".uint16ListToBigInt() convert Uint16List to bigint", () {
      expect(uint16ListToBigInt(Uint16List.fromList([0x2234, 0x3444])),
          equals(BigInt.from(0x22343444)));
    });
  });
}
