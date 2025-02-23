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
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("検索したい場所を typing..."))
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()
            MapView(searchKey: displaySearchKey)
        }
    }
}

#Preview {
    ContentView()
}
