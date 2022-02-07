//
//  DataRepresentable.swift
//  
//
//  Created by Andrea Finollo on 04/02/22.
//

import Foundation

public protocol ExpressibleByData {
    init?(data: Data)
}

public protocol DataConvertible {
    var data: Data { get }
}

public typealias DataRepresentable = ExpressibleByData & DataConvertible
