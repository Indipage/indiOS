//
//  HomeArticleNavigationView.swift
//  PPPCLUB-iOS
//
//  Created by 신지원 on 2023/07/12.
//

import UIKit

import SnapKit
import Then

class HomeArticleNavigationView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let backButton = UIButton()
    private let storeLabel = UILabel()
    private let saveButton = UIButton()
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        target()
        
        style()
        hierarchy()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func target() {
        
        saveButton.addTarget(self, action: #selector(saveButtonTap), for: .touchUpInside)
        
    }
    
    private func style() {
        
        self.backgroundColor = .pppWhite
        
        backButton.do {
            $0.setImage(Image.arrowDown, for: .normal)
        }
        
        storeLabel.do {
            $0.text = "문학살롱 초고"
            $0.font = .pppEnSubHead1
            $0.textColor = .pppBlack
            $0.textAlignment = .center
        }
        
        saveButton.do {
            $0.setImage(Image.bookmark, for: .normal)
            $0.setImage(Image.bookmarkFill, for: .selected)
        }
    }
    
    private func hierarchy() {
        
        self.addSubviews(storeLabel,
                         backButton,
                         saveButton
        )
    }
    
    private func layout() {
        
        backButton.snp.makeConstraints {
            $0.centerY.equalTo(storeLabel.snp.centerY)
            $0.leading.equalToSuperview().inset(17)
            $0.size.equalTo(42)
        }
        storeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalTo(backButton.snp.trailing)
        }
        saveButton.snp.makeConstraints {
            $0.centerY.equalTo(storeLabel.snp.centerY)
            $0.height.equalTo(33)
            $0.width.equalTo(30)
            $0.trailing.equalToSuperview().inset(28)
        }
    }
    
    //MARK: - Action Method
    
    @objc
    func saveButtonTap() {
        saveButton.isSelected.toggle()
    }
}
