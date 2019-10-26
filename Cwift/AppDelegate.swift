import Cocoa
import Antlr4

enum RuntimeError: Error {
    case FileNotFoundException
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let app = App(file: "code")
        for line in app.getCode() {
            print(line)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
}
