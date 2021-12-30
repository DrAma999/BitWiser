//
//  BitTests.swift
//  
//
//  Created by Andrea Finollo on 30/12/21.
//

import XCTest
@testable import BitWiser

class BitTests: XCTestCase {
    
    func testBitCreation() throws {
        let one = try XCTUnwrap(Bit(rawValue: 1))
        let zero = try XCTUnwrap(Bit(rawValue: 0))
        
        XCTAssertEqual(one, .one)
        XCTAssertEqual(zero, .zero)
        
        XCTAssertEqual(one.value, 1)
        XCTAssertEqual(zero.value, 0)

    }

    func testBitArrayRepresentation() throws {
        // Check single byte
        let value = Byte(0b1010_1010)
        let bits = value.bits
        XCTAssertFalse(bits.isEmpty)
        var debugDescription = bits.last!.debugDescription
        XCTAssertEqual(debugDescription, "1")
        var description = bits.last!.description
        XCTAssertEqual(description, "true")
        
        debugDescription = bits.first!.debugDescription
        XCTAssertEqual(debugDescription, "0")
        description = bits.first!.description
        XCTAssertEqual(description, "false")
        
        let backValue = try value.bits.byte
        XCTAssertEqual(value, backValue)
        
        let dropped = Array(bits.dropFirst())
        // Check throwing error
        XCTAssertThrowsError(try dropped.byte, "Test number lower that 8") { (error) in
            XCTAssertEqual(
                error as? BitWiser.Error,
                BitWiser.Error.wrongBitCount(count: 7)
            )
        }
        
        // Check multiple
        let first = Byte(0b1010_1010) //170
        let second = Byte(0b1100_1100) //204
        
        let full = first.bits + second.bits // 1100_1100_1010_1010
        
        let bytes = try full.bytes // [170, 204]
        XCTAssertEqual(bytes.count, 2)
        XCTAssertEqual(bytes[0], first)
        XCTAssertEqual(bytes[1], second)
        
        
        let sixteen = UInt16(0b1100_1100_1010_1010)
        let dataFromBytes = Data(bytes: bytes)
        let dataFromUInt = withUnsafeBytes(of: sixteen) { Data($0) }
        
        let revertUIntFromByte = dataFromBytes.withUnsafeBytes {
            $0.load(as: UInt16.self)
        }
        
        let revertUIntFromData = dataFromUInt.withUnsafeBytes {
            $0.load(as: UInt16.self)
        }
        
        XCTAssertEqual(dataFromUInt, dataFromBytes)
        XCTAssertEqual(revertUIntFromByte, revertUIntFromData)
        XCTAssertEqual(revertUIntFromData, sixteen)

    }

}
