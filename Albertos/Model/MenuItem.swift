//
//  MenuItem.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

struct MenuItem {
  let category: String
  let name: String
}

extension MenuItem: Identifiable {
  var id: String { name }
}
