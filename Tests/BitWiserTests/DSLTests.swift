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
        Byte(0x01)
        0x02
        [UInt8(0x03)]
        [UInt8](repeating: 0x04, count: 1)
    }
    
    var clause = true
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause() -> [Byte] {
        [Byte(0x00)]
        Byte(0x01)
        0x02
        [UInt8(0x03)]
        if clause {
            [UInt8](repeating: 0x04, count: 1)
        }
    }
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause() -> [Byte] {
        [Byte(0x00)]
        Byte(0x01)
        0x02
        [UInt8(0x03)]
        if clause {
            [UInt8](repeating: 0x04, count: 1)
        } else {
            0x04
            0x05
        }
    }
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesLoop() -> [Byte] {
        [Byte(0x00)]
        Byte(0x01)
        0x02
        [UInt8(0x03)]
        for value in [0x04, 0x05] {
            Byte(value)
        }
    }
    
    func testArrayOfBytesFromVaridicBytes() throws {
        let value = buildArrayOfBytesFromVaridicBytes()
        value.enumerated().forEach { (index, value) in
            XCTAssertTrue(index == value)
        }
    }
    
    func testArrayOfBytesFromVaridicByteArrayOfBytes() throws {
        let value = buildArrayOfBytesFromVaridicByteArrayOfBytes()
        value.enumerated().forEach { (index, value) in
            XCTAssertTrue(index == value)
        }
    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytes() throws {
        let value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytes()
        value.enumerated().forEach { (index, value) in
            XCTAssertTrue(index == value)
        }
    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause() throws {
        let value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause()
        value.enumerated().forEach { (index, value) in
            XCTAssertTrue(index == value)
        }
    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause() throws {
        let value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause()
        value.enumerated().forEach { (index, value) in
            XCTAssertTrue(index == value)
        }
    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytesLoop() throws {
        let value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesLoop()
        value.enumerated().forEach { (index, value) in
            XCTAssertTrue(index == value)
        }
    }
}
