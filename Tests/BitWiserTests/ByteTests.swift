//
//  ByteTests.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import XCTest
@testable import BitWiser

class ByteTests: XCTestCase {
    
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

    func testNibbleExtraction() throws {
        let value: Byte = 0b01011111
        let (msb, lsb) = value.nibbles
        XCTAssert(msb == 0b00000101)
        XCTAssert(lsb == 0b00001111)
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
            XCTAssert(result[index] == .one)
            XCTAssert(result.isBitSet(index) == true)
            XCTAssert(result.bit(index) == .one)
            XCTAssert(result == testValue)
            result.resetBit(index)
            XCTAssert(result == refValue)
        }
        
        for (index, testValue) in testValues.enumerated() {
            var result = refValue.togglingBit(index)
            XCTAssert(result == testValue)
            result = result.togglingBit(index)
            XCTAssert(result == refValue)
            XCTAssert(result.isBitSet(index) == false)
            XCTAssert(result.bit(index) == .zero)
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
        
        refMutValue = 0b00000000
        for (index, testValue) in testMutValues.enumerated() {
            refMutValue.toggleBit(index)
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
        
        refMutValue = 0b11111111
        for (index, testValue) in testMutValues.reversed().enumerated() {
            refMutValue.toggleBit(count - index)
            XCTAssert(refMutValue == testValue)
        }
        
        refMutValue = 0b11111111
        for (index, testValue) in testMutValues.reversed().enumerated() {
            refMutValue[count - index] = .zero
            XCTAssert(refMutValue == testValue)
        }
       
        
    }
    
    func testByteManipulationChaining() throws {
        // Test methods
        var value: Byte = 0b0000_0000
        let setResult = value
            .settingBit(0)
            .settingBit(1)
            .settingBit(2)
            .settingBit(3)
            .settingBit(4)
            .settingBit(5)
            .settingBit(6)
            .settingBit(7)
        XCTAssert(setResult == 0b1111_1111)

        let toggleOnResult = value
            .togglingBit(0)
            .togglingBit(1)
            .togglingBit(2)
            .togglingBit(3)
            .togglingBit(4)
            .togglingBit(5)
            .togglingBit(6)
            .togglingBit(7)
        XCTAssert(toggleOnResult == 0b1111_1111)
        
        value = 0b1111_1111
        let resetResult = value
            .resettingBit(0)
            .resettingBit(1)
            .resettingBit(2)
            .resettingBit(3)
            .resettingBit(4)
            .resettingBit(5)
            .resettingBit(6)
            .resettingBit(7)
        XCTAssert(resetResult == 0b0000_0000)
        
        let toggleOffResult = value
            .togglingBit(0)
            .togglingBit(1)
            .togglingBit(2)
            .togglingBit(3)
            .togglingBit(4)
            .togglingBit(5)
            .togglingBit(6)
            .togglingBit(7)
        XCTAssert(toggleOffResult == 0b0000_0000)
        
    }

}
