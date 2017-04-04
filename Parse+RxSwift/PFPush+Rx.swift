//
//  PFPush+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base : PFPush {
    public func sendPush() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.sendInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func sendPushMessageToChannel(_ channel: String, withMessage: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFPush.sendMessageToChannel(inBackground: channel, withMessage: withMessage, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func sendPushMessageToQuery(_ query: PFQuery<PFInstallation>, withMessage: String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFPush.sendMessageToQuery(inBackground: query,
                                    withMessage: withMessage,
                                    block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func sendPushDataToChannel(_ channel: String, withData: Dictionary<NSObject, AnyObject>) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFPush.sendDataToChannel(inBackground: channel, withData: withData,
                                   block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func sendPushDataToQuery(_ query: PFQuery<PFInstallation>, withData: Dictionary<NSObject, AnyObject>) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFPush.sendDataToQuery(inBackground: query,
                                 withData: withData,
                                 block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func subscribeToChannel(_ channel: String) -> Observable<Bool> {
        return createWithParseCallback { observer in
            PFPush.subscribeToChannel(inBackground: channel, block: ParseRxCallbacks.rx_parseCallback(observer))
        }
    }
    
    public static func unsubscribeFromChannel(_ channel: String) -> Observable<Bool> {
        return createWithParseCallback { observer in
            PFPush.unsubscribeFromChannel(inBackground: channel, block: ParseRxCallbacks.rx_parseCallback(observer))
        }
    }
    
    public static func getSubscribedChannels() -> Observable<Set<AnyHashable>> {
        return createWithParseCallback { observer in
            PFPush.getSubscribedChannelsInBackground(ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        }
    }
}
