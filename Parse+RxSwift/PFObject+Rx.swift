//
//  PFObject+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base: PFObject {
    public func save() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.saveInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func unpin(withName name:String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.unpinInBackground(withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func fetch<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.base.fetchInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        }).map { $0 as! T? }
    }
    
    public func fetchIfNeeded<T: PFObject>() -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.base.fetchIfNeededInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        }).map{ $0 as! T? }
    }
    
    public func delete() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.deleteInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func saveAll(_ objects: [PFObject]) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFObject.saveAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func fetchAll<T: PFObject>(_ objects: [PFObject]) -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            PFObject.fetchAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        }).map{ $0 as! [T]? }
    }
    
    public static func fetchAllIfNeeded<T: PFObject>(_ objects: [PFObject]) -> Observable<[T]?> {
        return createWithParseCallback({ observer in
            PFObject.fetchAllIfNeeded(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        }).map { $0 as! [T]? }
    }
}

// MARK: Local Datastore
extension Reactive where Base:PFObject {
    public func saveEventually() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.saveEventually(ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func pin() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.pinInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func pin(withName name:String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.pinInBackground(withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func unpin() -> Observable<Bool> {
        return createWithParseCallback({ observer in
            self.base.unpinInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func pinAll(_ objects: [PFObject]) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFObject.pinAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func pinAll(_ objects: [PFObject], withName name:String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFObject.pinAll(inBackground: objects, withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func unpinAll(_ objects: [PFObject]) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFObject.unpinAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func unpinAll(_ objects: [PFObject], withName name:String) -> Observable<Bool> {
        return createWithParseCallback({ observer in
            PFObject.unpinAll(inBackground: objects, withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
}
