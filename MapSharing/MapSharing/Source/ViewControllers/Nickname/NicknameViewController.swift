//
//  NicknameViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/20.
//

import UIKit

class NicknameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        let mainViewController = MainViewController()
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = mainViewController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            mainViewController.modalPresentationStyle = .overFullScreen
            self.present(mainViewController, animated: true, completion: nil)
        }
    }
}
