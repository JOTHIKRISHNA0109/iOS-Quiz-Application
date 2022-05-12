public enum UserType{
    case admin
    case student
}

public class User{
    private let name:String
    private var password:String
    private let mailId:String
    private let phoneNumber:String
    public let userType:UserType
    
    
    public init(name:String,password:String,mailId:String,phoneNumber:String,userType:UserType){
        self.name=name
        self.password=password
        self.mailId=mailId
        self.phoneNumber=phoneNumber
        self.userType=userType
        
    }
    
    public func getUserName()->String{
        return self.name
    }
    
    public func getPhoneNumber()->String{
        return self.phoneNumber
    }
    
    public func getMailId()->String{
        return self.mailId
    }
    
    public func checkPassword(password:String)->Bool{
        if password==self.password{
            return true
        }
        return false
    }

}


