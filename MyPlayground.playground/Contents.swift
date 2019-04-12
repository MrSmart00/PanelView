//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import PanelView

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let panel = PanelView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        panel.spacing = 2
//        panel.priceFontSize = 30
//        panel.panelWidth = 33
//        panel.symbolFontSize = 25
        panel.price = 100

        view.addSubview(panel)

        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        panel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        panel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
