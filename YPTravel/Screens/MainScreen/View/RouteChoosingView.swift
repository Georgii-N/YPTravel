import SwiftUI

struct RouteChoosingView: View {
    @Binding var path: [String]
    @State var toCity: String? = nil
    @State var fromCity: String? = nil
    @State private var activeField: String?
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Text(fromCity ?? "Откуда")
                    .padding()
                    .foregroundColor(fromCity == nil ? .gray : .black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.ypWhite)
                    .onTapGesture {
                        path.append("ChoosingCityView")
                    }
                
                Text(toCity ?? "Куда")
                    .padding()
                    .foregroundColor(toCity == nil ? .gray : .black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.ypWhite)
                    .onTapGesture {
                        path.append("ChoosingCityView")
                    }
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
        .onChange(of: path) { newPath in
                    if let city = newPath.last, city != "ChoosingCityView" {
                        if activeField == "fromCity" {
                            fromCity = city
                        } else if activeField == "toCity" {
                            toCity = city
                        }
                        path.removeLast()
                    }
                }
    }
}

#Preview {
    RouteChoosingView(path: .constant(["Start"]))
}
