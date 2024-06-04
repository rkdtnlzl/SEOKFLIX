//
//  TabBarViewController.swift
//  SEOKFLIX
//
//  Created by 강석호 on 6/4/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        let homeVC = MainViewController()
        let profileVC = ProfileViewController()
        let searchVC = SearchViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: nil)
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
        profileVC.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.fill"), selectedImage: nil)
        
        let controllers = [homeVC, searchVC, profileVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
        tabBar.backgroundColor = .gray
        tabBar.tintColor = .white
    }
}
