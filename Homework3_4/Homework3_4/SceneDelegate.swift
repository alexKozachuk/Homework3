//
//  SceneDelegate.swift
//  Homework3_4
//
//  Created by Sasha on 21/12/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let visualEffectView = UIVisualEffectView(effect: nil)
    private let duration = 0.3

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        UIView.animate(withDuration: duration, animations: {
            self.visualEffectView.effect = nil
        }, completion: {_ in
            self.visualEffectView.removeFromSuperview()
        })
    }

    func sceneWillResignActive(_ scene: UIScene) {
        guard let window = window else { return }
        if !self.visualEffectView.isDescendant(of: window) {
            window.addSubview(self.visualEffectView)
        }
        
        self.visualEffectView.frame = window.bounds

        UIView.animate(withDuration: duration) {
            self.visualEffectView.effect = UIBlurEffect(style: .dark)
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        UIView.animate(withDuration: duration, animations: {
            self.visualEffectView.effect = nil
        }, completion: {_ in
            self.visualEffectView.removeFromSuperview()
        })
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

