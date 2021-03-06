//
//  Extension+Numeric.swift
//  
//
//  Created by Samuele Perricone on 05/01/22.
//

import Foundation

extension DataConvertible where Self: ExpressibleByIntegerLiteral{
    public init?(data: Data) {
        var value: Self = 0
        guard data.count == MemoryLayout.size(ofValue: value) else { return nil }
        _ = withUnsafeMutableBytes(of: &value, { data.copyBytes(to: $0)} )
        self = value
    }

    public var data: Data {
        return withUnsafeBytes(of: self) { Data($0) }
    }
}

extension Int8: DataConvertible { }
extension Int16: DataConvertible { }
extension Int32: DataConvertible { }
extension Int64: DataConvertible { }
extension Int: DataConvertible { }

extension Float: DataConvertible { }
extension Double: DataConvertible { }

extension UInt8: DataConvertible { }
extension UInt16: DataConvertible { }
extension UInt32: DataConvertible { }
extension UInt64: DataConvertible { }
extension UInt: DataConvertible { }

// MARK: - Signed Numeric

extension Int16: ByteConvertible {
    public var bytes: [Byte] {
        withUnsafeBytes(of: self.littleEndian, Array.init)
    }
}

extension Int32: ByteConvertible {
    public var bytes: [Byte] {
        withUnsafeBytes(of: self.littleEndian, Array.init)
    }
}

extension Int64: ByteConvertible {
    public var bytes: [Byte] {
        withUnsafeBytes(of: self.littleEndian, Array.init)
    }
}

// MARK: - Unsigned Numeric

extension UInt16: ByteConvertible {
    public var bytes: [Byte] {
        withUnsafeBytes(of: self.littleEndian, Array.init)
    }
}

extension UInt32: ByteConvertible {
    public var bytes: [Byte] {
        withUnsafeBytes(of: self.littleEndian, Array.init)
    }
}

extension UInt64: ByteConvertible {
    public var bytes: [Byte] {
        withUnsafeBytes(of: self.littleEndian, Array.init)
    }
}

extension Array where Element == Byte {

    /// Read Little-Endian value as signed integer of 16 bit
    public func leInt16(fromOffset offset: Int) -> Int16 {
        var or: Int16 = 0
        for i in 0...1 {
            or |= Int16(self[offset + i]) << (i * 8)
        }
        return or
    }

    /// Read Little-Endian value as signed integer of 32 bit
    public func leInt32(fromOffset offset: Int) -> Int32 {
        var or: Int32 = 0
        for i in 0...3 {
            or |= Int32(self[offset + i]) << (i * 8)
        }
        return or
    }

    /// Read Little-Endian value as unsigned integer of 64 bit
    public func leInt64(fromOffset offset: Int) -> Int64 {
        var or: Int64 = 0
        for i in 0...7 {
            or |= Int64(self[offset + i]) << (i * 8)
        }
        return or
    }

    /// Read Little-Endian value as unsigned integer of 16 bit
    public func leUInt16(fromOffset offset: Int) -> UInt16 {
        var or: UInt16 = 0
        for i in 0...1 {
            or |= UInt16(self[offset + i]) << (i * 8)
        }
        return or
    }

    /// Read Little-Endian value as unsigned integer of 32 bit
    public func leUInt32(fromOffset offset: Int) -> UInt32 {
        var or: UInt32 = 0
        for i in 0...3 {
            or |= UInt32(self[offset + i]) << (i * 8)
        }
        return or
    }

    /// Read Little-Endian value as unsigned integer of 64 bit
    public func leUInt64(fromOffset offset: Int) -> UInt64 {
        var or: UInt64 = 0
        for i in 0...7 {
            or |= UInt64(self[offset + i]) << (i * 8)
        }
        return or
    }
}

public extension Array where Element == Byte {
    /// Initialize a `[Byte]`Array  with a `@ByteArrayBuilder`.
    ///
    ///     Array<Byte> {
    ///         [Byte(0x00)]
    ///         Byte(0x01)
    ///         0x02
    ///         [UInt8(0x03)]
    ///     }
    ///
    /// - parameter builder: A DSL closure with `Byte`s.
    /// - Important: Always start from the LSB
    init(@ByteArrayBuilder _ builder: () -> [Byte]) {
        self.init(builder())
    }
}
