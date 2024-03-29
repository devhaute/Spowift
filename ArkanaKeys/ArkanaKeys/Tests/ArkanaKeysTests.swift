// DO NOT MODIFY
// Automatically generated by Arkana (https://github.com/rogerluan/arkana)

import Foundation
import ArkanaKeysInterfaces
import XCTest
@testable import ArkanaKeys

final class KeysTests: XCTestCase {
    private var salt: [UInt8]!
    private var globalSecrets: KeysGlobalProtocol!

    override func setUp() {
        super.setUp()
        salt = [
            0x37, 0x43, 0xd5, 0xe2, 0x78, 0x49, 0xe3, 0xe8, 0x51, 0xe3, 0xf4, 0x46, 0x54, 0x24, 0xf7, 0xf6, 0x72, 0xb0, 0x9f, 0xc1, 0x53, 0x3, 0x26, 0xb9, 0x72, 0x6e, 0x2c, 0xd, 0xe3, 0xce, 0x26, 0xe, 0x51, 0x8f, 0x63, 0xd3, 0x1c, 0xbc, 0x8b, 0xd5, 0x26, 0xc3, 0x86, 0xbd, 0x45, 0x57, 0x89, 0x4a, 0xe, 0x49, 0xda, 0xe7, 0x12, 0xc9, 0, 0x84, 0x60, 0xae, 0x35, 0x86, 0x4d, 0x17, 0xef, 0xe8
        ]
        globalSecrets = Keys.Global()
    }

    override func tearDown() {
        globalSecrets = nil
        salt = nil
        super.tearDown()
    }

    func test_decodeRandomHexKey_shouldDecode() {
        let encoded: [UInt8] = [
            0x1, 0x71, 0xe2, 0xd2, 0x4d, 0x28, 0x85, 0xda, 0x66, 0x81, 0xc7, 0x75, 0x67, 0x13, 0xc4, 0xc1, 0x10, 0x87, 0xa6, 0xa4, 0x60, 0x34, 0x13, 0x89, 0x16, 0x5d, 0x1a, 0x3b, 0x87, 0xaa, 0x10, 0x3e, 0x65, 0xea, 0x7, 0xe6, 0x2f, 0xdf, 0xbd, 0xb4, 0x13, 0xa5, 0xe4, 0x84, 0x77, 0x60, 0xed, 0x29, 0x6b, 0x2a, 0xef, 0xd4, 0x23, 0xf9, 0x31, 0xe6, 0x54, 0x97, 0xc, 0xe3, 0x7c, 0x71, 0xdf, 0xd1, 0x3, 0x20, 0xb6, 0xd1, 0x1d, 0x7b, 0xd0, 0x8a, 0x60, 0xdb, 0xc0, 0x7f, 0x32, 0x17, 0xc0, 0x90, 0x44, 0xd6, 0xfe, 0xa2, 0x35, 0x3a, 0x15, 0xdb, 0x10, 0xc, 0x1f, 0x34, 0x80, 0xa8, 0x13, 0x3b, 0x65, 0xb6, 0, 0xea, 0x25, 0xde, 0xbd, 0xb0, 0x45, 0xa5, 0xb3, 0x85, 0x23, 0x34, 0xed, 0x79, 0x3c, 0x28, 0xe3, 0xd5, 0x2b, 0xaf, 0x62, 0xe2, 0x1, 0x96, 0x1, 0xb3, 0x7b, 0x72, 0xd6, 0xda
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "62705af27b333737b79e3750d366dd604ed53c6a5fb927dcec53101b499e1f094cc3e23b1849f37f6facf93bbb39cf5549c99b6ecf58fcd32a929fbfa8456e92")
    }

