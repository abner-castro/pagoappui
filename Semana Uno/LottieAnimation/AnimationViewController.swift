//
//  AnimationViewController.swift
//  Semana Uno
//
//  Created by Abner Castro on 13/01/23.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {
    
    var lottieAnimationView: LottieAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        lottieAnimationView = LottieAnimationView(name: "paying")
        lottieAnimationView?.loopMode = .loop
        lottieAnimationView?.animationSpeed = 0.8
        lottieAnimationView?.contentMode = .scaleAspectFit
        lottieAnimationView?.alpha = 0.0
        
        lottieAnimationView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView!)
        NSLayoutConstraint.activate([
            lottieAnimationView!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lottieAnimationView!.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        lottieAnimationView?.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.lottieAnimationView?.alpha = 1.0
        }
    }
}
