//
//  Utilities.swift
//  FinalProject
//
//  Created by admin on 16/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class Utilities{
    func showAlert(title: String, message: String, vc:UIViewController)
    {
        var alert:UIAlertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
                     alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                     vc.present(alert, animated: true, completion: nil)
    }
}
