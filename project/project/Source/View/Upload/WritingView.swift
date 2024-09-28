//
//  WritingView.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import SwiftUI

struct WritingView: View {
    
    @StateObject var uploadViewModel: UploadViewModel
    
    @State private var keywordText = ""
    @State var chips: [String] = []
    let placeholder: String = ""
    @State private var inputText = ""
    let useSpaces: Bool = false
    
    @State var title: String = ""
    @State var content: String = ""
    @State var openDate: Date = .init()
    

    
    var body: some View {
        ScrollView {
            VStack {
                if let image = uploadViewModel.mergedImage {
                    //                Image(uiImage: image)
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 20)
                } else {
                    ProgressView()
                }
                contentView
            }
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        VStack(spacing: 40) {
            VStack(alignment: .leading, spacing: 10) {
                Text("키워드")
                    .font(.subtitle2)
                
                HStack {
                    
                    ForEach(chips, id: \.self) { chip in
                            Chip(text: chip) { text in
                              chips.removeAll(where: { $0 == text })
                            }
                          }
                          TextField(placeholder, text: $inputText)
                            .onSubmit(of: .text) { // submit is pressed in soft keyboard
                                  chips.append(inputText)
                                  inputText = ""
                                }
                            .onChange(of: inputText) { _ in
                                  if useSpaces && inputText.hasSuffix(" ") {
                                    // add everything except the space
                                    chips.append(String(inputText[..<inputText.index(before: inputText.endIndex)]))
                                    inputText = ""
                                  }
                                }
                        }
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("제목")
                    .font(.subtitle2)
                TextField("제목을 입력하세요.", text: $title)
                    .textFieldStyle(CustomTextField())
            }
            
            VStack(alignment: .leading) {
                Text("내용")
                    .font(.subtitle2)
                TextField("내용을 입력하세요.", text: $content)
                    .textFieldStyle(CustomTextField())
            }
            
            VStack(alignment: .leading) {
                Text("공개날짜")
                    .font(.subtitle2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        

    
    var plusIcon: some View {
        Label(
            title: {
                Text("추가")
            },
            icon: {
                Image(systemName: "plus")
            }
        )
        .font(.subtitle3)
        .background(Color.secondaryYellow)
        .clipShape(RoundedRectangle(cornerRadius: 999))
    }
    
    @ViewBuilder
    func keywordIcon(name: String) -> some View {
        Text("#\(name)")
        .font(.subtitle3)
        .background(Color.secondaryYellow)
        
        
    }
}

struct WritingView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        WritingView(uploadViewModel: .init(container: container))

    }
}

struct Chip: View {
  let text: String
  let onDelete: (String) -> Void

  var body: some View {
    HStack {
      Text("#\(text)")
            .font(.subtitle3)
    }
    .padding(4)
//    .background(RoundedRectangle(cornerRadius: 10)
//      .foregroundColor(.gray.opacity(0.5)))
  }
}
