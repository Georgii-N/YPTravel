import SwiftUI

struct CustomSearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.ypGray)
            TextField("Введите запрос", text: $text, onEditingChanged: { isStarted in
                self.isEditing = isStarted
            })
            .foregroundColor(.ypBlack)
            .tint(.ypBlue)
            .background(.ypLightGray)
            .font(.regularMedium)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            
            if isEditing {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.ypGray)
                }
            }
        }
        .padding(EdgeInsets(top: UIConstants.CustomSearchBar.paddingVertical,
                            leading: UIConstants.CustomSearchBar.paddingHorizontal,
                            bottom: UIConstants.CustomSearchBar.paddingVertical,
                            trailing: UIConstants.CustomSearchBar.paddingHorizontal)
        )
        
        .background(.ypLightGray)
        .frame(height: UIConstants.CustomSearchBar.height)
        .cornerRadius(UIConstants.CustomSearchBar.cornerRadius)
        .onTapGesture {
            self.isEditing = true
        }
    }
}

#Preview {
    CustomSearchBar(text: .constant(""))
}
