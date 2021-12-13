//
//  SceneDelegate.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 11.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let menuViewController = MenuViewController()
        let contactsViewController = ContactsController()
        let profileViewController = ProfileController()
        let cartViewController = CartController()
        
        let menuNavigationController = createNavigationController(rootViewController: menuViewController, title: "Меню", imageSystemName: "face.smiling")
          let contactsNavigationController = createNavigationController(rootViewController: contactsViewController, title: "Контакты", imageSystemName: "location.fill")
          let accountNavigationController = createNavigationController(rootViewController: profileViewController, title: "Профиль", imageSystemName: "person.fill")
          let orderNavigationController = createNavigationController(rootViewController: cartViewController, title: "Корзина", imageSystemName: "cart.fill")

        
        let mainTabBarController = UITabBarController()
        mainTabBarController.tabBar.unselectedItemTintColor = .gray
        mainTabBarController.tabBar.tintColor = MenuConstants.brightPinkColor
        mainTabBarController.tabBar.barTintColor = .white
        mainTabBarController.viewControllers = [menuNavigationController, contactsNavigationController, accountNavigationController, orderNavigationController]
        
        window?.rootViewController = mainTabBarController
        window?.makeKeyAndVisible()
    }
    
    func createNavigationController(rootViewController: UIViewController, title: String, imageSystemName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.title  = title
        navigationController.tabBarItem.image = UIImage(systemName: imageSystemName)
        return navigationController
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

