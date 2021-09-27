//
//  ContentView.swift
//  Shared
//
//  Created by Jeroen Meijer on 27/09/2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          Text("home.header".localized)
            .padding(.top, 4)
            .padding(.bottom, 4)
          
        }
        
        Section(header: Text("home.components.header".localized)) {
          Text("CupertinewListTile")
          Text("// The rest goes here...")
        }
      }.listStyle(.insetGrouped)
        .navigationTitle("Reference UI Gallery")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
