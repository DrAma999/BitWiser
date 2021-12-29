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
    
    func testByteManipulation() throws {
        var value: Byte = 0b00000000
        // Test bit properties
        value.b0 = .one
        XCTAssert(value.b0 == .one)
        XCTAssert(value.b1 == .zero)
        XCTAssert(value.b2 == .zero)
        XCTAssert(value.b3 == .zero)
        XCTAssert(value.b4 == .zero)
        XCTAssert(value.b5 == .zero)
        XCTAssert(value.b6 == .zero)
        XCTAssert(value.b7 == .zero)
        XCTAssert(value == 0b00000001)
        
        value = 0b00000000
        value.b1 = .one
        XCTAssert(value.b0 == .zero)
        XCTAssert(value.b1 == .one)
        XCTAssert(value.b2 == .zero)
        XCTAssert(value.b3 == .zero)
        XCTAssert(value.b4 == .zero)
        XCTAssert(value.b5 == .zero)
        XCTAssert(value.b6 == .zero)
        XCTAssert(value.b7 == .zero)
        XCTAssert(value == 0b00000010)
        
        value = 0b00000000
        value.b2 = .one
        XCTAssert(value.b0 == .zero)
        XCTAssert(value.b1 == .zero)
        XCTAssert(value.b2 == .one)
        XCTAssert(value.b3 == .zero)
        XCTAssert(value.b4 == .zero)
        XCTAssert(value.b5 == .zero)
        XCTAssert(value.b6 == .zero)
        XCTAssert(value.b7 == .zero)
        XCTAssert(value == 0b00000100)
        
        value = 0b00000000
        value.b3 = .one
        XCTAssert(value.b0 == .zero)
        XCTAssert(value.b1 == .zero)
        XCTAssert(value.b2 == .zero)
        XCTAssert(value.b3 == .one)
        XCTAssert(value.b4 == .zero)
        XCTAssert(value.b5 == .zero)
        XCTAssert(value.b6 == .zero)
        XCTAssert(value.b7 == .zero)
        XCTAssert(value == 0b00001000)
        
        value = 0b00000000
        value.b4 = .one
        XCTAssert(value.b0 == .zero)
        XCTAssert(value.b1 == .zero)
        XCTAssert(value.b2 == .zero)
        XCTAssert(value.b3 == .zero)
        XCTAssert(value.b4 == .one)
        XCTAssert(value.b5 == .zero)
        XCTAssert(value.b6 == .zero)
        XCTAssert(value.b7 == .zero)
        XCTAssert(value == 0b00010000)
        
        value = 0b00000000
        value.b5 = .one
        XCTAssert(value.b0 == .zero)
        XCTAssert(value.b1 == .zero)
        XCTAssert(value.b2 == .zero)
        XCTAssert(value.b3 == .zero)
        XCTAssert(value.b4 == .zero)
        XCTAssert(value.b5 == .one)
        XCTAssert(value.b6 == .zero)
        XCTAssert(value.b7 == .zero)
        XCTAssert(value == 0b00100000)
        
        value = 0b00000000
        value.b6 = .one
        XCTAssert(value.b0 == .zero)
        XCTAssert(value.b1 == .zero)
        XCTAssert(value.b2 == .zero)
        XCTAssert(value.b3 == .zero)
        XCTAssert(value.b4 == .zero)
        XCTAssert(value.b5 == .zero)
        XCTAssert(value.b6 == .one)
        XCTAssert(value.b7 == .zero)
        XCTAssert(value == 0b01000000)
        
        value = 0b00000000
        value.b7 = .one
        XCTAssert(value.b0 == .zero)
        XCTAssert(value.b1 == .zero)
        XCTAssert(value.b2 == .zero)
        XCTAssert(value.b3 == .zero)
        XCTAssert(value.b4 == .zero)
        XCTAssert(value.b5 == .zero)
        XCTAssert(value.b6 == .zero)
        XCTAssert(value.b7 == .one)
        XCTAssert(value == 0b10000000)
        
        // Test methods
        let testValues: [Byte] = [0b00000001,
                          0b00000010,
                          0b00000100,
                          0b00001000,
                          0b00010000,
                          0b00100000,
                          0b01000000,
                          0b10000000]
        let refValue: Byte = 0b00000000
        for (index, testValue) in testValues.enumerated() {
            var result = refValue.settingBit(index)
            XCTAssert(result == testValue)
            result = result.resetBit(index)
            XCTAssert(result == refValue)
        }
        // Test mutating methods
        var testMutValues: [Byte] = [0b00000001,
                                     0b00000011,
                                     0b00000111,
                                     0b00001111,
                                     0b00011111,
                                     0b00111111,
                                     0b01111111,
                                     0b11111111]
        var refMutValue: Byte = 0b00000000
        for (index, testValue) in testMutValues.enumerated() {
            refMutValue.setBit(index)
            XCTAssert(refMutValue == testValue)
        }
        
        testMutValues  = [0b00000000,
                          0b00000001,
                          0b00000011,
                          0b00000111,
                          0b00001111,
                          0b00011111,
                          0b00111111,
                          0b01111111]
        
        refMutValue = 0b11111111
        let count = testMutValues.count - 1
        for (index, testValue) in testMutValues.reversed().enumerated() {
            refMutValue.resetBit(count - index)
            XCTAssert(refMutValue == testValue)
        }
    }
}
