//
//  PFCloud+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base : PFCloud {
    public static func callFunction<T>(_ function: String, withParameters: Dictionary<NSObject, AnyObject>?) -> Observable<T?> {
        return createWithParseCallback({ observer in
            PFCloud.callFunction(inBackground: function, withParameters: withParameters, block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        }).map { $0 as! T? }
    }
}
