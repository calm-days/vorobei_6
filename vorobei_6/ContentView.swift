//
//  ContentView.swift
//  vorobei_6
//
//  Created by Raman Liukevich on 15/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewType: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            let safeAreaTop = geometry.safeAreaInsets.top

            let number = 4

            ZStack {
                ForEach(0..<number) { index in
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .fill(viewType ? Color.indigo : Color.teal)
                        .frame(
                            width: viewType ? screenHeight / CGFloat(number) : (screenWidth - CGFloat(number - 1) * 5) / CGFloat(number),
                            height: viewType ? screenHeight / CGFloat(number) : (screenWidth - CGFloat(number - 1) * 5) / CGFloat(number)
                        )
                        .offset(
                            x: viewType
                            ? (screenWidth - (screenHeight / CGFloat(number))) - ((screenWidth / CGFloat(number + 1)) * CGFloat(index))
                            : screenWidth - (((screenWidth - CGFloat(number - 1) * 5) / CGFloat(number)) * CGFloat(index + 1)) - (CGFloat(index) * 5),
                            y: viewType
                            ? (screenHeight / CGFloat(number)) * CGFloat(index) + safeAreaTop
                            : screenHeight / 2
                        )
                        .animation(.snappy(duration: 0.65), value: viewType)
                }
            }
            .ignoresSafeArea()
            .onTapGesture {
                viewType.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}


