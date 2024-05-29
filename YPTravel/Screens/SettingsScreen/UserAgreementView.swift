import SwiftUI
import WebKit

struct UserAgreementView: UIViewRepresentable {
    let url: URL? = URL(string: "https://yandex.ru/legal/practicum_offer/")

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
