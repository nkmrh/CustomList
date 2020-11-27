//
//  ContentView.swift
//  CustomList
//
//  Created by hajime-nakamura on 2020/11/27.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    @State var keyword: String = ""

    var numbers = (0 ..< 100).map { String($0) }
    var body: some View {
        NavigationView {
            List {
                ForEach(numbers, id: \.self) { keyword in
                    Button(
                        action: {
                            self.keyword = keyword
                            isActive = true
                        },
                        label: {
                            ZStack {
                                NavigationLink(
                                    destination: Text(self.keyword),
                                    isActive: $isActive,
                                    label: { EmptyView() }
                                )
                                HStack {
                                    Text(keyword)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.leading, 20)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                        .padding(.trailing, 20)
                                }
                                .padding()
                            }
                        }
                    )
                    .listRowBackground(Color.blue)
                    .buttonStyle(RowButtonStyle())
                    .padding(.top, -6)
                    .padding(.bottom, -5)
                    .padding(.leading, -30)
                    .padding(.trailing, -40)
                }
            }
            .navigationTitle("List Highlight")
        }
    }

    private struct RowButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration
                .label
                .contentShape(Rectangle())
                .background(configuration.isPressed ? Color.white.opacity(0.5) : nil)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
