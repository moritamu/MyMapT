//
//  ContentView.swift
//  MyMapT
//
//  Created by MsMacM on 2025/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var displaySearchKey: String = "桶川市役所"
    @State var displayMapType: MapType = .standard


    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("検索したい場所を typing..."))
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()

            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: displaySearchKey, mapType: displayMapType)

                Button {
                    if displayMapType == .standard {
                        displayMapType = .satellite
                    } else if displayMapType == .satellite {
                        displayMapType = .hybrid
                    } else {
                        displayMapType = .standard
                    }
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
