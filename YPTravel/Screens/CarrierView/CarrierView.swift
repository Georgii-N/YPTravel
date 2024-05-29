import SwiftUI

struct CarrierView: View {
    @Binding var path: [String]
    @Binding var carrier: String?
    
    var body: some View {
        VStack {
            Image(.mockCarrier)
            Text("ОАО «РЖД»")
                .font(.boldMedium)
                .foregroundStyle(.ypBlack)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    Text("E-mail")
                        .font(.regularMedium)
                        .foregroundStyle(.ypBlack)
                    Text("i.lozgkina@yandex.ru")
                        .font(.regularSmall)
                        .foregroundStyle(.ypBlue)
                }
                .padding(.vertical, UIConstants.mediumPadding)
                VStack(alignment: .leading) {
                    Text("Телефон")
                        .font(.regularMedium)
                        .foregroundStyle(.ypBlack)
                    Text("+7 (904) 329-27-71")
                        .font(.regularSmall)
                        .foregroundStyle(.ypBlue)
                }
                .padding(.vertical, UIConstants.mediumPadding)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        Spacer()
            .navigationTitle("Информация о перевозчике")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        path.removeLast()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.ypBlack)
                    }
                }
            }
            .tint(.black)
    }
}

#Preview {
    CarrierView(path: .constant([]), carrier: .constant(""))
}
