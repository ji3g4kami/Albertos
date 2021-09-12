//
//  MenuRow.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import SwiftUI

struct MenuRow: View {
  let viewModel: ViewModel
  var body: some View {
    Text(viewModel.text)
  }
}

extension MenuRow {
  struct ViewModel {
    let text: String
    init(item: MenuItem) {
      text = item.spicy ? "\(item.name) 🌶" : item.name
    }
  }
}

