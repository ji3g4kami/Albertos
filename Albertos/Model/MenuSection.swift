//
//  MenuSection.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

struct MenuSection {
  let category: String
  let items: [MenuItem]
}

extension MenuSection: Identifiable {
  var id: String { category }
}
