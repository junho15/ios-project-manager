//
//  UIView+.swift
//  ProjectManager
//
//  Created by junho lee on 2023/01/14.
//

import UIKit

extension UIView {
    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.5
    }
}
