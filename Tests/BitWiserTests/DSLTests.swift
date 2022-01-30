//
//  DSLTests.swift
//  
//
//  Created by Andrea Finollo on 30/01/22.
//

import XCTest
@testable import BitWiser

class DSLTests: XCTestCase {
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicBytes() -> [Byte] {
        Byte(0x00)
        Byte(0x01)
        Byte(0x02)
        Byte(0x03)
        UInt8(0x04)
    }

    @ByteArrayBuilder func buildArrayOfBytesFromVaridicByteArrayOfBytes() -> [Byte] {
        [Byte(0x00)]
        [Byte(0x01)]
        [Byte(0x02)]
        [Byte(0x03)]
        [UInt8(0x04)]
    }
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytes() -> [Byte] {
        [Byte(0x00)]
        [Byte(0x01)]
        Byte(0x02)
        0x03
        [UInt8(0x04)]
        [UInt8](repeating: 0x05, count: 1)
    }
    
    var clause = true
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause() -> [Byte] {
        [Byte(0x00)]
        [Byte(0x01)]
        Byte(0x02)
        0x03
        [UInt8(0x04)]
        if clause {
            [UInt8](repeating: 0x05, count: 1)
        }
    }
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause() -> [Byte] {
        [Byte(0x00)]
        [Byte(0x01)]
        Byte(0x02)
        0x03
        [UInt8(0x04)]
        if clause {
            [UInt8](repeating: 0x05, count: 1)
        } else {
            0x05
            0x06
        }
    }
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesLoop() -> [Byte] {
        [Byte(0x00)]
        [Byte(0x01)]
        Byte(0x02)
        0x03
        [UInt8(0x04)]
        for value in [0x05, 0x06] {
            Byte(value)
        }
    }
    
    func testByteArrayCreationFromVaridicArrayOfBytes() throws {
       
    }
}
