//
//  ViewController.swift
//  ios-hands-on2
//
//  Created by junya.kawai on 2020/01/22.
//  Copyright © 2020 nextbeat. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class ViewController: UIViewController {

    private var addresses: AddressModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Start")

        print(Repository.get())

        Repository.getAddress(zipCode: "2790031")
            .subscribe(
                onNext: { response in
                    print(response)
                },
                onError: { error in
                    print(error)
                },
                onCompleted: {
                    print("complete")
                }
          )
    }
}

