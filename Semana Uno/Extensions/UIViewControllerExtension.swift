//
//  UIViewControllerExtension.swift
//  Semana Uno
//
//  Created by Abner Castro on 14/01/23.
//

import UIKit

extension UIViewController {
    
    func add(child viewController: UIViewController, frame: CGRect? = nil) {
        addChild(viewController)
        
        if let frame = frame {
            viewController.view.frame = frame
        }
        
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    func removeChildViewController() {
        guard let vc = children.last else { return }
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
    
}
