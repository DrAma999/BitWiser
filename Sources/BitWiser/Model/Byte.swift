//
//  Byte.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

public typealias Byte = UInt8

public extension Byte {
    /// Returns the `Bit` represention of a specific byte in an array
    var bits: [Bit] {
        let bitsOfAbyte = 8
        var bitsArray = [Bit](repeating: Bit.zero, count: bitsOfAbyte)
        for (index, _) in bitsArray.enumerated() {
            // Bitwise shift to clear unrelevant bits
            let bitVal: UInt8 = 1 << UInt8(bitsOfAbyte - 1 - index)
            let check = self & bitVal
            
            if check != 0 {
                bitsArray[index] = Bit.one
            }
        }
        return bitsArray
    }
    
    /// Returns the `Nibble` represention
    var nibbles: (msb: Nibble, lsb: Nibble) {
        let msb = (self & 0xF0) >> 4
        let lsb = (self & 0x0F)
        return (msb: msb, lsb: lsb)
    }
    
    /// Subscript to read or write a `Byte` at specific index
    subscript(index: Int) -> Byte {
        get {
            // precondition
            BitWiser.bit(self, at: index)
        }
        set(newValue) {
            //precondition
            self = BitWiser.changeBit(self, at: index, to: Bit(rawValue: newValue)!)
        }
    }
    
}

fileprivate extension String {
    
    func leftPad(with character: Character, length: UInt) -> String {
        let maxLength = Int(length) - count
        guard maxLength > 0 else {
            return self
        }
        return String(repeating: String(character), count: maxLength) + self
    }
}

extension Byte {
    var binaryDescription: String {
        String(self, radix: 2).leftPad(with: "0", length: 8)
    }
    
    var hexDescription: String {
        String(self, radix: 16).leftPad(with: "0", length: 2).uppercased()
    }
}
