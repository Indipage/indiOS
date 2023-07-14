//
//  MyViewController.swift
//  PPPCLUB-iOS
//
//  Created by 류희재 on 2023/07/03.
//

import UIKit

import SnapKit
import Then

final class MyViewController: BaseViewController {
    
    //MARK: - Properties
    
    let infoData = MyInfoModel.mockDummy()
    let accountData = MyAccountModel.mockDummy()
    
    //MARK: - UI Components
    
    let rootView = MyView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gesture()
        delegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Custom Method
    
    private func gesture() {
        lazy var savedArticletapGesture = UITapGestureRecognizer.init(target: self, action: #selector(savedArticleViewGestureHandler))
        lazy var savedBookStoretapGesture = UITapGestureRecognizer.init(target: self, action: #selector(savedBookStoreViewGestureHandler))
        
        rootView.profileView.savedArticleButton.addGestureRecognizer(savedArticletapGesture)
        rootView.profileView.savedBookStoreButton.addGestureRecognizer(savedBookStoretapGesture)
    }
    
    private func delegate() {
        rootView.infoTableView.delegate = self
        rootView.infoTableView.dataSource = self
    }
    
    //MARK: - Action Method
    
    @objc func savedArticleViewGestureHandler() {
        let savedArticleViewController = MySavedArticleViewController()
        self.navigationController?.pushViewController(savedArticleViewController, animated: true)
    }
    
    @objc func savedBookStoreViewGestureHandler() {
        let savedBookViewController = MySavedBookStoreViewController()
        self.navigationController?.pushViewController(savedBookViewController, animated: true)
    }
}

//MARK: - UITableViewDelegate

extension MyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 23
    }
}

//MARK: - UITableViewDataSource

extension MyViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyInfoTableViewCell.cellIdentifier, for: indexPath) as? MyInfoTableViewCell else { return UITableViewCell() }
            cell.configureCell(title: infoData[indexPath.row].title)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyInfoTableViewCell.cellIdentifier, for: indexPath) as? MyInfoTableViewCell else { return UITableViewCell() }
            cell.configureCell(title: accountData[indexPath.row].title)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: MySeparatorFooterView.cellIdentifier) as? MySeparatorFooterView else { return UIView() }
        return footer
    }
}
