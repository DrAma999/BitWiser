//
//  Error.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

public extension BitWiser {
    enum Error: CustomNSError, LocalizedError {
        case wrongBitCount(count: Int)
    }
}
