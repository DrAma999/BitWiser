import XCTest
@testable import BitWiser

final class BitWiserTestsNumeric: XCTestCase {
    
    func testNumerics() {

        XCTAssertEqual(Int16(0x0F_F0), Int16(0x0F_F0).bytes.leInt16(fromOffset: 0))
        XCTAssertEqual(Int32(0x0F_F0_FF_00), Int32(0x0F_F0_FF_00).bytes.leInt32(fromOffset: 0))
        XCTAssertEqual(Int64(0x0F_F0_FF_00_AA_BB_CC_DD), Int64(0x0F_F0_FF_00_AA_BB_CC_DD).bytes.leInt64(fromOffset: 0))

        XCTAssertNotEqual(Int64(0x0F_F0_FF_00_AA_BB_CC_DD), Int64(0x0F_F0_FF_00_AA_BB_CC_DD).byteSwapped.bytes.leInt64(fromOffset: 0))

        XCTAssertEqual(UInt16(0x0F_F0), UInt16(0x0F_F0).bytes.leUInt16(fromOffset: 0))
        XCTAssertEqual(UInt32(0x0F_F0_FF_00), UInt32(0x0F_F0_FF_00).bytes.leUInt32(fromOffset: 0))
        XCTAssertEqual(UInt64(0x0F_F0_FF_00_AA_BB_CC_DD), UInt64(0x0F_F0_FF_00_AA_BB_CC_DD).bytes.leUInt64(fromOffset: 0))

        XCTAssertNotEqual(UInt64(0x0F_F0_FF_00_AA_BB_CC_DD), UInt64(0x0F_F0_FF_00_AA_BB_CC_DD).byteSwapped.bytes.leUInt64(fromOffset: 0))
    }

    func testBytesConversion() {

        XCTAssertEqual([0x0F, 0xF0], Int16(0x0F_F0).byteSwapped.bytes)
        XCTAssertEqual([0xF0, 0x0F], Int16(0x0F_F0).bytes)

        XCTAssertEqual([0x0F, 0xFF, 0xFF, 0xFF], Int32(0x0F_FF_FF_FF).byteSwapped.bytes)
        XCTAssertEqual([0x0F, 0xFF, 0xFF, 0xFF].reversed(), Int32(0x0F_FF_FF_FF).bytes)
        XCTAssertEqual([0xFF, 0xFF, 0xFF, 0xFF], UInt32(0xFF_FF_FF_FF).byteSwapped.bytes)
        XCTAssertEqual([0xFF, 0xFF, 0xFF, 0xFF].reversed(), UInt32(0xFF_FF_FF_FF).bytes)
    }
}
