//
//  BuyNowViewController.swift
//  Recipe book
//
//  Created by Shivam Kumar on 14/10/24.
//

import Foundation
import UIKit

class BuyNowViewController : UIViewController {
    
    let buyView = BuyNowView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(buyView)
        
        NSLayoutConstraint.activate([
            buyView.topAnchor.constraint(equalTo: view.topAnchor),
            buyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
