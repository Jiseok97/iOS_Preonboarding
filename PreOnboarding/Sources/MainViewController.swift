//
//  MainViewController.swift
//  PreOnboarding
//
//  Created by 이지석 on 2023/03/01.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    private let firstFetchImageView = FetchImageView()
    private let secondFetchImageView = FetchImageView()
    private let thirdFetchImageView = FetchImageView()
    private let fourthFetchImageView = FetchImageView()
    private let fifthFetchImageView = FetchImageView()
    
    private lazy var loadAllButton = UIButton().then {
        $0.setTitle("Load All Images", for: .normal)
        $0.backgroundColor = .link
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.layer.cornerRadius = CGFloat(5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayouts()
        setupBinding()
    }
}

// MARK: - Setup helper
private extension MainViewController {
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(firstFetchImageView)
        stackView.addArrangedSubview(secondFetchImageView)
        stackView.addArrangedSubview(thirdFetchImageView)
        stackView.addArrangedSubview(fourthFetchImageView)
        stackView.addArrangedSubview(fifthFetchImageView)
        
        view.addSubview(loadAllButton)
    }
    
    func setupLayouts() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        loadAllButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(stackView.snp.bottom).offset(16)
            $0.height.equalTo(32)
        }
    }
    
    func setupBinding() {
        loadAllButton.addTarget(self, action: #selector(loadAllImageButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Custom helper
extension MainViewController {
    @objc
    func loadAllImageButtonDidTap() {
        print("DEBUG: loadAllImageButtonDidTap")
    }
}



