//
//  ProfileViewController.swift
//  Recipe book
//
//  Created by Shivam Kumar on 06/10/24.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        profileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileView)
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        profileView.tableView.rowHeight = UITableView.automaticDimension
    }
    
    
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        return cell
    }
    
    
}
