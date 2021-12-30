//
//  Bit.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

public enum Bit: UInt8 {
    case zero = 0
    case one = 1
    
    public var value: Int {
        return (self == .one) ? 1 : 0
    }
}

extension Bit: CustomStringConvertible {
    public var description: String {
        return self == .zero ? "false" : "true"
    }
}

extension Bit: CustomDebugStringConvertible {
    public var debugDescription: String {
        return self == .zero ? "0" : "1"
    }
}

public extension Array where Element == Bit {
    /// Get a byte from 8 `Bit` array
    /// - Important: lsb is always at index 0
    var byte: Byte {
        get throws {
            try BitWiser.byte(bits: self)
        }
    }
    
    /// Get a bytes from % 8 `Bit` array.
    /// - Important: LSB is always at index 0, eventual Endianess must be taken into account
    var bytes: [Byte] {
        get throws {
            try BitWiser.bytes(bits: self)
        }
    }
}
