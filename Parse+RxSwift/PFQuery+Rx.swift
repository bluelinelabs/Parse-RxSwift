//
//  PFQuery+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFQuery {
    
    public func rx_findObjects<T: PFObject>() -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            self.findObjectsInBackgroundWithBlock(ParseRxCallbacks.rx_parseOptionalCallback(observer))
        })
        .map({ objects in
            return objects as! [T]?
        })
    }
    
    public func rx_getObject<T: PFObject>(objectId: String) -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.getObjectInBackgroundWithId(objectId, block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        })
        .map({ object in
            return object as! T?
        })
    }
    
    public func rx_getFirstObject<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.getFirstObjectInBackgroundWithBlock(ParseRxCallbacks.rx_parseOptionalCallback(observer))
        })
        .map({ object in
            return object as! T?
        })
    }
    
    public func rx_countObjects() -> Observable<Int32> {
        return createWithParseCallback({ observer in
            self.countObjectsInBackgroundWithBlock(ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
}