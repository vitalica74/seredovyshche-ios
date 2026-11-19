import SwiftUI
import WebKit
@main struct SeredovyshcheApp: App {
    var body: some Scene { WindowGroup { WebScreen() } }
}
struct WebScreen: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .default()
        let view = WKWebView(frame: .zero, configuration: configuration)
        if #available(iOS 16.4, *) { view.isInspectable = true }
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Resources") {
            view.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return view
    }
    func updateUIView(_ view: WKWebView, context: Context) {}
}
