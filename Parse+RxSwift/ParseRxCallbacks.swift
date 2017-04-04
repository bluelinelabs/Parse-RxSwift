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
    static func rx_parseCallback<T>(_ observer: AnyObserver<T>) -> (T, Error?) -> Void {
        return { (object, error) -> Void in
            if error == nil {
                observer.on(.next(object))
                observer.on(.completed)
            } else {
                observer.on(.error(error!))
            }
        }
    }
    
    static func rx_parseUnwrappedOptionalCallback<T>(_ observer: AnyObserver<T>) -> (T?, Error?) -> Void {
        return { (object, error) -> Void in
            if error == nil {
                observer.on(.next(object!))
                observer.on(.completed)
            } else {
                observer.on(.error(error!))
            }
        }
    }
    
    static func rx_parseOptionalCallback<T>(_ observer: AnyObserver<T?>) -> (T?, Error?) -> Void {
        return { (object, error) -> Void in
            if error == nil {
                observer.on(.next(object))
                observer.on(.completed)
            } else {
                observer.on(.error(error!))
            }
        }
    }
}
