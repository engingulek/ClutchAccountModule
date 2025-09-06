// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI
import ClutchModularProtocols


//MARK: ClutchAccountModule
@MainActor
public class ClutchAccountModule : @preconcurrency AccountModuleProtocol {
    public init() { }
  public func createAccountModule() -> AnyView {
        let viewController = LoginRouter.createLoginViewController()
      return AnyView(ViewControllerWrapper(viewController: viewController))
    }
    
}




struct ViewControllerWrapper: UIViewControllerRepresentable {
    let viewController: UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
       
    }
}
