//
//  ParseRxCallbacks.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

class ParseRxCallbacks {

    static func rx_parseCallback<T>(observer: AnyObserver<T>) -> (object: T, error: NSError?) -> Void {
        return { (object: T, error: NSError?) in
            if error == nil {
                observer.on(.Next(object))
                observer.on(.Completed)
            } else {
                observer.on(.Error(error!))
            }
        }
    }
    
    static func rx_parseUnwrappedOptionalCallback<T>(observer: AnyObserver<T>) -> (object: T?, error: NSError?) -> Void {
        return { (object: T?, error: NSError?) in
            if error == nil {
                observer.on(.Next(object!))
                observer.on(.Completed)
            } else {
                observer.on(.Error(error!))
            }
        }
    }
    
    static func rx_parseOptionalCallback<T>(observer: AnyObserver<T?>) -> (object: T?, error: NSError?) -> Void {
        return { (object: T?, error: NSError?) in
            if error == nil {
                observer.on(.Next(object))
                observer.on(.Completed)
            } else {
                observer.on(.Error(error!))
            }
        }
    }

}
