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
    @State var openDate = Date()
    
    @State var isTapped: Bool = false
    
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
                
                Button {
                    // TODO: - 통신 코드 연결
                    // TODO: 화면 종료
                } label: {
                    Text("저장하기")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .foregroundStyle(Color.basicWhite)
                        .background(Color.primaryOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
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
                
                Text(DateFormatter.customFormatter.string(from: openDate))
                    .font(.subtitle3)
                    .foregroundStyle(isTapped ? Color.basicWhite : Color.basicBlack)
                    .padding(.horizontal, 22)
                    .padding(.vertical, 8)
                    .background(isTapped ? Color.primaryOrange : Color.basicWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 999))
                    .overlay {
                        RoundedRectangle(cornerRadius: 999)
                            .strokeBorder(isTapped ? .clear : Color.text2Gray)
                    }
                    .overlay(alignment: .top) {
                        DatePicker("", selection: $openDate, displayedComponents: [.date])
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                            .colorMultiply(.clear)
                    }
                    
                
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
