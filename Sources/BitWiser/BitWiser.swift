import Foundation

public struct BitWiser {
    
    static func changeBit(_ value: Byte, at index: Int, to bit: Bit) -> Byte {
        (value & ~(1 << index)) | (bit.rawValue << index)
    }
    
    static func setBit(_ value: Byte, at index: Int) -> Byte {
        value | ( 1 << index)
    }
    
    static func resetBit(_ value: Byte, at index: Int) -> Byte {
        value & ~( 1 << index)
    }
    
    static func toggleBit(_ value: Byte, at index: Int) -> Byte {
        value ^ ( 1 << index)
    }
    
    static func bit(_ value: Byte, at index: Int) -> Byte {
        (value & ( 1 << index )) >> index
    }
    
    /// Check if a bit is set at a specific index
    /// - Parameters:
    ///   - index: the index at wich we want to check the bit
    ///   - value: the value you want to check
    /// - Returns: `true` if a bit is set to one at a specified index
    static func isBitSet(_ value: Byte, at index: Int) -> Bool {
        if value & ( 1 << index ) == 1 {
            return true
        }
        else {
          return false
        }
    }
    
    
    /// This methods return the index of the first bit set
    /// - Parameter value: the value you want to check
    /// - Returns: the position of the MSB  set to 1
    static func firstBitSetIndex(_ value: Byte) -> Int? {
        guard value != 0 else {
            return nil
        }
        let result = log2(Double(value & (~value + 1)))
        return Int(result)
    }
    
    /// Method to convert a `Bit` array to a `Byte`
    /// - Parameters:
    ///   - bits: the array of bit that must be converted into one byte
    ///   - shouldFill: if the array bit number is lower that 8 is possible to add a filler of zeros
    /// - Returns: A `Byte` if the number of bit i lower that 8 and `shouldFill` is false i throws an error, same if number is higher that 8
    public static func byte(bits: [Bit], shouldFill: Bool = false) throws -> Byte {
        guard case let count = bits.count,
              (count < 8 && shouldFill) else {
                  throw BitWiser.Error.wrongBitCount(count: bits.count)
              }
        guard case let filler = 8 - count,
                filler > 0 else {
                throw BitWiser.Error.wrongBitCount(count: bits.count)
        }
        let arr = Array(repeating: Bit.zero, count: filler) + bits
        return try bytes(bits: arr).first!
    }
    
    /// Method to convert a `Bit` array to a `Byte` array
    /// - Parameters:
    ///   - bits: the array of bit that must be converted into one byte
    /// - Returns: A `Byte` array  if the number of bit is not multiple of 8 it throws an error
    public static func bytes(bits: [Bit]) throws -> [Byte] {
        guard bits.count % 8 == 0 else {
            throw BitWiser.Error.wrongBitCount(count: bits.count)
        }
        let numBytes = 1 + (bits.count - 1) / 8
        
        var bytes = [UInt8](repeating : 0, count : numBytes)
        for pos in 0 ..< numBytes {
            let val = 128 * bits[8 * pos].value +
                64 * bits[8 * pos + 1].value +
                32 * bits[8 * pos + 2].value +
                16 * bits[8 * pos + 3].value +
                8 * bits[8 * pos + 4].value +
                4 * bits[8 * pos + 5].value +
                2 * bits[8 * pos + 6].value +
                1 * bits[8 * pos + 7].value
            bytes[pos] = UInt8(val)
        }
        return bytes
    }
}
