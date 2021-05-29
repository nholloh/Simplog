//
//  Simplog.swift
//
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation
import SimplogBase

/// The default Simplog log instance.
public let Log = Simplog<None>()

/// An empty simplog facade which does not call any log
/// implementations.
public class Simplog<ExtendedInfo: Codable>: SimplogLogger {
    
    public var logSynchronously: Bool = false
    public var destinations: [LogDestination] = []
    
    public func debug(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func debug(
        _ msg: @autoclosure () -> String,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func info(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func info(
        _ msg: @autoclosure () -> String,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func warning(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func warning(
        _ msg: @autoclosure () -> String,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func error(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func error(
        _ msg: @autoclosure () -> String,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
    
    public func fatal(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) { }
    
    public func fatal(
        _ msg: @autoclosure () -> String,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None { }
}
