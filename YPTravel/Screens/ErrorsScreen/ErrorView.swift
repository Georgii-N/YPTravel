import SwiftUI

enum ErrorType {
    case server
    case connection
}

struct ErrorView: View {
    var errorType: ErrorType
    
    var body: some View {
        VStack {
            Image(errorType == .connection ? .connectionError : .serverError)
                .resizable()
                .frame(width: UIConstants.ErrorView.sideImage,
                       height: UIConstants.ErrorView.sideImage)
                .cornerRadius(UIConstants.ErrorView.cornerRadius)
            
            Text(errorType == .connection ?
                 "Нет интернета" : "Ошибка Сервера")
            .font(.boldMedium)
            .foregroundStyle(.ypBlack)
        }
    }
}

#Preview {
    ErrorView(errorType: .server)
}
