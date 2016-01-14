//
//  Observable+ParseCreate.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift

func createWithParseCallback<T>(callback: (AnyObserver<T> -> Void)) -> Observable<T> {
    return Observable.create({ (observer: AnyObserver<T>) -> Disposable in
        callback(observer)
        return NopDisposable.instance
    })
}
