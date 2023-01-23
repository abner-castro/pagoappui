//
//  ProfileViewController.swift
//  Semana Uno
//
//  Created by Abner Castro on 14/01/23.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    // MARK: - UI Properties Definitionss
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 150 / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "John Appleseed 🌟"
        label.font = UIFont(name: "HelveticaNeue-bold", size: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Premium"
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        return label
    }()
    
    let fbImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "fb")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let twImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "tw")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let igImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ig")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    private func buildView() {
        title = "Mi Perfil"
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(fbImageView)
        view.addSubview(twImageView)
        view.addSubview(igImageView)
        view.addSubview(tableView)
        
        let rightButton = UIBarButtonItem(title: "Mi tarjeta", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fbImageView.heightAnchor.constraint(equalToConstant: 60),
            fbImageView.widthAnchor.constraint(equalToConstant: 60),
            fbImageView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 36),
            fbImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            
            twImageView.heightAnchor.constraint(equalToConstant: 60),
            twImageView.widthAnchor.constraint(equalToConstant: 60),
            twImageView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 36),
            twImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            igImageView.heightAnchor.constraint(equalToConstant: 60),
            igImageView.widthAnchor.constraint(equalToConstant: 60),
            igImageView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 36),
            igImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            tableView.topAnchor.constraint(equalTo: igImageView.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Mis Compras"
    }
}
