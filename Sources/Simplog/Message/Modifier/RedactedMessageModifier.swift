//
//  File.swift
//  
//
//  Created by Niklas Holloh on 10.06.21.
//

import Foundation
import CryptoKit

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
    
    /// Redacts given `content` by replacing it with the last 16 characters of a hex-encoded `SHA256` for RELEASE configuration builds.
    /// - Parameters:
    ///   - content: The content to be replaced.
    ///   - character: The character replacing the content.
    /// - Returns: An instance of `LogMessageModifier`, containing the modified content.
    static func redactedHashed(_ content: String) -> LogMessageModifier {
        #if REDACT
        let digest = SHA256.hash(data: content.data(using: .utf8) ?? .init())
        let hexString = digest.map { String(format: "%02x", $0) }.joined().suffix(16)
        return LogMessageModifier(modifiedContent: hexString)
        #else
        return LogMessageModifier(modifiedContent: content)
        #endif
    }

}
