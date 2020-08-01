//
//  ConfigViewController.swift
//  AudioControllerFFMPEG
//
//  Created by Viet Hoang on 7/23/20.
//  Copyright © 2020 Viet Hoang. All rights reserved.
//

import UIKit

protocol PassQualityDelegate {
    func getQuality(quality: String)
}

class ConfigViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let quality = [ "960:540", "1280:720", "1920:1080" ]
    let name = [ "Large", "HD", "Full HD" ]
    var myQuality: String!
    var delegate: PassQualityDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func goBackToRoot(_ sender: Any) {
        self.dismiss(animated: true) {
            let x = (self.myQuality as String)
            self.delegate.getQuality(quality: x)
        }
        
    }
    
}

extension ConfigViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseQuality", for: indexPath)
        
        let lblName = "\(name[indexPath.row]) - \(quality[indexPath.row])"
        
        cell.textLabel?.text = lblName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myQuality = quality[indexPath.row]
    }
    
}
