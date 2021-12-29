import XCTest
@testable import BitWiser

final class BitWiserTests: XCTestCase {
    
    func testBitwiserManipulation() throws {
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
        XCTAssertTrue(bitValue == .zero)
        bitValue = BitWiser.bit(result, at: 5)
        XCTAssertTrue(bitValue == .one)

        value = result
        result = BitWiser.changeBit(value, at: 4, to: .one)
        XCTAssertTrue(result == 0b11111111)
        
        value = result
        result = BitWiser.toggleBit(value, at: 4)
        XCTAssertTrue(result == 0b11101111)
        
    }
    
}
