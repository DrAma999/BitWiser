//
//  DataConvertibleBuilder.swift
//  
//
//  Created by Andrea Finollo on 04/02/22.
//

import Foundation

/// `DataConvertibleBuilder` is a `@resultBuilder` to create  `Data` in a DSL style
@resultBuilder
public enum DataConvertibleBuilder {
    
    public static func buildBlock(_ components: DataConvertible...) -> Data {
        return components.reduce(Data()) { partialResult, value in
            var mutBuffer = partialResult
            mutBuffer.append(value.data)
            return mutBuffer
        }
    }
    
    public static func buildExpression(_ expression: [DataConvertible]) -> Data {
        return expression.reduce(Data()) { partialResult, value in
            var mutBuffer = partialResult
            mutBuffer.append(value.data)
            return mutBuffer
        }
    }
    
    public static func buildExpression(_ expression: DataConvertible) -> Data {
        expression.data
    }
    
    public static func buildOptional(_ component: DataConvertible?) -> Data {
        return component?.data ?? Data()
    }
    
    public static func buildEither(first component: DataConvertible) -> Data {
        return component.data
    }
    
    public static func buildEither(second component: DataConvertible) -> Data {
        return component.data
    }
    
    public static func buildArray(_ components: [DataConvertible]) -> Data {
        return components
            .reduce(Data()) { partialResult, value in
                var mutBuffer = partialResult
                mutBuffer.append(value.data)
                return mutBuffer
            }
    }
    
}
