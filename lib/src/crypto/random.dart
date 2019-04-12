import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';

import '../util/numbers.dart' as numbers;

/// Random number generater providing pointycastle
class TangramRandom implements SecureRandom {
  Random _random;

  static final MAX_UINT8 = 1 << 8;
  static final MAX_UINT16 = 1 << 16;

  @override
  String get algorithmName => "TangramRandom";

  TangramRandom([Random random = null]) {
    this._random = random ??= Random.secure();
  }

  /** 
   * Generates a non-negative random big integer uniformly distributed in the range
   * [ 0,  1<<(bitLength+1) )
   */
  @override
  BigInt nextBigInteger(int bitLength) {
    // Uses Uint16List to fastest generate random number
    int quotient = bitLength ~/ 16;
    int remainder = bitLength % 16;

    var main =
        Uint16List.fromList(List<int>.generate(quotient, (i) => nextUint16()));

    return remainder > 0
        ? numbers.uint16ListToBigInt(main) +
            (BigInt.from(_random.nextInt(pow(2, remainder))) << (quotient * 16))
        : numbers.uint16ListToBigInt(main);
  }

  @override
  Uint8List nextBytes(int count) =>
      Uint8List.fromList(List<int>.generate(count, (i) => nextUint8()));

  @override
  int nextUint8() => _random.nextInt(MAX_UINT8);

  @override
  int nextUint16() => _random.nextInt(MAX_UINT16);

  @override
  int nextUint32() => throw UnsupportedError(
      'nextUInt32() is not supported because uint32 is not javascript compatible');

  @override
  void seed(CipherParameters params) {
    // ignore
  }
}
