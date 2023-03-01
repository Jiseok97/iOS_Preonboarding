//
//  FetchImageView.swift
//  PreOnboarding
//
//  Created by 이지석 on 2023/03/01.
//

import UIKit

class FetchImageView: UIView {
    
    private let loadImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.image = UIImage(systemName: "photo")
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
    
    private let deviceHeight: CGFloat = UIScreen.main.bounds.height
    private let viewModel = FetchImageViewModel()
    private var sessionTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        setupBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FetchImageView {
    func setupView() {
        backgroundColor = .white
        
        addSubview(loadImageView)
        addSubview(progressView)
        addSubview(loadButton)
    }
    
    func setupLayout() {
        loadImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(118)
            $0.height.equalTo(deviceHeight * 0.11)
        }

        progressView.snp.makeConstraints {
            $0.leading.equalTo(loadImageView.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(3.5)
        }

        loadButton.snp.makeConstraints {
            $0.leading.equalTo(progressView.snp.trailing).offset(4)
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

extension FetchImageView {
    @objc
    func loadButtonDidTap() {
        let url = URL(string: APIConstants.IMAGE_URL)!
        
        sessionTask = viewModel.fetchImage(url) { image in
            DispatchQueue.main.async { [weak self] in
                self?.loadImageView.image = image
            }
        }
    }
}
