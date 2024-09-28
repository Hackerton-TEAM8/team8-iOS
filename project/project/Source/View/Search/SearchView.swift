//
//  SearchView.swift
//  project
//
//  Created by 최지우 on 9/27/24.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    @FocusState var textisForcused: Bool
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("검색")
                        .font(.title)
                        .padding(.top, 18)
                    Spacer()
                }
                HStack {
                    TextField("검색어를 입력해주세요", text: $text)
                        .focused($textisForcused)
                        .font(.body3)
                    Spacer()
                    NavigationLink(destination: SearchDetailView()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.basicBlack)
                    }
                }
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 85)
                        .stroke(Color.black, lineWidth: 0.3)
                )
                HStack {
                    Text("최근검색어")
                        .font(.subtitle4)
                        .foregroundStyle(Color.text4GrayDate)
                        .padding(.top, 15)
                    Spacer()
                }
                Spacer()
            }
            .padding(20)
        }
    }
}

#Preview {
    SearchView()
}
