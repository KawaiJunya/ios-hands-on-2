//
//  Repository.swift
//  ios-hands-on2
//
//  Created by junya.kawai on 2020/01/24.
//  Copyright © 2020 nextbeat. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum ResponseError: Error {
    case none
}

class Repository {
    
    static func get() -> Int {
        return 0
    }
    
    static func getAddress(zipCode: String) -> Observable<AddressModel> {
        let parameters: [String: Any] = ["zipcode": zipCode]
        let headers:    HTTPHeaders   = ["Content-Type": "application/json"]
        
        return Observable.create { observer in
            Alamofire.request(
                PathValues.GET_ADDRESS,
                method:     .get,
                parameters: parameters,
                encoding:   URLEncoding(destination: .queryString),
                headers:    headers
            ).responseJSON { response in
                do {
                    // response.dataがnilならelse文に入り、
                    // nilでなければでdataにreesponse.dataを代入してOptionalをアンラップする
                    guard let data = response.data else {
                        throw ResponseError.none
                    }
                    //Jsonをモデルにデコード
                    let result = try JSONDecoder().decode(AddressModel.self, from: data)
                    observer.onNext(result)
                } catch let error {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
