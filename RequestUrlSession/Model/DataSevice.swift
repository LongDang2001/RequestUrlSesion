//
//  DataSevice.swift
//  RequestUrlSession
//
//  Created by admin on 11/18/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
struct DataSevice {
    static let shared = DataSevice()
    let urlString = "https://jsonplaceholder.typicode.com/albums"
    // goi closure
    func requestDataTask(completion: @escaping (DataInfo) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest ) { (data, response, error) in
            guard error == nil else {
                return
            }
            guard let dataResponse = data else {
                return
            }
            //
            guard let jsonObject = try? JSONDecoder().decode(DataInfo.self, from: dataResponse) else {
                return
            }
            // lấy dữ liệu khi request
            guard let json = jsonObject as? DataInfo else {
                return
            }
            DispatchQueue.main.async {
                completion(json) // gọi callBack
                print(json)
            }
        }
        task.resume()
    }
}
