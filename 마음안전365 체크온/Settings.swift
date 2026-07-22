import WebKit

struct Cookie {
    var name: String
    var value: String
}

let gcmMessageIDKey = "00000000000" // update this with actual ID if using Firebase 

// URL for first launch
let rootUrl = URL(string: "https://checkon.mindsafe365.co.kr")!

// allowed origin is for what we are sticking to pwa domain
// This should also appear in Info.plist
let allowedOrigins: [String] = ["checkon.mindsafe365.co.kr"]

// auth origins will open in modal and show toolbar for back into the main origin.
// These should also appear in Info.plist
// 소셜 로그인(카카오·네이버·구글·Apple) OAuth 흐름이 메인 웹뷰 안에서 완결되도록 허용
// (비어 있으면 OAuth 이동이 차단/외부 Safari로 튕겨 로그인 후 앱으로 못 돌아옴 — 심사 반려 2.1(a) 원인)
let authOrigins: [String] = ["kakao.com", "naver.com", "google.com", "apple.com"]
// allowedOrigins + authOrigins <= 10

let platformCookie = Cookie(name: "app-platform", value: "iOS App Store")

// UI options
let displayMode = "standalone" // standalone / fullscreen.
let adaptiveUIStyle = true     // iOS 15+ only. Change app theme on the fly to dark/light related to WebView background color.
let overrideStatusBar = false   // iOS 13-14 only. if you don't support dark/light system theme.
let statusBarTheme = "dark"    // dark / light, related to override option.
let pullToRefresh = true    // Enable/disable pull down to refresh page
