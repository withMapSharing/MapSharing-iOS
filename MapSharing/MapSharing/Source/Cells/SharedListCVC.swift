//
//  SharedListCVC.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/24.
//

import UIKit

class SharedListCVC: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var listImg: UIImageView!
    @IBOutlet weak var privateToggleLabel: UILabel!
    @IBOutlet weak var listTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        // layer
        view.layer.cornerRadius = 10
        listImg.layer.cornerRadius = 10
        
        // font
        privateToggleLabel.font = UIFont.Rubik(.regular, size: 10)
        listTitle.font = UIFont.NotoSansCJKkr(.medium, size: 13)
        
        // color
        privateToggleLabel.textColor = .customGray
    }
}
