//
//  PFAnonymousUtils+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFAnonymousUtils {
    
    public static func rx_login(username: String, password: String) -> Observable<PFUser> {
        return createWithParseCallback({ observer in
            self.logInWithBlock(ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        })
    }
    
}
