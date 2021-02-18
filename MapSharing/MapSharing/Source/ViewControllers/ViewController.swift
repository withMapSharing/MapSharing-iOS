//
//  ViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func fontTestButtonClicked(_ sender: Any) {
        let fontTestViewController = FontTestViewController()
        self.present(fontTestViewController, animated: true, completion: nil)
    }
}

