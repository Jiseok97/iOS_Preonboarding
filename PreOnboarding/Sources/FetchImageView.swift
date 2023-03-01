//
//  FetchImageView.swift
//  PreOnboarding
//
//  Created by 이지석 on 2023/03/01.
//

import UIKit

protocol FetchImageViewDelegate: AnyObject {
    func loadButtonDidTap()
}

class FetchImageView: UIView {
    
    private let imageView = UIImageView().then {
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
        $0.layer.cornerRadius = 16
    }
    
    weak var delegate: FetchImageViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayouts()
        setupBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FetchImageView {
    func setupViews() {
        backgroundColor = .white
        
        addSubview(imageView)
        addSubview(progressView)
        addSubview(loadButton)
    }
    
    func setupLayouts() {
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.bottom.equalToSuperview().inset(12)
        }
        
        progressView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        loadButton.snp.makeConstraints {
            $0.leading.equalTo(progressView.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(64)
            $0.height.equalTo(32)
        }
    }
    
    func setupBinding() {
        loadButton.addTarget(self, action: #selector(loadButtonDidTap), for: .touchUpInside)
    }
}

extension FetchImageView {
    @objc
    func loadButtonDidTap() {
        delegate?.loadButtonDidTap()
    }
}
