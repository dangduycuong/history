//
//  TerritoryViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class TerritoryViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://vi.wikipedia.org/wiki/An_D%C6%B0%C6%A1ng_V%C6%B0%C6%A1ng") else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
        })
        task.resume()
    }
    

}
