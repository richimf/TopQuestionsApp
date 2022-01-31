//
//  AlertUtil.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 31/1/22.
//

import UIKit

final class UIAlertHelper {
    static func showErrorAlert(context: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "Unable to load details", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        context.present(alert, animated: true, completion: nil)
    }
}
