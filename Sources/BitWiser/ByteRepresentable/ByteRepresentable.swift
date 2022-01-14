//
//  ByteRepresentable.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

public protocol ExpressibleByBytes {
    init(bytes: [Byte])
}

public protocol ByteConvertible {
    var bytes: [Byte] { get }
}

public typealias ByteRepresentable = ExpressibleByBytes & ByteConvertible
