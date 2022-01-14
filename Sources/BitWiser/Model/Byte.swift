//
//  Byte.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

public typealias Byte = UInt8

// MARK: Computed properties
public extension Byte {
    
    /// Returns the `Bit` represention of a specific byte in an array.
    ///  Index 0 is the lsb
    var bits: [Bit] {
        let bitsOfAbyte = 8
        var bitsArray = [Bit](repeating: Bit.zero, count: bitsOfAbyte)
        for index in bitsArray.indices {
            // Bitwise shift to clear unrelevant bits
            let bitVal: UInt8 = 1 << UInt8(bitsOfAbyte - 1 - index)
            let check = self & bitVal
            
            if check != 0 {
                bitsArray[index] = Bit.one
            }
        }
        return bitsArray.reversed()
    }
    
    /// Returns the `Nibble` represention
    var nibbles: (msb: Nibble, lsb: Nibble) {
        let msb = (self & 0xF0) >> 4
        let lsb = (self & 0x0F)
        return (msb: msb, lsb: lsb)
    }
       
}

// MARK: Bit manipulation, bit reading
public extension Byte {
    /// Subscript to read or write a `Byte` at specific index
    subscript(position: Int) -> Bit {
        get {
            BitWiser.bit(self, at: position)
        }
        set(newValue) {
            self = BitWiser.changeBit(self, at: position, to: newValue)
        }
    }
    
    /// Query a bit in a specific position if it is one
    /// - Parameter position: index of the bit from 0...7
    /// - Returns: A boolean value. True if is set,  false if not
    func isBitSet(_ position: Int) -> Bool {
        return BitWiser.isBitSet(self, at: position)
    }
    
    /// Query a bit value in a specific position
    /// - Parameter position: index of the bit from 0...7
    /// - Returns: The `Bit` representation of the value
    func bit(_ position: Int) -> Bit {
        return BitWiser.bit(self, at: position)
    }
    
    /// Set a bit to one at a specific position
    /// - Parameter position: position of the bit
    /// - Returns: a new value with the bit set to one
    func settingBit(_ position: Int) -> Self {
        return BitWiser.setBit(self, at: position)
    }
    
    /// Set a bit to zero at a specific position
    /// - Parameter position: position of the bit
    /// - Returns: a new value with the bit set to zero
    func resettingBit(_ position: Int) -> Self {
        return BitWiser.resetBit(self, at: position)
    }
    
    /// Toggle a bit value at a specific position
    /// - Parameter position: position of the bit
    /// - Returns: a new value with the bit  toggled if 0 to 1 if 1 to 0
    func togglingBit(_ position: Int) -> Self {
        return BitWiser.toggleBit(self, at: position)
    }
    
    /// Set a bit to a value at a specific position
    /// - Parameters:
    ///   - position: position of the bit
    ///   - bit: value of the `Bit` could be zero or one
    /// - Returns: a new value with the bit changed to a specific value
    func changingBit(_ position: Int, to bit: Bit) -> Self {
        return BitWiser.changeBit(self, at: position, to: bit)
    }
    
    /// Set a bit to one at a specific position
    /// - Parameter position: position of the bit
    mutating func setBit(_ position: Int) {
        self = BitWiser.setBit(self, at: position)
    }
    
    /// Set a bit to zero at a specific position
    /// - Parameter position: position of the bit
    mutating func resetBit(_ position: Int) {
        self = BitWiser.resetBit(self, at: position)
    }

    /// Toggle a bit value at a specific position
    /// - Parameter position: position of the bit
    mutating func toggleBit(_ position: Int) {
        self = BitWiser.toggleBit(self, at: position)
    }
    
    /// Set a bit to a value at a specific position
    /// - Parameters:
    ///   - position: position of the bit
    ///   - bit: value of the `Bit` could be zero or one
    mutating func changeBit(_ position: Int, to bit: Bit) {
        self = BitWiser.changeBit(self, at: position, to: bit)
    }
    
    /// Get or set the value of the bit at 0 positon
    var b0: Bit {
        get {
            BitWiser.bit(self, at: 0)
        }
        set {
            self = BitWiser.changeBit(self, at: 0, to: newValue)
        }
    }
    
    /// Get or set the value of the bit at 1st positon
    var b1: Bit {
        get {
            BitWiser.bit(self, at: 1)
        }
        set {
            self = BitWiser.changeBit(self, at: 1, to: newValue)
        }
    }
    
    /// Get or set the value of the bit at 2nd positon
    var b2: Bit {
        get {
            BitWiser.bit(self, at: 2)
        }
        set {
            self = BitWiser.changeBit(self, at: 2, to: newValue)
        }
    }
    
    /// Get or set the value of the bit at 3rd positon
    var b3: Bit {
        get {
            BitWiser.bit(self, at: 3)
        }
        set {
            self = BitWiser.changeBit(self, at: 3, to: newValue)
        }
    }
    
    /// Get or set the value of the bit at 4th positon
    var b4: Bit {
        get {
            BitWiser.bit(self, at: 4)
        }
        set {
            self = BitWiser.changeBit(self, at: 4, to: newValue)
        }
    }
    
    /// Get or set the value of the bit at 5th positon
    var b5: Bit {
        get {
            BitWiser.bit(self, at: 5)
        }
        set {
            self = BitWiser.changeBit(self, at: 5, to: newValue)
        }
    }
    
    /// Get or set the value of the bit at 6th positon
    var b6: Bit {
        get {
            BitWiser.bit(self, at: 6)
        }
        set {
            self = BitWiser.changeBit(self, at: 6, to: newValue)
        }
    }
    
    /// Get or set the value of the bit at 7th positon
    var b7: Bit {
        get {
            BitWiser.bit(self, at: 7)
        }
        set {
            self = BitWiser.changeBit(self, at: 7, to: newValue)
        }
    }
}

// MARK: Byte description
public extension Byte {
    
    /// Provides a binary description of a byte such as *00001010*
    var binaryDescription: String {
        String(self, radix: 2).leftPad(with: "0", length: 8)
    }
    
    /// Provides a hex description of a byte such as *AF*
    var hexDescription: String {
        String(self, radix: 16).leftPad(with: "0", length: 2).uppercased()
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
