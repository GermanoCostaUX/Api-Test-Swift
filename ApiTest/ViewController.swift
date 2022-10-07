//
//  ViewController.swift
//  ApiTest
//
//  Created by user on 07/10/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        
    }
    private func makeRequest() {
        guard let url = URL(string: "http://localhost:9000/people.json") else {
                print(">>> A URL passada como parâmetro é inválida <<<")
                return
        }
        print(">>> Sucess, the informed URL is a valid URL <<<")
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared
            .dataTask(with: urlRequest) { data, _, error in
                if error != nil {
                    print(">>> Requisition returned an error")
                    return
                }
                guard let newData = data else {
                    print(">>> Error, empty data returned <<<")
                    return
                }
                if let response = try? JSONDecoder().decode(Response.self, from: data!) {
                    DispatchQueue.main.async {
                        self.nameLabel.text = response.people.name
                        self.numberLabel.text = response.people.number
                    }
                } else {
                    print("Failed decoded")
                }
            }
            .resume()
    }
}

