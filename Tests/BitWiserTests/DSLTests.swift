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
        UInt8(0x4)
    }

    @ByteArrayBuilder func buildArrayOfBytesFromVaridicByteArrayOfBytes() -> [Byte] {
        [Byte(0x00)]
        [Byte(0x01)]
        [Byte(0x02)]
        [Byte(0x03)]
        [UInt8(0x4)]
    }
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytes() -> [Byte] {
        [Byte(0x00)]
        [Byte(0x01)]
        Byte(0x02)
        0x03
        [UInt8(0x4)]
        [UInt8](repeating: 0xFF, count: 8)
    }
    
    func testByteArrayCreationFromVaridicArrayOfBytes() throws {
       
    }
}
