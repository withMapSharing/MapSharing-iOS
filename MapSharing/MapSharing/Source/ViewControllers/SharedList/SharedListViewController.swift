//
//  SharedListViewController.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/23.
//

import UIKit

class SharedListViewController: BaseViewController {
    
    @IBOutlet weak var navigationSubtitle: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var welcomeUser: UILabel!
    @IBOutlet weak var welcomeMsg: UILabel!
    @IBOutlet weak var searchArea: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        setupFont()
        setupColor()
        
        profileImg.layer.cornerRadius = profileImg.layer.frame.width/2
        searchArea.layer.cornerRadius = 22
        searchArea.layer.shadowOffset = CGSize(width: 3, height: 3)
        searchArea.layer.shadowColor = UIColor.customGreen.cgColor
        searchArea.layer.shadowOpacity = 0.6
        
        addButton.layer.cornerRadius = 14
        addButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        addButton.layer.shadowColor = UIColor.customGreen.cgColor
        addButton.layer.shadowOpacity = 0.6
    }
    
    private func setupColor() {
        welcomeUser.textColor = .customBlack
        welcomeMsg.textColor = .customGray
        searchField.textColor = .customBlack
        searchButton.tintColor = .customGreen
        self.view.backgroundColor = .customLightGray
        
        addButton.backgroundColor = .customGreen
        addButton.tintColor = .white
        addButton.setTitleColor(.white, for: .normal)
        
    }
    
    private func setupFont() {
        navigationSubtitle.font = .systemFont(ofSize: 12)
        welcomeUser.font = UIFont.Rubik(.medium, size: 22)
        welcomeMsg.font = UIFont.Rubik(.regular, size: 13)
        searchField.font = UIFont.NotoSansCJKkr(.bold, size: 14)
        addButton.titleLabel?.font = UIFont.Rubik(.bold, size: 11)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SharedListViewController {
    func setupCollectionView() {
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "SharedListCVC", bundle: nil), forCellWithReuseIdentifier: "SharedListCVC")
        
        collectionView.collectionViewLayout = createCompositionalLayout()
        
        collectionView.backgroundView = nil
        collectionView.backgroundColor = UIColor.clear
    }
    
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            // 아이템에 대한 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 10, trailing: 0)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/6))
            
            // 그룹 사이즈로 그룹 만들기
            /// count는 subitem의 개수이다
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 10, leading: 33, bottom: 10, trailing: 32)
            return section
        }
        return layout
    }
}

extension SharedListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SharedListCVC", for: indexPath) as? SharedListCVC else { return UICollectionViewCell() }
        return cell
    }
}
