//
//  Extension+Data.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

extension Data: ByteRepresentable {
  
    public var bytes: [Byte] {
        return [Byte](self)
    }
    
    public init(bytes: [Byte]) {
        self = Data(bytes)
    }
}

public extension Data {
    
    /// Option about how to encode the hex string representation
    struct HexEncodingOptions: OptionSet {
        public let rawValue: UInt8
        
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
        static let bytePadding = HexEncodingOptions(rawValue: 1 << 1)
        
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
    
    
    /// Returns a hex representation of the given data value
    /// - Parameter options: `HexEncodingOptions` option
    /// - Returns: a hex encoded string
    /// - Note: thanks to Martin R. https://stackoverflow.com/questions/39075043/how-to-convert-data-to-hex-string-in-swift
    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        let padding = options.contains(.bytePadding) ? "-" : ""
        return self.map {
            String(format: format, $0)
        }.joined(separator: padding)
    }
}
