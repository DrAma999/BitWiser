//
//  DSLTests.swift
//  
//
//  Created by Andrea Finollo on 30/01/22.
//

import XCTest
@testable import BitWiser

class DSLTests: XCTestCase {
    
    struct CustomData: DataConvertible {
        var data: Data {
            withUnsafeBytes(of: UInt8(6)) { Data($0) }
        }
    }

        
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
    
    var byteArrayClause = true
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause() -> [Byte] {
        [Byte(0x00)]
        Byte(0x01)
        0x02
        [UInt8(0x03)]
        if byteArrayClause {
            [UInt8](repeating: 0x04, count: 1)
        }
    }
    
    @ByteArrayBuilder func buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause() -> [Byte] {
        [Byte(0x00)]
        Byte(0x01)
        0x02
        [UInt8(0x03)]
        if byteArrayClause {
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
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }
    
    func testArrayOfBytesFromVaridicByteArrayOfBytes() throws {
        let value = buildArrayOfBytesFromVaridicByteArrayOfBytes()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytes() throws {
        let value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytes()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause() throws {
        byteArrayClause = true
        var value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
        
        byteArrayClause = false
        value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause() throws {
        byteArrayClause = true
        var value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
        
        byteArrayClause = false
        value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesIfElseClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }

    }
    
    func testArrayOfBytesFromVaridicMixedByteArrayOfBytesLoop() throws {
        let value = buildArrayOfBytesFromVaridicMixedByteArrayOfBytesLoop()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }
    
    func testDataConversion() throws {
        let value = UInt16(0b1100_1100_1010_1010)
        let bytes = value.bytes
        let dataFromValue = Data(bytes: bytes)
        
        let dslData = Data {
            0b1010_1010
            0b1100_1100
        }
        
        let dslByteArray = Array<Byte> {
            0b1010_1010
            0b1100_1100
        }
        XCTAssertEqual(dslByteArray, bytes)
        XCTAssertEqual(dslData, dataFromValue)
    }
    
    var dataClause = true
    
    @DataConvertibleBuilder func buildDataFromVaridicData() -> Data {
        UInt8(0)
        UInt8(1)
        UInt8(2)
        UInt8(3)
        UInt8(4)
    }
    
    @DataConvertibleBuilder func buildDataFromVaridicDataArrayOfData() -> Data {
        [UInt8(0)]
        [UInt8(1)]
        [UInt8(2)]
        [UInt8(3)]
        [UInt8(4)]
    }
    
    @DataConvertibleBuilder func buildDataFromVaridicMixedData() -> Data {
        [UInt8(0)]
        UInt8(1)
        Int8(2)
        "\u{03}"
        Int16(1284)
        CustomData()
    }
    
    @DataConvertibleBuilder func buildDataFromVaridicMixedDataIfClause() -> Data {
        [UInt8(0)]
        UInt8(1)
        Int8(2)
        "\u{03}"
        Int16(1284)
        if dataClause {
            CustomData()
        }
    }
    
    @DataConvertibleBuilder func buildDataFromVaridicMixedDataIfElseClause() -> Data {
        [UInt8(0)]
        UInt8(1)
        Int8(2)
        "\u{03}"
        Int16(1284)
        if dataClause {
            CustomData()
        } else {
            UInt8(6)
            UInt8(7)
        }
    }
    
    @DataConvertibleBuilder func buildDataFromVaridicMixedDataLoop() -> Data {
        [UInt8(0)]
        UInt8(1)
        Int8(2)
        "\u{03}"
        Int16(1284)
        for value in [UInt8(6), UInt8(7)] {
            value
        }
    }
    
    func testDataFromVaridicData() throws {
        let value = buildDataFromVaridicData()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }
    
    func testDataFromVaridicDataArrayOfData() throws {
        let value = buildDataFromVaridicDataArrayOfData()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }

    func testDataFromVaridicMixedData() throws {
        let value = buildDataFromVaridicMixedData()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }

    func testDataFromVaridicMixedDataIfClause() throws {
        dataClause = true

        var value = buildDataFromVaridicMixedDataIfClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
        
        dataClause = false
        
        value = buildDataFromVaridicMixedDataIfClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }

    func testDataFromVaridicMixedDataIfElseClause() throws {
        dataClause = true

        var value = buildDataFromVaridicMixedDataIfElseClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
        
        dataClause = false
        
        value = buildDataFromVaridicMixedDataIfElseClause()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }

    }

    func testDataFromVaridicMixedDataLoop() throws {
        let value = buildDataFromVaridicMixedDataLoop()
        value.enumerated().forEach { (index, value) in
            let uIndex = UInt8(index)
            XCTAssertEqual(uIndex, value)
        }
    }

}

