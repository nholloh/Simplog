//
//  File.swift
//  
//
//  Created by Niklas Holloh on 10.06.21.
//

import Foundation

public extension LogMessageModifier {
    
    /// Redacts given `content` by replacing it with `character` for RELEASE configuration builds.
    /// - Parameters:
    ///   - content: The content to be replaced.
    ///   - character: The character replacing the content.
    /// - Returns: An instance of `LogMessageModifier`, containing the modified content.
    static func redacted(_ content: String, with character: String = "*****") -> LogMessageModifier {
        #if REDACT
        return LogMessageModifier(modifiedContent: character)
        #else
        return LogMessageModifier(modifiedContent: content)
        #endif
    }
    
}
