//
//  PFQuery+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base: PFQuery<PFObject> {
    public func findObjects<T: PFObject>() -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            self.base.findObjectsInBackground(block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }).map{ $0 as! [T]? }
    }
    
    public func getObject<T: PFObject>(_ objectId: String) -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.base.getObjectInBackground(withId: objectId, block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }).map{ $0 as! T? }
    }
    
    public func getFirstObject<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.base.getFirstObjectInBackground(block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }).map{ $0 as! T? }
    }
    
    public func countObjects() -> Observable<Int32> {
        return createWithParseCallback({ observer in
            self.base.countObjectsInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
}
