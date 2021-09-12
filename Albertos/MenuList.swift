//
//  MenuList.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import SwiftUI

struct MenuList: View {
  let sections: [MenuSection]
    var body: some View {
      List {
        ForEach(sections) { section in
          Section(header: Text(section.category)) {
            ForEach(section.items) { item in
              Text(item.name)
            }
          }
        }
      }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
      MenuList(sections: groupMenuByCategory(menu))
    }
}
