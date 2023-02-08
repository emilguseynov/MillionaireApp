//
//  SceneDelegate.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 05.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let coordinator = GameCoordinator()
        let navController = UINavigationController()
        
        coordinator.navigationController = navController
        coordinator.dataFetch = Service()
        
        coordinator.start()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
    }
}

