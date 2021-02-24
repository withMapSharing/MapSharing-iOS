//
//  NewListViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/24.
//

import UIKit

class NewListViewController: BaseViewController {
    
    
    @IBOutlet weak var listNameView: UIView!
    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var listContentView: UIView!
    @IBOutlet weak var listContentTextView: UITextView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet var listColors: [UIButton]!
    @IBOutlet weak var privateLabel: UILabel!
    @IBOutlet weak var publicLabel: UILabel!
    @IBOutlet weak var toggleButton: UISwitch!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        listNameTextField.placeholder = ""
        listNameTextField.text = "리스트의 이름을 입력해주세요."
        
        // font
        listNameTextField.font = UIFont.NotoSansCJKkr(.medium, size: 13)
        listContentTextView.font = UIFont.NotoSansCJKkr(.medium, size: 13)
        colorLabel.font = UIFont.NotoSansCJKkr(.regular, size: 14)
        privateLabel.font = UIFont.NotoSansCJKkr(.medium, size: 12)
        publicLabel.font = UIFont.NotoSansCJKkr(.medium, size: 12)
        doneButton.titleLabel?.font = UIFont.Rubik(.bold, size: 11)
        
        // layer
        listNameView.layer.cornerRadius = 22
        listNameView.layer.shadowOffset = CGSize(width: 3, height: 3)
        listNameView.layer.shadowColor = UIColor.customGreen.cgColor
        listNameView.layer.shadowOpacity = 0.3
        
        listContentView.layer.cornerRadius = 14
        listContentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        listContentView.layer.shadowColor = UIColor.customGreen.cgColor
        listContentView.layer.shadowOpacity = 0.3
        
        doneButton.layer.cornerRadius = 14
        doneButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        doneButton.layer.shadowColor = UIColor.customGreen.cgColor
        doneButton.layer.shadowOpacity = 0.3
        
        // color
        self.view.backgroundColor = .customLightGray
        
        colorLabel.textColor = .customGray
        doneButton.backgroundColor = .customGreen
        doneButton.setTitleColor(.white, for: .normal)
        
        for i in 0..<10 {
            listColors[i].layer.cornerRadius = listColors[i].layer.frame.width/2
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
