import XCTest
@testable import BitWiser

final class BitWiserTests: XCTestCase {
    
    func testByteDescription() throws {
        var value: Byte = 0b00000000
        var binDescription = value.binaryDescription
        var hexDescription = value.hexDescription
        XCTAssertTrue(binDescription == "00000000")
        XCTAssertTrue(hexDescription == "00")

        value = 0b11111111
        binDescription = value.binaryDescription
        hexDescription = value.hexDescription
        XCTAssertTrue(binDescription == "11111111")
        XCTAssertTrue(hexDescription == "FF")
        
        value = 0b11101001
        binDescription = value.binaryDescription
        hexDescription = value.hexDescription
        XCTAssertTrue(binDescription == "11101001")
        XCTAssertTrue(hexDescription == "E9")
    }
    
    func testTruncatedByteDescription() throws {
        var value: Byte = 0b0
        var binDescription = value.binaryDescription
        var hexDescription = value.hexDescription
        XCTAssertTrue(binDescription == "00000000")
        XCTAssertTrue(hexDescription == "00")

        value = 0b1111
        binDescription = value.binaryDescription
        hexDescription = value.hexDescription
        XCTAssertTrue(binDescription == "00001111")
        XCTAssertTrue(hexDescription == "0F")
        
        value = 0b1001
        binDescription = value.binaryDescription
        hexDescription = value.hexDescription
        XCTAssertTrue(binDescription == "00001001")
        XCTAssertTrue(hexDescription == "09")
    }
    
    func testBitManipulation() throws {
        var value: Byte = 0b11111111
        var result = BitWiser.resetBit(value, at: 0)
        XCTAssertTrue(result == 0b11111110)
        value = result
        result = BitWiser.resetBit(value, at: 7)
        XCTAssertTrue(result == 0b01111110)
        
        value = result
        result = BitWiser.setBit(value, at: 0)
        XCTAssertTrue(result == 0b01111111)
        value = result
        result = BitWiser.setBit(value, at: 7)
        XCTAssertTrue(result == 0b11111111)
        
        value = result
        result = BitWiser.changeBit(value, at: 4, to: .zero)
        XCTAssertTrue(result == 0b11101111)
        
        var bitValue = BitWiser.bit(result, at: 4)
        XCTAssertTrue(bitValue == 0)
        bitValue = BitWiser.bit(result, at: 5)
        XCTAssertTrue(bitValue == 1)

        value = result
        result = BitWiser.changeBit(value, at: 4, to: .one)
        XCTAssertTrue(result == 0b11111111)
        
        value = result
        result = BitWiser.toggleBit(value, at: 4)
        XCTAssertTrue(result == 0b11101111)

    }
}
