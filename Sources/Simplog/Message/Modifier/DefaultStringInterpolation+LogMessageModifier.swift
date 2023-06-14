//
//  File.swift
//  
//
//  Created by Niklas Holloh on 10.06.21.
//

import Foundation

public extension DefaultStringInterpolation {
    mutating func appendInterpolation(insert modifier: LogMessageModifier) {
        appendLiteral(modifier.modifiedString)
    }
}
