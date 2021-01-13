//
//  Extensions.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 12/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl {
    func setSelectedSegmentForegroundColor(_ foregroundColor: UIColor, andTintColor tintColor: UIColor) {
        if #available(iOS 13.0, *) {
            self.setTitleTextAttributes([.foregroundColor: foregroundColor], for: .selected)
            self.selectedSegmentTintColor = tintColor;
        } else {
            self.tintColor = tintColor;
        }
    }
}
