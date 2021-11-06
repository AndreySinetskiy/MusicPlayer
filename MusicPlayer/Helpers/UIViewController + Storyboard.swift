//
//  UIViewController + Storyboard.swift
//  MusicPlayer
//
//  Created by 1 on 06.11.2021.
//

import UIKit
extension UIViewController {
    
    class func LoadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name:  name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
}
