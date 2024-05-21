//
//  ConsentForm.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 13.05.2024.
//

import Foundation
import UIKit
import SwiftUI


struct FormViewControllerRepresentable: UIViewControllerRepresentable {
  let viewController = UIViewController()

  func makeUIViewController(context: Context) -> some UIViewController {
    return viewController
  }

  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
