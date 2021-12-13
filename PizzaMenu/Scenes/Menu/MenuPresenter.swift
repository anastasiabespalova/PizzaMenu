//
//  MenuPresenter.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 11.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MenuPresentationLogic
{
    func presentDisplayedItems(response: Menu.FetchItems.Response)
}

class MenuPresenter: MenuPresentationLogic
{
    weak var viewController: MenuDisplayLogic?
    
    
    func presentDisplayedItems(response: Menu.FetchItems.Response)
    {
        var viewModel = Menu.FetchItems.ViewModel(displayedItems: response.displayedItems)
        viewModel.displayedItems = sortItems(displayedItems: viewModel.displayedItems)
        viewController?.updateTable(viewModel: viewModel)
        
    }
    
    func sortItems(displayedItems: [DisplayedItem]) -> [DisplayedItem] {
        var sortedItems: [DisplayedItem] = []
        for category in Categories.allCases {
            let categoryItems = displayedItems.filter( {$0.category == category} )
            sortedItems.append(contentsOf: categoryItems)
        }
        return sortedItems
        
    }
}
