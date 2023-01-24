//
//  TabBar.swift
//  KinopoiskSearchMachine
//
//  Created by Emil Shpeklord on 24.01.2023.
//

import UIKit

class TabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemPink
        tabBar.isTranslucent = false
        setupVCs()
    }

    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

    private func setupVCs() {
        viewControllers = [
            createNavController(
                for: MainAssembly.build(),
                title: "Main",
                image: UIImage(systemName: "photo.circle") ?? UIImage()),
            createNavController(
                for: ActorSearchAssembly.build(),
                title: "Actor",
                image: UIImage(systemName: "heart.circle") ?? UIImage()),
            createNavController(
                for: GenreSearchAssembly.build(),
                title: "Actor",
                image: UIImage(systemName: "arrow") ?? UIImage())
        ]
    }
}
