//
//  ProfileController.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 11.12.2021.
//

import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
           }
           
           override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
               let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!]
               UINavigationBar.appearance().titleTextAttributes = attributes
               UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
               UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
           }
}
