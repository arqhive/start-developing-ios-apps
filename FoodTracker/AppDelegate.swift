// AppDelegate.swift 애는 기본 2가지 기능이 있다.
// 1. AppDelegate 클래스를 정의한다. app delegate는 앱의 내용이 그려지고 앱 내에서 상태 변화에 반응 할 수 있는 장소를 제공하는 윈도우를 생성한다.
// 2. 앱에 대한 엔트리 포인트와 입력 이벤트를 앱에 전달하는 실행 루프를 만든다. 상단 @UIApplicationMain 어트리뷰트로 수행된다.

// UIApplicationMain 속성을 사용한다는 것은 UIApplicationMain 함수를 호출하고 AppDelegate 클래스 이름을 delegate 클래스 이름으로 전달하는 것과 같은 의미다.
// 시스템은 이에 대한 응답으로 응용프로그램객체를 만든다. 응용프로그램 객체는 앱의 라이프사이클을 관리한다.
// 시스템은 또한 AppDelgate클래스의 인스턴스를 만들어 응용프로그램객체에 할당한다. 마지막으로 시스템이 앱을 시작한다.

// 매우 이례적인 일을 하지 않는 한 XCode에서 제공하는 AppDelegate클래스를 사용하여 앱을 초기화하고 앱 수준의 이벤트에 응답해야 한다.
// AppDelegate는 UIApplicationDelegate 프로토콜을 채택한다.
// 해당 프로토콜은 앱을 설정하고 앱의 상태 변경에 응답하고 다른 앱 수준 이벤트를 처리하는 데 사용하는 여러가지 방법을 정의한다.
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // 앱 윈도우에 대한 레퍼런스를 저장한다. 해당 윈도우는 앱의 뷰 계층 구조의 root를 나타낸다.
    // 모든 앱 컨텐츠가 그려지는 곳이다.
    // 해당 속성은 선택 사항이므로 어떤 시점에서는 값이 nil 일 수도 있다.
    // var window: UIWindow? // SceneDelegate.swift로 이동


    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // 이러한 메서드를 통해 응용프로그램객체가 애플리케이션 델리게이트와 통신 할 수 있다.
    // 앱 상태 전환 (시작, 백/포어 그라운드 전환 및 종료) 중에 애플리케이션 객체는 해당 델리게이트 메서드를 호출하여
    // 앱이 응답 할 수 있는 기회를 제공한다. sceneDelegate로 이동
    // func applicationWillResignActive(_ application: UIApplication)
    // func applicationDidEnterBackground(_ application: UIApplication)
    // func applicationWillEnterForeground(_ application: UIApplication)
    // func applicationDidBecomeActive(_ application: UIApplication)
    // func applicationWillTerminate(_ application: UIApplication)

}

