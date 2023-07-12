//
//  SearchView.swift
//  PPPCLUB-iOS
//
//  Created by 류희재 on 2023/07/03.
//

import UIKit

import SnapKit
import Then

final class SearchView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private lazy var searchTableView = UITableView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
    
    }
    
    private func hierarchy() {

    }
    
    private func layout() {

    }
}
