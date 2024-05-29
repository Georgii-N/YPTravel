import SwiftUI

struct SettingsView: View {
    @Binding var isDarkMode: Bool
    @Binding var path: [String]
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Text("Темная тема")
                    .font(.regularMedium)
                    .foregroundStyle(.ypBlack)
                    .padding(.vertical, 19)
                Spacer()
                Toggle(isOn: $isDarkMode) {}
                    .tint(.ypBlue)
            }
            HStack {
                                    Text("Пользовательское соглашение")
                    .padding(.vertical, 19)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
            .onTapGesture {
                path.append("UserAgreementView")
            }
            Spacer()
            VStack {
                Text("Приложение использует API «Яндекс.Расписания»")
                    .font(.regularSmall)
                    .foregroundStyle(.ypBlack)
                    .padding(.bottom)
                Text("Версия 1.0 (beta)")
                    .font(.regularSmall)
                    .foregroundStyle(.ypBlack)
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView(isDarkMode: .constant(true), path: .constant([]))
}
