//
//  FontTestViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/18.
//

import UIKit

class FontTestViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var rubikBold: UILabel!
    @IBOutlet weak var rubikMedium: UILabel!
    @IBOutlet weak var rubikRegular: UILabel!
    @IBOutlet weak var notoSansCJKkrBold: UILabel!
    @IBOutlet weak var notoSansCJKkrMedium: UILabel!
    @IBOutlet weak var notoSansCJKkrRegular: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFont()
    }
    
    fileprivate func setupFont() {
        rubikBold.font = UIFont.Rubik(.bold, size: 20)
        rubikMedium.font = UIFont.Rubik(.medium, size: 20)
        rubikRegular.font = UIFont.Rubik(.regular, size: 20)
        notoSansCJKkrBold.font = UIFont.NotoSansCJKkr(.bold, size: 20)
        notoSansCJKkrMedium.font = UIFont.NotoSansCJKkr(.medium, size: 20)
        notoSansCJKkrRegular.font = UIFont.NotoSansCJKkr(.regular, size: 20)
    }
}
