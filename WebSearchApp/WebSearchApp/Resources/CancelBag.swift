//
//  CancelBag.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 02.05.2024.
//

import Combine
import Foundation


typealias CancelBag = Set<AnyCancellable>

extension CancelBag {
  mutating func cancelAll() {
    forEach { $0.cancel() }
    removeAll()
  }
}
