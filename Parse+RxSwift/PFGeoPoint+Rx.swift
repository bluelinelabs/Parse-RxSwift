//
//  PFGeoPoint+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base : PFGeoPoint {
    public static func geoPointForCurrentLocation() -> Observable<PFGeoPoint> {
        return createWithParseCallback({ observer in
            PFGeoPoint.geoPointForCurrentLocation(inBackground: ParseRxCallbacks.rx_parseUnwrappedOptionalCallback(observer))
        })
    }
}
