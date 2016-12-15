//
//  PFAnonymousUtils+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse


extension Reactive where Base : PFAnonymousUtils {
    public static func rx_login(_ username: String, password: String) -> Observable<PFUser> {
        return createWithParseCallback({ observer in
            PFAnonymousUtils.logIn(block: ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        })
    }
}
