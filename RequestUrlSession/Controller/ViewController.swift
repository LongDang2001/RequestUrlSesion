//
//  ViewController.swift
//  RequestUrlSession
//
//  Created by admin on 11/18/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // gọi closure data.
        DataSevice.shared.requestDataTask(completion: { data in })
    
    }


}

