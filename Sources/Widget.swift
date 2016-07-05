//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Widget {    
    private var signals: [(UInt, Any)] = []
    var widgetPointer: UnsafeMutablePointer<GtkWidget>?
    
    public weak var parentWidget: Widget? {
        willSet {
            
        }
        didSet {
            if parentWidget != nil {
                didMoveToParent()
            } else {
                didMoveFromParent()
                removeSignals()
            }
        }
    }
    
    init() {
		widgetPointer = nil	
    }
    
    deinit {
        removeSignals()
    }
    
    private func removeSignals() {
        for (handlerId, _) in signals {
            disconnect(signal: widgetPointer, handlerId: handlerId)
        }
        
        signals = []
    }

    func didMoveToParent() {
        
    }
    
    func didMoveFromParent() {
        
    }
    
    /// Adds a signal that is not carrying any additional information.
    func add(signal name: String, callback: SignalCallbackZero) {
        let box = SignalBoxZero(callback: callback)
        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, data in
            let box = unsafeBitCast(data, to: SignalBoxZero.self)
            box.callback()
        }
        
        let handlerId = connect(signal: widgetPointer, name: name, data: unsafeAddress(of: box), handler: unsafeBitCast(handler, to: GCallback.self))
        
        signals.append((handlerId, box))
    }
    
    func add(signal name: String, callback: SignalCallbackOne) {
        let box = SignalBoxOne(callback: callback)
        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, pointer, data in
            let box = unsafeBitCast(data, to: SignalBoxOne.self)
            box.callback(pointer)
        }
        
        let handlerId = connect(signal: widgetPointer, name: name, data: unsafeAddress(of: box), handler: unsafeBitCast(handler, to: GCallback.self))
        
        signals.append((handlerId, box))
    }
    
    func add(signal name: String, callback: SignalCallbackTwo) {
        let box = SignalBoxTwo(callback: callback)
        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, pointer1, pointer2, data in
            let box = unsafeBitCast(data, to: SignalBoxTwo.self)
            box.callback(pointer1, pointer2)
        }
        
        let handlerId = connect(signal: widgetPointer, name: name, data: unsafeAddress(of: box), handler: unsafeBitCast(handler, to: GCallback.self))
        
        signals.append((handlerId, box))
    }
    
    func add(signal name: String, callback: SignalCallbackThree) {
        let box = SignalBoxThree(callback: callback)
        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, pointer1, pointer2, pointer3, data in
            let box = unsafeBitCast(data, to: SignalBoxThree.self)
            box.callback(pointer1, pointer2, pointer3)
        }
        
        let handlerId = connect(signal: widgetPointer, name: name, data: unsafeAddress(of: box), handler: unsafeBitCast(handler, to: GCallback.self))
        
        signals.append((handlerId, box))
    }
    
    func add(signal name: String, callback: SignalCallbackFour) {
        let box = SignalBoxFour(callback: callback)
        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, pointer1, pointer2, pointer3, pointer4, data in
            let box = unsafeBitCast(data, to: SignalBoxFour.self)
            box.callback(pointer1, pointer2, pointer3, pointer4)
        }
        
        let handlerId = connect(signal: widgetPointer, name: name, data: unsafeAddress(of: box), handler: unsafeBitCast(handler, to: GCallback.self))
        
        signals.append((handlerId, box))
    }
    
    func add(signal name: String, callback: SignalCallbackFive) {
        let box = SignalBoxFive(callback: callback)
        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, pointer1, pointer2, pointer3, pointer4, pointer5, data in
            let box = unsafeBitCast(data, to: SignalBoxFive.self)
            box.callback(pointer1, pointer2, pointer3, pointer4, pointer5)
        }
        
        let handlerId = connect(signal: widgetPointer, name: name, data: unsafeAddress(of: box), handler: unsafeBitCast(handler, to: GCallback.self))
        
        signals.append((handlerId, box))
    }
    
    func add(signal name: String, callback: SignalCallbackSix) {
        let box = SignalBoxSix(callback: callback)
        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, pointer1, pointer2, pointer3, pointer4, pointer5, pointer6, data in
            let box = unsafeBitCast(data, to: SignalBoxSix.self)
            box.callback(pointer1, pointer2, pointer3, pointer4, pointer5, pointer6)
        }
        
        let handlerId = connect(signal: widgetPointer, name: name, data: unsafeAddress(of: box), handler: unsafeBitCast(handler, to: GCallback.self))
        
        signals.append((handlerId, box))
    }
    
    public func showAll() {
        gtk_widget_show_all(widgetPointer)
    }
    
    public func showNow() {
        gtk_widget_show_now(widgetPointer)
    }
    
    public func show() {
        gtk_widget_show(widgetPointer)
    }
    
    public func hide() {
        gtk_widget_hide(widgetPointer)
    }
    
    public var opacity: Double {
        get {
            return gtk_widget_get_opacity(widgetPointer)
        }
        set {
            gtk_widget_set_opacity(widgetPointer, newValue)
        }
    }
}
