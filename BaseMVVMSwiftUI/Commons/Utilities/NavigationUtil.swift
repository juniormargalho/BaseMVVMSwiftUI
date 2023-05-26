//
//  NavigationUtil.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 16/05/23.
//

import SwiftUI

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication
            .shared
            .windows
            .filter { $0.isKeyWindow }
            .first?
            .rootViewController)?.popToRootViewController(animated: true)
    }
    
    static func popTo(view: AnyView) {
        let window = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
        window?.rootViewController = UIHostingController(rootView: view)
        window?.makeKeyAndVisible()
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UITabBarController {
            return findNavigationController(viewController: navigationController.selectedViewController)
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}
