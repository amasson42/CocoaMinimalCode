
import Cocoa

NSApplication.shared()
NSApp.setActivationPolicy(.regular)

let menubar = NSMenu()
let appMenuItem = NSMenuItem()
menubar.addItem(appMenuItem)
NSApp.mainMenu = menubar

let appMenu = NSMenu()
let appName = ProcessInfo.processInfo.processName
let quitTitle = "Quit " + appName
let quitMenuItem = NSMenuItem(title: quitTitle,
                              action: #selector(NSApp.terminate),
                              keyEquivalent: "q")
appMenu.addItem(quitMenuItem)
appMenuItem.submenu = appMenu

let windowRect = NSMakeRect(0, 0, 600, 400)
let window = NSWindow(contentRect: windowRect,
                      styleMask: [.miniaturizable, .titled, .closable],
                      backing: .buffered,
                      defer: false)
window.cascadeTopLeft(from: NSPoint(x: 200, y: 200))
window.title = appName
window.makeKeyAndOrderFront(nil)

let view = MyView(frame: windowRect, options: nil)
window.contentView?.addSubview(view)

NSApp.activate(ignoringOtherApps: true)
NSApp.run()
