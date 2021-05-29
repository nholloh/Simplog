//
//  BracesModifier.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

public extension LogFormat {
    
    /// Represents a type of braces used for log format modifiers.
    enum BraceType {
        /// Round braces or paranthesis `()`.
        case round
        
        /// Curly braces `{}`.
        case curly
        
        /// Square brackets `[]`.
        case square
        
        /// Angle brackets `<>`.
        case angle
    }
}

public extension LogFormatItem {
    
    /// Places the original log format item in braces, depending on the type of braces.
    /// - Parameter type: The type of braces to place around the original log.
    /// - Returns: A modified log item which contains and holds the original log item in memory.
    /// - Note: For example:
    /// ```
    /// let formatItem = Text("Hello World")
    ///     .inBraces(.square)
    ///
    /// // produces
    /// "[Hello World]"
    /// ```
    func inBraces(_ type: LogFormat.BraceType) -> LogFormat.ModifiedItem<Self> {
        switch type {
        case .round: return .init(original: self) { "(\($0))" }
        case .curly: return .init(original: self) { "{\($0)}" }
        case .square: return .init(original: self) { "[\($0)]" }
        case .angle: return .init(original: self) { "<\($0)>" }
        }
    }
    
}
