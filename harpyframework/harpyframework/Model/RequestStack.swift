//
//  RequestStack.swift
//  harpyframework
//
//  Created by SPJ on 8/7/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class RequestStack {
    // MARK: Properties
    /** Stack */
    private var stack: [String] = [String]()
    
    // MARK: Methods
    /**
     * Start request
     * - parameter className: Class name of request
     */
    public func startRequest(className: String) {
        if !className.isEmpty {
            stack.append(className)
            logw(text: "Start request: \(className)")
        }
    }
    
    /**
     * End request
     * - parameter className: Class name of request
     */
    public func endRequest(className: String) {
        if let idx = stack.index(of: className) {
            stack.remove(at: idx)
            logw(text: "End request: \(className)")
        }
    }
    
    /**
     * Check if request is started
     * - parameter className: Class name of request
     * - returns: True if className string does exist inside stack, False otherwise
     */
    public func isRequestStarted(className: String) -> Bool {
        if stack.index(of: className) != nil {
            return true
        }
        return false
    }
    
    /**
     * Check if need stop loading
     * - parameter className: Class name of request
     * - returns: True if className string does exist inside stack,
     *              and count of stack is 1,
     *              False otherwise
     */
    public func isStopLoading(className: String) -> Bool {
        if stack.count == 1 && isRequestStarted(className: className) {
            return true
        }
        return false
    }
}
