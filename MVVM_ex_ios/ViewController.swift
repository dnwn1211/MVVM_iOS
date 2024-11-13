//
//  ViewController.swift
//  MVVM_ex_ios
//
//  Created by 김석준 on 11/13/24.
//

import UIKit

class UserViewController: UIViewController {
    private let nameLabel = UILabel()
    private let fetchButton = UIButton(type: .system)
    private let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // 뷰 모델의 클로저를 설정하여 데이터 변경 시 UI를 업데이트
        viewModel.onUserNameChanged = { [weak self] name in
            self?.nameLabel.text = name
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        nameLabel.text = "User Name"
        nameLabel.textAlignment = .center
        fetchButton.setTitle("Fetch User", for: .normal)
        fetchButton.addTarget(self, action: #selector(fetchUser), for: .touchUpInside)
        
        view.addSubview(nameLabel)
        view.addSubview(fetchButton)
        
        // Auto Layout 설정 (예시로 중앙에 배치)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fetchButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func fetchUser() {
        viewModel.fetchUser()
    }
}


