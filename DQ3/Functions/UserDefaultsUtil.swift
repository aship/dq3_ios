//
//  UserDefaultsUtil.swift
//  DQ3
//
//  Created by aship on 2021/04/11.
//

import Foundation

class UserDefaultsUtil {
    class func saveAdventureLog(adventureLog: AdventureLog,
                                number: Int) {
        let data = try! NSKeyedArchiver.archivedData(withRootObject: adventureLog,
                                                     requiringSecureCoding: false)
        
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "ADVENTURE_LOG_\(number)")
        defaults.synchronize()
    }
    
    class func loadAdventureLog(number: Int) -> AdventureLog? {
        var adventureLog: AdventureLog?
        
        if let data = UserDefaults.standard.object(forKey: "ADVENTURE_LOG_\(number)") as? Data {
            if let object = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? AdventureLog {
                adventureLog = object
            }
        }
        
        // 冒険の書読み込みしたら、船の位置をリセット
        DataManager.resetShipPosition = true
        
        return adventureLog
    }
    
    class func deleteAdventureLog(number: Int) {
        UserDefaults.standard.removeObject(forKey: "ADVENTURE_LOG_\(number)")
    }
    
    class func saveDebugSetAdventureLogState(_ isMember: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(isMember, forKey: "IS_SET_DEBUG_ADVENTURE_LOG")
        defaults.synchronize()
    }
    
    class func loadDebugSetAdventureLogState() -> Bool {
        let defaults = UserDefaults.standard
        let isMember = defaults.bool(forKey: "IS_SET_DEBUG_ADVENTURE_LOG")
        return isMember
    }
    
    // MARK: - MemberState
    
    class func initUserDefailts() -> Void {
        UserDefaults.standard.register(defaults: ["IS_MEMBER" : true])
    }
    
    class func loadMemberState() -> Bool {
        let defaults = UserDefaults.standard
        let isMember = defaults.bool(forKey: "IS_MEMBER")
        return isMember
    }
    
    class func saveMemberState(_ isMember: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(isMember, forKey: "IS_MEMBER")
        defaults.synchronize()
    }
    
    // MARK: - Receipt
    
    class func loadExpireDate() -> Date {
        let defaults = UserDefaults.standard
        let date = defaults.object(forKey: "DATE_EXPIRE") as! Date
        return date
        // let date : AnyObject! = defaults.objectForKey("DATE_EXPIRE")
        // return date as! NSDate
    }
    
    class func saveExpireDate(_ date: Date) {
        let defaults = UserDefaults.standard
        defaults.set(date, forKey: "DATE_EXPIRE")
        defaults.synchronize()
    }
}
