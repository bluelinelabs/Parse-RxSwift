//
//  PFCloud+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFCloud {
    
    public static func rx_callFunction<T>(function: String, withParameters: Dictionary<NSObject, AnyObject>?) -> Observable<T?> {
        return createWithParseCallback({ observer in
            self.callFunctionInBackground(function, withParameters: withParameters, block: ParseRxCallbacks.rx_parseOptionalCallback(observer))
        })
        .map( { result in
            return result as! T?
        })
    }
    
}
