//
//  Simplog.swift
//
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// An empty simplog facade which does not call any log
/// implementations.
public final class SimplogDisabled<ExtendedInfo: Codable>: SimplogLogger {
    
    public let logSynchronously: Bool = false
    public let destinations: [LogDestination] = []
    
    public func `for`(subsystem: String?, category: String?) -> Self { return self }
    
    public nonisolated func debug(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func debug(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func info(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func info(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func warning(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func warning(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func error(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func error(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func fatal(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func fatal(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
}

