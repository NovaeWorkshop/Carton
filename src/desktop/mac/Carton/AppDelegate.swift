import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var win: CartonWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        NSURLProtocol.registerClass(CartonUrlProtocol)
        win = CartonWindow()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        
    }


}

