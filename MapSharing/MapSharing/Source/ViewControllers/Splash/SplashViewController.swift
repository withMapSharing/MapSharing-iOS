//
//  SplashViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/18.
//

import UIKit
import KakaoSDKAuth

class SplashViewController: UIViewController {
    
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Custom Function
    
    /// ui 셋업
    func setupUI() {
        setupFont()
        
        self.view.backgroundColor = .backgroundGray
        self.kakaoLoginButton.backgroundColor = .kakaoYellow
        self.kakaoLoginButton.setTitleColor(.kakaoBrown, for: .normal)
        self.kakaoLoginButton.layer.cornerRadius = 7
    }
    /// font 셋업
    func setupFont() {
        self.kakaoLoginButton.titleLabel?.font = UIFont.NotoSansCJKkr(.bold, size: 14)
    }
    
    // MARK: - IBActions
    
    @IBAction func kakaoLoginButtonClicked(_ sender: Any) {
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
           if let error = error {
             print(error)
           }
           else {
            print("loginWithKakaoAccount() success.")
            
            //do something
            _ = oauthToken
            
            let nicknameViewController = NicknameViewController()
            nicknameViewController.modalPresentationStyle = .overFullScreen
            self.present(nicknameViewController, animated: true, completion: nil)
           }
        }
    }
    
}
