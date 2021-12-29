//
//  ByteTests.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import XCTest
@testable import BitWiser

class ByteTests: XCTestCase {

    func testNibble() throws {
        let value: Byte = 0b01011111
        let (msb, lsb) = value.nibbles
        let msbDescription = msb.binaryDescription
        let lsbDescription = lsb.binaryDescription
    }

}
