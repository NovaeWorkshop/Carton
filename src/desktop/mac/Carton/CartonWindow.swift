import Cocoa
import WebKit

class CartonWindow : NSWindowController, WebUIDelegate {
    
    @IBOutlet weak var webview: WebView!
    var policyDelegate: CartonPolicyDelegate!
    
    convenience init() {
        self.init(windowNibName: "CartonWindow")
        policyDelegate = CartonPolicyDelegate()
        self.showWindow(nil)
    }
    
    override func windowDidLoad() {
        self.window!.makeKeyAndOrderFront(nil)
        webview.UIDelegate = self
        webview.policyDelegate = policyDelegate
        webview.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: "carton:///index.html")!))
    }
}
