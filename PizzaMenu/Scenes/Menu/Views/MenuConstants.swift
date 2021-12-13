//
//  MenuConstants.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 12.12.2021.
//

import UIKit

struct MenuConstants {
    
    // MARK: - Common constants
    
    static let lightPinkColor = UIColor(red: 233/255.0, green: 77/255.0, blue: 107/255.0, alpha: 0.4)
    static let brightPinkColor = UIColor(red: 233/255.0, green: 77/255.0, blue: 107/255.0, alpha: 1.0)
    
    // MARK: - Banner constants
    static let bannerCount = 4
    static let bannerCornerRadius: CGFloat = 8
    static let bannerWidthMultiplier = 0.75
    static let bannerHeightMultiplier = 0.9
    static let bannerHeight: CGFloat = 120
    
   
    // MARK: - Category constants
    static let categoryWidth: CGFloat = 100
    static let categoryHeight: CGFloat = 35
    static let categoryLabelUnselectedFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
    static let categoryLabelSelectedFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
    static let categoryCornerRadius: CGFloat = 20
    static let categoryBorderWidth: CGFloat = 1
    
    // MARK: - Item constants
    
    static let itemNameLabelFont = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
    static let itemDescriptionLabelFont = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.light)
    static let priceButtonLabelFont = UIFont.systemFont(ofSize: 12)
    
    // MARK: - Table constants
    
    static let tableRowHeight = UIScreen.main.bounds.height / 4
    
    // MARK: - Menu layout constants
    
    static let bannerHeightForOffset: CGFloat = 130
    static let categoriesHeightForOffset: CGFloat = 40
    static let headerHeight: CGFloat = 170
    static let tableViewTop: CGFloat = 135
    
    
}
