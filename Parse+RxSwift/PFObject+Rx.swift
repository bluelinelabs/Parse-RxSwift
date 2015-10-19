//
//  PFObject+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFObject {
    
    public func rx_save() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.saveInBackgroundWithBlock(ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func rx_fetch<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.fetchInBackgroundWithBlock(ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ object in
            return object as! T?
        })
    }
    
    public func rx_fetchIfNeeded<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.fetchIfNeededInBackgroundWithBlock(ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ object in
            return object as! T?
        })
    }
    
    public func rx_delete() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.deleteInBackgroundWithBlock(ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_saveAll(objects: [PFObject]) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.saveAllInBackground(objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func rx_fetchAll<T: PFObject>(objects: [PFObject]) -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            self.fetchAllInBackground(objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ objects in
            return objects as! [T]?
        })
    }
    
    public static func rx_fetchAllIfNeeded<T: PFObject>(objects: [PFObject]) -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            self.fetchAllIfNeededInBackground(objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
        .map({ objects in
            return objects as! [T]?
        })
    }
    
}