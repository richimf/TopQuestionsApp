//
//  String+Ext.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 30/1/22.
//

import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data,
                                          options:
                                            [.documentType: NSAttributedString.DocumentType.html,
                                             .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }

//    func setStyle(text: String) {
//        if let attString = text.htmlToAttributedString {
//            let textAttributes = [
//                NSAttributedString.Key.foregroundColor: UIColor.white,
//                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)
//            ] as [NSAttributedString.Key: Any]
//            attString.attributes(at: <#T##Int#>, longestEffectiveRange: <#T##NSRangePointer?#>, in: <#T##NSRange#>)
//            attString.addAttributes(textAttributes, range: NSRange(location: 0, length: attString.length))
//            self.contentText.attributedText = labelTextFormatted
//        }
//    }
}
