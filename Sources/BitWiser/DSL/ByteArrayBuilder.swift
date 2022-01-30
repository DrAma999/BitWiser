//
//  ByteArrayBuilder.swift
//  
//
//  Created by Andrea Finollo on 30/01/22.
//

import Foundation


/// `ByteArrayBuilder` is a `@resultBuilder` to create sequence of `Byte` in a DSL style
@resultBuilder
public enum ByteArrayBuilder {
    
    public static func buildBlock(_ components: [Byte]...) -> [Byte] {
        components.flatMap { $0 }
    }
    
    public static func buildExpression(_ expression: [Byte]) -> [Byte] {
        expression
    }
    
    public static func buildExpression(_ expression: Byte) -> [Byte] {
        [expression]
    }
    
    public static func buildOptional(_ component: [Byte]?) -> [Byte] {
        component ?? []
    }
    
    public static func buildEither(first component: [Byte]) -> [Byte] {
        component
    }
    
    public static func buildEither(second component: [Byte]) -> [Byte] {
        component
    }
    
    public static func buildArray(_ components: [[Byte]]) -> [Byte] {
        return components.flatMap { $0 }
    }
    
    
}
