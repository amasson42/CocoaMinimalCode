
import Cocoa

// Creation of the shared instance of application
_ = NSApplication.shared
NSApp.setActivationPolicy(.regular)
let appName = ProcessInfo.processInfo.processName

// Creation of a menubar and his items
let menubar = NSMenu()
let appMenuItem = NSMenuItem()
menubar.addItem(appMenuItem)
NSApp.mainMenu = menubar

let appMenu = NSMenu()
let quitTitle = "Quit " + appName
let quitMenuItem = NSMenuItem(title: quitTitle,
                              action: #selector(NSApp.stop),
                              keyEquivalent: "q")
appMenu.addItem(quitMenuItem)
appMenuItem.submenu = appMenu

// Creation of the main window
let windowRect = CGRect(x: 0, y: 0, width: 600, height: 400)
let window = NSWindow(contentRect: windowRect,
                      styleMask: [.miniaturizable, .titled, .closable, .resizable],
                      backing: .buffered,
                      defer: false)
window.cascadeTopLeft(from: CGPoint(x: 200, y: 200))
window.title = appName
window.makeKeyAndOrderFront(nil)

// Creation of the personnalised view and association to the main window
let view = MyView(frame: windowRect)
window.contentView = view

// Start the looping event to run the application
NSApp.activate(ignoringOtherApps: true)
NSApp.run()
