import 'package:test/test.dart';
import 'package:tangram/src/crypto/random.dart';
import 'package:tangram/src/util/range.dart';

void main() {
  group("TangramRandom", () {
    TangramRandom random = TangramRandom();
    test(
        ".nextBigInteger(512) generate 512-bit bigint that must be between 0 and 2^512 - 1",
        () {
      range(0, 10).forEach((i) => expect(
          random.nextBigInteger(512),
          allOf(greaterThanOrEqualTo(BigInt.from(0)),
              lessThan(BigInt.from(1) << 512))));
    });

    test(
        ".nextBigInteger(256) generate 256-bit bigint that must be between 0 and 2^256 - 1",
        () {
      range(0, 10).forEach((i) => expect(
          random.nextBigInteger(256),
          allOf(greaterThanOrEqualTo(BigInt.from(0)),
              lessThan(BigInt.from(1) << 256))));
    });

    test(
        ".nextUint16() generate random Uint8 that must be between 0 and 2^16-1",
        () {
      range(0, 10).forEach((i) => expect(random.nextUint16(),
          allOf(greaterThanOrEqualTo(0), lessThan(1 << 16))));
    });

    test(".nextUint8() generate random Uint8 that must be between 0 and 2^8-1 ",
        () {
      range(0, 10).forEach((i) => expect(random.nextUint8(),
          allOf(greaterThanOrEqualTo(0), lessThan(1 << 8))));
    });
  });
}
