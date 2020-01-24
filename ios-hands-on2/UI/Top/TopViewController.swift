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

class TopViewController: UIViewController {
    private let disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getAddress()
    }
    
    func getAddress(){
        print("Start")
        
        print(Repository.get())
        
        // zipCodeを適当に変更するとErrorに分岐するはず
        Repository.getAddress(zipCode: "1500013")
            .subscribe(
                onNext: { response in
                    print(response)
                },
                onError: { error in
                    print(error)
                }
            ).disposed(by: disposeBag)
    }
}

