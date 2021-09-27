//
//  SwiftExtension.swift
//  Reference UI Gallery
//
//  Created by Jeroen Meijer on 27/09/2021.
//

import Foundation

extension String {
  var localized: String {
        NSLocalizedString(self, comment: " ")
    }
}
