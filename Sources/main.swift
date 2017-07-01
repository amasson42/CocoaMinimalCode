
import Cocoa

// Creation of the shared instance of application
NSApplication.shared()
NSApp.setActivationPolicy(.regular)
let appName = ProcessInfo.processInfo.processName

// Creation of a menu bar and his items

let menubar = NSMenu()
let appMenuItem = NSMenuItem()
menubar.addItem(appMenuItem)
NSApp.mainMenu = menubar

let appMenu = NSMenu()
let quitTitle = "Quit " + appName
let quitMenuItem = NSMenuItem(title: quitTitle,
                              action: #selector(NSApp.terminate),
                              keyEquivalent: "q")
appMenu.addItem(quitMenuItem)
appMenuItem.submenu = appMenu

// Creation of the main window
let windowRect = NSMakeRect(0, 0, 600, 400)
let window = NSWindow(contentRect: windowRect,
                      styleMask: [.miniaturizable, .titled, .closable],
                      backing: .buffered,
                      defer: false)
window.cascadeTopLeft(from: NSPoint(x: 200, y: 200))
window.title = appName
window.makeKeyAndOrderFront(nil)

// Creation of the personalised view and association to the main window
let view = MyView(frame: windowRect, options: nil)
window.contentView?.addSubview(view)

// Start the looping event to run the application
NSApp.activate(ignoringOtherApps: true)
NSApp.run()
