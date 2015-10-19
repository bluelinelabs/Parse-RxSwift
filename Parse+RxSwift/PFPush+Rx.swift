//
//  PFPush+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFPush {
    
    public func rx_sendPush() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendPushInBackgroundWithBlock(ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushMessageToChannel(channel: String, withMessage: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendPushMessageToChannelInBackground(channel, withMessage: withMessage, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushMessageToQuery(query: PFQuery, withMessage: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendPushMessageToQueryInBackground(query, withMessage: withMessage, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushDataToChannel(channel: String, withData: Dictionary<NSObject, AnyObject>) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendPushDataToChannelInBackground(channel, withData: withData, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_sendPushDataToQuery(query: PFQuery, withData: Dictionary<NSObject, AnyObject>) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.sendPushDataToQueryInBackground(query, withData: withData, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_subscribeToChannel(channel: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.subscribeToChannelInBackground(channel, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_unsubscribeFromChannel(channel: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.unsubscribeFromChannelInBackground(channel, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_getSubscribedChannels() -> Observable<Set<NSObject>> {
        return createWithParseCallback({ observer in
            self.getSubscribedChannelsInBackgroundWithBlock(ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        })
    }
}
