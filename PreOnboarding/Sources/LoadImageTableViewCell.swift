//
//  LoadImageTableViewCell.swift
//  PreOnboarding
//
//  Created by 이지석 on 2023/03/01.
//

import UIKit

protocol LoadImageCellDelegate {
    func loadButtonDidTap()
}

class LoadImageTableViewCell: UITableViewCell {
    
    private let loadImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.image = UIImage(named: "photo")
        $0.tintColor = .link
    }
    
    private let progressView = UIProgressView().then {
        $0.progress = 0.5
        $0.tintColor = .link
        $0.layer.cornerRadius = 5
    }
    
    private lazy var loadButton = UIButton().then {
        $0.setTitle("Load", for: .normal)
        $0.backgroundColor = .link
        $0.layer.cornerRadius = 5
    }
    
    weak var delegate: LoadImageCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoadImageTableViewCell {
    func setupView() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(loadImageView)
        contentView.addSubview(progressView)
        contentView.addSubview(loadButton)
    }
    
    func setupLayout() {
        loadImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(168)
            $0.height.equalTo(84)
        }
        
        progressView.snp.makeConstraints {
            $0.leading.equalTo(loadImageView.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        loadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(64)
            $0.height.equalTo(32)
        }
    }
    
    func setupBinding() {
        loadButton.addTarget(self, action: #selector(loadButtonDidTap), for: .touchUpInside)
    }
}

extension LoadImageTableViewCell {
    @objc
    func loadButtonDidTap() {
        print("DEBUG: loadButtonDidTap")
        delegate?.loadButtonDidTap()
    }
}
