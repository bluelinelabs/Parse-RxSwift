//
//  Observable+ParseCreate.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift

func createWithParseCallback<T>(callback: (ObserverOf<T> -> Void)) -> Observable<T> {
    return create({ (observer: ObserverOf<T>) -> Disposable in
        callback(observer)
        return NopDisposable.instance
    })
}
