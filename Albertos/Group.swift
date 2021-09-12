//
//  Group.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
  return Dictionary(grouping: menu, by: { $0.category} )
    .map { key, value in
      MenuSection(category: key, items: value)
    }
    .sorted { $0.category > $1.category }
}
