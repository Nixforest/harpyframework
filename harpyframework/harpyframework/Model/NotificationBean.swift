//
//  NotificationModel.swift
//  project
//
//  Created by Nixforest on 11/27/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class NotificationBean {
    /** Id */
    var id: String = ""
    /** Notify id */
    var notify_id: String = ""
    /** Notify type */
    var notify_type: String = ""
    /** Type */
    var type: String = ""
    /** Reply id */
    var reply_id: String = ""
    /** Message */
    var message: String = ""
    
    /**
     * Initializer.
     */
    init() {
    }
    
    /**
     * Constructor wit parameter
     */
    public init(id: String, notify_id: String,
                notify_type: String, type: String,
                reply_id: String, message: String) {
        self.id          = id
        self.notify_id   = notify_id
        self.notify_type = notify_type
        self.type        = type
        self.reply_id    = reply_id
        self.message     = message
    }
    
    /**
     * Get id value
     * - returns: Id value
     */
    public func getId() -> String {
        return self.id
    }
    
    /**
     * Set id value
     * - parameter id: Id value
     */
    public func setId(id: String) {
        self.id = id
    }
    
    /**
     * Get notify id value
     * - returns: Notify Id value
     */
    public func getNotifyId() -> String {
        return self.notify_id
    }
    
    /**
     * Set notify id value
     * - parameter notify_id: Notify Id value
     */
    public func setNotifyId(notify_id: String) {
        self.notify_id = notify_id
    }
    
    /**
     * Get notify type value
     * - returns: Notify type value
     */
    public func getNotifyType() -> String {
        return self.notify_type
    }
    
    /**
     * Set notify type value
     * - parameter notify_type: Notify type value
     */
    public func setNotifyType(notify_type: String) {
        self.notify_type = notify_type
    }
    
    /**
     * Get type value
     * - returns: Type value
     */
    public func getType() -> String {
        return self.type
    }
    
    /**
     * Set type value
     * - parameter type: Type value
     */
    public func setType(type: String) {
        self.type = type
    }
    
    /**
     * Get reply id value
     * - returns: Reply Id value
     */
    public func getReplyId() -> String {
        return self.reply_id
    }
    
    /**
     * Set reply id value
     * - parameter reply_id: Reply Id value
     */
    public func setReplyId(reply_id: String) {
        self.reply_id = reply_id
    }
    
    /**
     * Get message value
     * - returns: Message value
     */
    public func getMessage() -> String {
        return self.message
    }
    
    /**
     * Check if notification is exist
     * - returns: True if id of notification is not empty, False otherwise
     */
    public func checkNotificationExist() -> Bool {
        return !(self.id.isEmpty)
    }
    
    /**
     * Check if notification from uphold
     * - returns: True if type is VIEW_UPHOLD, False otherwise
     */
    public func isUpholdNotification() -> Bool {
        return (self.type == DomainConst.NOTIFY_VIEW_UPHOLD)
    }
}