    func test_decodeRandomBase64Key_shouldDecode() {
        let encoded: [UInt8] = [
            0x2, 0x2d, 0xe0, 0xd5, 0x39, 0x1, 0x8f, 0xbc, 0x63, 0xc8, 0x85, 0x17, 0x32, 0x47, 0xa4, 0xb3, 0x17, 0xd2, 0xdd, 0x89, 0x11, 0x4c, 0x4f, 0xed, 0x6, 0x19, 0x68, 0x4e, 0xab, 0x9c, 0x70, 0x37, 0x3d, 0xe5, 0, 0xb0, 0x7f, 0xd4, 0xcf, 0x82, 0x6b, 0xec, 0xd7, 0xfe, 0x74, 0x12, 0xa2, 0x21, 0x7b, 0x7c, 0x99, 0xab, 0x2b, 0x85, 0x72, 0xc0, 0x7, 0xca, 0x6f, 0xa9, 0x24, 0x67, 0x81, 0xb9, 0x5a, 0x6, 0x8f, 0x88, 0x31, 0xc, 0xae, 0xa4, 0x8, 0xbb, 0xb6, 0x28, 0x2, 0x50, 0x98, 0xb9, 0x11, 0xe9, 0xf8, 0x8f, 0x35, 0x52, 0x1b, 0x84
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "5n57AHlT2+qQfcSEebBHBOiTtwDCHRV9ljccchDWM/QC1E+ku5CL9LrDgdZ/ipnQmEZjIEMLYXBnVtoOcYgNfQ==")
    }

    func test_decodeUUIDKey_shouldDecode() {
        let encoded: [UInt8] = [
            0x54, 0x25, 0xed, 0xd6, 0x1d, 0x2a, 0xd1, 0xda, 0x7c, 0xd5, 0x95, 0x70, 0x37, 0x9, 0xc3, 0x97, 0x43, 0xd1, 0xb2, 0xa3, 0x31, 0x36, 0x1f, 0x94, 0x41, 0x5f, 0x1c, 0x34, 0xd4, 0xfa, 0x16, 0x3e, 0x61, 0xb8, 0x55, 0xe4
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "cf84ec22-6a6c-4a1a-bb59-310974000767")
    }

    func test_decodeTrueBoolValue_shouldDecode() {
        let encoded: [UInt8] = [
            0x43, 0x31, 0xa0, 0x87
        ]
        XCTAssertTrue(Keys.decode(encoded: encoded, cipher: salt))
    }

    func test_decodeFalseBoolValue_shouldDecode() {
        let encoded: [UInt8] = [
            0x51, 0x22, 0xb9, 0x91, 0x1d
        ]
        XCTAssertFalse(Keys.decode(encoded: encoded, cipher: salt))
    }

    func test_decodeIntValue_shouldDecode() {
        let encoded: [UInt8] = [
            0x3, 0x71
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), 42)
    }

    func test_encodeAndDecodeValueWithDollarSign_shouldDecode() {
        let encoded: [UInt8] = [
            0x45, 0x26, 0xb4, 0x8e, 0x27, 0x6d, 0x8f, 0x81, 0x3c, 0xbc, 0x87, 0x2e, 0x35, 0x40, 0x8e
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andEscaped_andNoQuotes_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithDollarSignEscapedAndAndNoQuotesKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andEscaped_andDoubleQuotes_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithDollarSignEscapedAndDoubleQuoteKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andNotEscaped_andSingleQuotes_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithDollarSignNotEscapedAndSingleQuoteKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andNotEscaped_andDoubleQuotes_shouldDecodeWithUnexpectedValue() {
        XCTAssertNotEqual(globalSecrets.secretWithDollarSignNotEscapedAndDoubleQuotesKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andNotEscaped_andNoQuotes_shouldDecodeWithUnexpectedValue() {
        XCTAssertNotEqual(globalSecrets.secretWithDollarSignNotEscapedAndNoQuotesKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withWeirdCharacters_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithWeirdCharactersKey, "` ~ ! @ # % ^ & * ( ) _ - + = { [ } } | : ; ' < , > . ? /")
    }
}
