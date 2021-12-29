//
//  ByteRepresentable.swift
//  
//
//  Created by Andrea Finollo on 29/12/21.
//

import Foundation

public protocol ByteRepresentable {
    var bytes: [Byte] { get }
    init(bytes: [Byte])
}
