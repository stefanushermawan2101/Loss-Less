//
//  UINavigationController+Ext.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 10/04/22.
//

import UIKit

extension UINavigationController {
    
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
