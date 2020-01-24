//
//  ViewController.swift
//  ios-hands-on2
//
//  Created by junya.kawai on 2020/01/22.
//  Copyright © 2020 nextbeat. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    private var addresses: AddressModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Start")
        getAddress(zipCode: "2790031")
    }

    private func getAddress(zipCode: String) {
        let baseUrl = "http://zipcloud.ibsnet.co.jp/api/"
        let searchUrl = "\(baseUrl)search"
        let parameters: [String: Any] = ["zipcode": zipCode]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(searchUrl, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: headers).responseJSON { response in
            guard let data = response.data else {
                return
            }
            do {
                self.addresses = try JSONDecoder().decode(AddressModel.self, from: data)
                print(self.addresses)
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
    

}

