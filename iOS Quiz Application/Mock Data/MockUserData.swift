public struct MockData{
    
    //class to add or create mock student/admin objects
    
    public static func loadMockStudents(){
        
        let object1=Student(name: "Arun", password: "sai@123", mailId: "arunkumar@gmail.com", phoneNumber: "6543678923")
        DataManager.addStudent(student: object1)
        
        let object2=Student(name: "Sai Dev", password: "sai@123", mailId: "saidevanth@gmail.com", phoneNumber: "6543678923")
        DataManager.addStudent(student: object2)
        
        let object3=Student(name: "Vignesh", password: "vicky001", mailId: "vignesh001@gmail.com", phoneNumber: "9678678923")
        DataManager.addStudent(student: object3)
        
        let object4=Student(name:"Martin", password: "martin@123", mailId: "martinlazar@gmail.com", phoneNumber: "6543678923")
        DataManager.addStudent(student: object4)
    
    }
    
    
    public static func loadMockAdmin(){
        
        let object1=Admin(name: "root", password: "rootpass", mailId: "root@zohocorp.com", phoneNumber: "6543678923")
        DataManager.addAdmin(admin: object1)
        
        let object2=Admin(name: "Praveen", password: "helloworld", mailId: "praveen@zohocorp.com", phoneNumber: "6543654323")
        DataManager.addAdmin(admin: object2)
        
    }

}
