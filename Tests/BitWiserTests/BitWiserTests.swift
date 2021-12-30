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
    
    func testDecodeHexStringToData() throws {
        let dataString = "DEADBEEF"
        let data = dataString.hexDecodedData()
        let bytes = dataString.hexDecodedByte()
        let revertDataString = data.hexEncodedString(options: .upperCase)
        let revertDataFromBytes = Data(bytes: bytes)
        XCTAssertEqual(revertDataString, dataString)
        XCTAssertEqual(revertDataFromBytes, data)
    }
    
    func testFirstBitSet() throws {
        var value = Byte(0b0101_1110)
        var index = try XCTUnwrap(BitWiser.firstTrailBitSetIndex(value))
        XCTAssertEqual(index, 1)
        
        value = Byte(0b0101_1111)
        index = try XCTUnwrap(BitWiser.firstTrailBitSetIndex(value))
        XCTAssertEqual(index, 0)
        
        value = Byte(0b1000_0000)
        index = try XCTUnwrap(BitWiser.firstTrailBitSetIndex(value))
        XCTAssertEqual(index, 7)
        
        value = Byte(0)
        XCTAssertNil(BitWiser.firstTrailBitSetIndex(value))
    }
    
}
