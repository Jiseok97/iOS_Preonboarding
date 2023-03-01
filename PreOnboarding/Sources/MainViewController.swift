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
    
    private let loadImageTableView = UITableView().then {
        $0.backgroundColor = .white
        $0.separatorStyle = .none
    }
    
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
        view.addSubview(loadImageTableView)
        view.addSubview(loadAllButton)
    }
    
    func setupLayouts() {
        let deviceHeight: CGFloat = UIScreen.main.bounds.height
        
        loadImageTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(deviceHeight * 0.6)
        }
        
        loadAllButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(loadImageTableView.snp.bottom).offset(16)
            $0.height.equalTo(32)
        }
    }
    
    func setupBinding() {
        loadAllButton.addTarget(self, action: #selector(loadAllImageButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Custom helper
private extension MainViewController {
    @objc
    func loadAllImageButtonDidTap() {
        print("DEBUG: loadAllImageButtonDidTap")
    }
}
