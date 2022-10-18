//
//  AddTaskView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel = AddTaskViewModel()
    
    //優先順位
    @State var stars = 2
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $viewModel.cal, label: Text("Picker")) {
                    Text("カレンダー").tag(1)
                    Text("リマインダー").tag(2)
                }
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                .pickerStyle(.segmented)
                Form {
                    
                    //                        Picker(selection: $viewModel.cal, label: Text("Picker")) {
                    //                            Text("カレンダー").tag(1)
                    //                            Text("リマインダー").tag(2)
                    //                        }
                    //                        .pickerStyle(.segmented)
                    
                    TextField("タイトル", text: $viewModel.title)
                    
                    TextField("URL", text: .constant(""))
                    
                    if viewModel.cal == 2 {
                        HStack {
                            Text("優先順位")
                            
                            Spacer()
                            
                            ForEach(0..<3) { index in
                                Button {
                                    //選択済みをもう一度タップで初期化
                                    if stars == index + 1 {
                                        stars = 0
                                    } else {
                                        stars = index + 1
                                    }
                                } label: {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(index < stars ? Color.orange : Color(.quaternaryLabel))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                 
                    
                    
                    Toggle(isOn: $viewModel.isOn) {
                        Text("終日")
                    }
                    
                    DatePicker(selection: $viewModel.date, displayedComponents: [ viewModel.isOn ? [.date] : [.date, .hourAndMinute]]) {
                        Text(viewModel.cal == 1 ? "開始" : "日付")
                    }
                    
                    if viewModel.cal == 1{
                        DatePicker(selection: $viewModel.date2, displayedComponents: [ viewModel.isOn ? [.date] : [.date, .hourAndMinute]]) {
                            Text("終了")
                        }
                    }
                    
                    //                if #available(iOS 16.0, *) {
                    //                    TextField("メモ", text: $viewModel.memo, axis: .vertical)
                    //                } else {
                    //                    // Fallback on earlier versions
                    //                }
                    
                    ZStack(alignment: .topLeading) {
                        
                        if viewModel.memo.isEmpty {
                            Text("メモ")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding([.top, .trailing], 8.0)
                        }
                        
                        TextEditor(text: $viewModel.memo)
                            .padding(.leading, -4.0)
                    }
                    
                    
                }
                
                
                .onChange(of: viewModel.date) { newValue in
                    viewModel.hoge()
                }
                .toolbar {
                    Text("追加")
                }
                .navigationTitle("1件の予定を追加")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            //            .navigationBarHidden(i)
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
