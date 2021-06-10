//
//  Typeforwarding.swift
//  
//
//  Created by Niklas Holloh on 10.06.21.
//

import Foundation
import SimplogBase

// MARK: - Logger
public typealias SimplogLogger = SimplogBase.SimplogLogger
public typealias None = SimplogBase.None

// MARK: - Level
public typealias LogLevel = SimplogBase.LogLevel

// MARK: - Format
public typealias LogFormat = SimplogBase.LogFormat
public typealias LogFormatItem = SimplogBase.LogFormatItem
public typealias LogFormatBuilder = SimplogBase.LogFormatBuilder
public typealias Date = SimplogBase.Date
public typealias Empty = SimplogBase.Empty
public typealias FileLine = SimplogBase.FileLine
public typealias FileName = SimplogBase.FileName
public typealias Function = SimplogBase.Function
public typealias JSON = SimplogBase.JSON
public typealias Level = SimplogBase.Level
public typealias Message = SimplogBase.Message
public typealias Separator = SimplogBase.Separator
public typealias StackTrace = SimplogBase.StackTrace
public typealias Text = SimplogBase.Text
public typealias Thread = SimplogBase.Thread

// MARK: - Destinations
public typealias LogDestination = SimplogBase.LogDestination
public typealias ConsoleLogDestination = SimplogBase.ConsoleLogDestination

// MARK: - Conditional import of SimplogDisabled and SimplogEnabled
#if canImport(SimplogDisabled)
    import SimplogDisabled
    public typealias Logger = SimplogDisabled.Simplog
    public var Log: Logger<None> { SimplogDisabled.Log }
#elseif canImport(SimplogEnabled)
    import SimplogEnabled
    public typealias Logger = SimplogEnabled.Simplog
    public var Log: Logger<None> { SimplogEnabled.Log }
#endif

