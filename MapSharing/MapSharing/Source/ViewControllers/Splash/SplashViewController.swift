//
//  SplashViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/18.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class SplashViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    // MARK: - Variables
    
    var userid: Int64?
    var accessToken: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let accessToken = UserDefaults.standard.string(forKey: "accessToken")
        
        if (accessToken != nil) {
            print("토큰 존재 - auto login()")
            let nicknameViewController = NicknameViewController()
            nicknameViewController.modalPresentationStyle = .overFullScreen
            self.present(nicknameViewController, animated: true, completion: nil)
        }
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
    
    // 액세스 토큰, 카카오 아이디(id: 계정고유번호), (프로필 설정)
    // 후에 닉네임까지 같이 POST 요청
    // let accessToken = oauthToken?.accessToken
    // jwt 토큰은 로컬 db에 저장 -
    
    @IBAction func kakaoLoginButtonClicked(_ sender: Any) {
        
//        let accessToken: String = UserDefaults.standard.string(forKey: "accessToken")!
        
        
        if (AuthApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 설치되어있다면
            AuthApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                  print(error)
                }
                else {
                 print("loginWithKakaoTalk() success.")
                 let nicknameViewController = NicknameViewController()
                 nicknameViewController.modalPresentationStyle = .overFullScreen
                 self.present(nicknameViewController, animated: true, completion: nil)
                }
            }
            
        } else {
            // 카카오톡이 설치되어있지 않다면
            AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
               if let error = error {
                 print(error)
               }
               else {
                print("loginWithKakaoAccount() success.")
                
                self.setInfo()
                
                if let accessToken = oauthToken?.accessToken {
                    UserDefaults.standard.set(accessToken, forKey: "accessToken")
                }

                let nicknameViewController = NicknameViewController()
                
                nicknameViewController.setData(userId: Int64(self.userid ?? -1), accessToken: self.accessToken ?? "no accessToken")
                
                nicknameViewController.modalPresentationStyle = .overFullScreen
                self.present(nicknameViewController, animated: true, completion: nil)
               }
            }
        }
    }
    
    private func setInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success")
                let user = user
                print("유저고유번호: \(user?.id)")
                
                if let userid = user?.id {
                    self.userid = userid
                }
            }
        }
    }
}
