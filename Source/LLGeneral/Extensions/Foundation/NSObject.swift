import Foundation
import ObjectiveC

private var kKVMap: UInt8 = 0 // 使用 UInt8 作为关联对象的键

extension NSObject {
    
    // 获取 KVMap
    var ll_KVMap: NSMutableDictionary {
        if let map = objc_getAssociatedObject(self, &kKVMap) as? NSMutableDictionary {
            return map
        } else {
            let map = NSMutableDictionary()
            objc_setAssociatedObject(self, &kKVMap, map, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return map
        }
    }
    
    // 获取方法列表
    func ll_methodList() -> String {
        let selector = NSSelectorFromString("_methodDescription")
        if self.responds(to: selector) {
            return self.perform(selector)?.takeUnretainedValue() as? String ?? ""
        }
        return ""
    }
    
    // 获取短方法列表
    func ll_shortMethodList() -> String {
        let selector = NSSelectorFromString("_shortMethodDescription")
        if self.responds(to: selector) {
            return self.perform(selector)?.takeUnretainedValue() as? String ?? ""
        }
        return ""
    }
    
    // 获取实例变量列表
    func ll_ivarList() -> String {
        let selector = NSSelectorFromString("_ivarDescription")
        if self.responds(to: selector) {
            return self.perform(selector)?.takeUnretainedValue() as? String ?? ""
        }
        return ""
    }
}
