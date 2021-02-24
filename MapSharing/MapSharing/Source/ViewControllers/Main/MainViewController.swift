//
//  MainViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/20.
//

import UIKit

class MainViewController: BaseViewController, MTMapViewDelegate {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var welcomeUser: UILabel!
    @IBOutlet weak var welcomeMsg: UILabel!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchArea: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    var mapView: MTMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        mapView = MTMapView(frame: self.view.bounds)
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.backgroundView.addSubview(mapView)
        }
    }
    
    @IBAction func listButtonClicked(_ sender: Any) {
        let sharedListVC = SharedListViewController(nibName: "SharedListViewController", bundle: nil)
        self.navigationController?.pushViewController(sharedListVC, animated: true)
//        self.present(sharedListVC, animated: true, completion: nil)
    }
    
    fileprivate func setupUI() {
        setupFont()
        setupColor()
        
        profileImg.layer.cornerRadius = profileImg.layer.frame.width/2
        searchArea.layer.cornerRadius = 22
        searchArea.layer.shadowOffset = CGSize(width: 3, height: 3)
        searchArea.layer.shadowColor = UIColor.customGreen.cgColor
        searchArea.layer.shadowOpacity = 0.6
        listButton.layer.cornerRadius = 14
    }
    
    func setupColor() {
        welcomeUser.textColor = .customBlack
        welcomeMsg.textColor = .customGray
        searchField.textColor = .customBlack
        searchButton.tintColor = .customGreen
        listButton.backgroundColor = .customGreen
        listButton.tintColor = .white
        listButton.setTitleColor(.white, for: .normal)
    }
    
    func setupFont() {
        welcomeUser.font = UIFont.Rubik(.medium, size: 22)
        welcomeMsg.font = UIFont.Rubik(.regular, size: 13)
        searchField.font = UIFont.NotoSansCJKkr(.bold, size: 14)
        listButton.titleLabel?.font = UIFont.Rubik(.bold, size: 11)
    }
}
