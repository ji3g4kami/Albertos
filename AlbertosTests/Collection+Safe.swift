//
//  Collection+Safe.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

extension Collection {
  // Returns the element at the given index if it is within range. otherwose nil.
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
