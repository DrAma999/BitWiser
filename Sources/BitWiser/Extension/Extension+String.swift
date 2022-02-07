//
//  Extension+String.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

extension String: DataConvertible {
    
    public init?(data: Data) {
        self.init(data: data, encoding: .utf8)
    }
    
    public var data: Data {
        // Note: a conversion to UTF-8 cannot fail.
        return Data(self.utf8)
    }
}

public extension String {
    /// Given a hex string it returns a Data
    /// - Returns: a `Data` value
    /// - Note: It does not validate input, string must be even and only hex alphabet thanks to https://stackoverflow.com/questions/39075043/how-to-convert-data-to-hex-string-in-swift
    /// - Important: Indexing is resolved here as first pair as LSB es: "DEAD" prints DE-AD
    func hexDecodedData() -> Data {
        // Get the UTF8 characters of this string
        let chars = Array(utf8)
        
        // Keep the bytes in an UInt8 array and later convert it to Data
        var bytes = [UInt8]()
        bytes.reserveCapacity(count / 2)
        
        // It is a lot faster to use a lookup map instead of strtoul
        let map: [UInt8] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, // 01234567
            0x08, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 89:;<=>?
            0x00, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, // @ABCDEFG
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00  // HIJKLMNO
        ]
        
        // Grab two characters at a time, map them and turn it into a byte
        for i in stride(from: 0, to: count, by: 2) {
            let index1 = Int(chars[i] & 0x1F ^ 0x10)
            let index2 = Int(chars[i + 1] & 0x1F ^ 0x10)
            bytes.append(map[index1] << 4 | map[index2])
        }
        
        return Data(bytes)
    }
    
    func hexDecodedByte() -> [Byte] {
        // Need a further reverse since hexDecoded alredy in right format
        return hexDecodedData()
            .bytes
    }
}
