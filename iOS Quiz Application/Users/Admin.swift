public class Admin:User{
    
    private let adminId:Int

    
    public init(name:String,password:String,mailId:String,phoneNumber:String){
        self.adminId=(DataManager.getAdmin()).count+1
        super.init(name: name, password: password, mailId: mailId, phoneNumber: phoneNumber, userType: .admin)
    }
    
    public func getAdminId()->Int{
        return self.adminId
    }
    
    public func addAdmin(admin :Admin){
        DataManager.addAdmin(admin: admin)
    }
    
    public static func mainAdminValidation(username:String,password:String)->Bool{
        for admin in DataManager.getAdmin(){
            if admin.getUserName()==username && admin.checkPassword(password: password){
                return true
            }
        }
        return false
    }
    
}
