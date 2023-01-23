//
//  ViewController.swift
//  Semana Uno
//
//  Created by Abner Castro on 13/01/23.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - UI Properties Definitionss
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-bold", size: 32)
        label.textAlignment = .center
        label.text = "Mi saldo actual es:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ammountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 21)
        label.textAlignment = .center
        label.text = "$150.00 MXN"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ammountPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Retirar", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size: 16)
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Data and custom initizalition
    private let viewModel: BalanceViewModel
    
    init(viewModel: BalanceViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
        ammountLabel.text = viewModel.ammountString
        
        ammountPicker.delegate = self
        ammountPicker.dataSource = self
    }
    
    // MARK: - UIPickerView Protocols
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.ammountToPay.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.ammount(at: row)
    }
    
    
    // MARK: - Pay button operations
    @objc func payAction() {
        add(child: AnimationViewController())
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.removeChildViewController()
            let profileVC = ProfileViewController(viewModel: ProfileViewModel(isPremium: true, paidOnTime: true))
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - UI Setup
    private func buildView() {
        title = "Mis Órdenes"
        view.backgroundColor = .systemBackground
        
        payButton.addTarget(self, action: #selector(payAction), for: .touchUpInside)
        
        view.addSubview(headerLabel)
        view.addSubview(ammountLabel)
        view.addSubview(ammountPicker)
        view.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            ammountLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 24),
            ammountLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            ammountLabel.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            
            ammountPicker.topAnchor.constraint(equalTo: ammountLabel.bottomAnchor, constant: 48),
            ammountPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ammountPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            payButton.topAnchor.constraint(equalTo: ammountPicker.bottomAnchor, constant: 12),
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            payButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

