//
//  RouteView.swift
//  YPTravel
//
//  Created by Georgiy Neguritsa on 11/4/24.
//

import SwiftUI

struct RouteChoosingView: View {
    @Binding var text: String
    
    var body: some View {
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    TextField("Откуда", text: $text)
                        .padding(16)
                        .background(.ypWhite)
                        
                    TextField("Куда", text: $text)
                        .padding(16)
                        .background(.ypWhite)
                }
                .cornerRadius(20)
                .padding(16)
                
                Button {
                        
                } label: {
                    Image(.textFieldChange)
                }
                .frame(width: 36, height: 36)
                
                .background(.ypWhite)
                
                .cornerRadius(40)
                .padding(.trailing, 16)
            }
            .background(.ypBlue)
            .cornerRadius(20)
            .padding(.horizontal)

    }
}
