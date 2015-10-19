//
//  PFGeoPoint+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension PFGeoPoint {
    
    public static func rx_geoPointForCurrentLocation() -> Observable<PFGeoPoint> {
        return createWithParseCallback({ observer in
            self.geoPointForCurrentLocationInBackground(ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        })
    }
    
}
