workspace {

    model "Reporting" "This is the first option: the technical expert configures the bucket"{

// ========= actors       
        managing_company = person "Fund Manager"
        technical_delegate = person "Technical Delegate"
      
        eDeskSystem = softwareSystem eDesk "the eDesk platform"{
          auth_admin = container "auth" "Web Application" 
          report_admin = container "report admin" "Web Application"
        } 

        s3System = softwareSystem S3 "The repository for the objects that users must upload"{
            company_bucket = container "bucket for company reports" "bucket"
            delegate_bucket = container "bucket for the delegated company" "bucket"
        }

// ========= relations

        managing_company -> technical_delegate "signs delegation contract"        
        managing_company -> technical_delegate "send credentials to delegate"  

        managing_company -> eDeskSystem "uses"
        managing_company -> auth_admin "get credentials" 
        managing_company -> report_admin "set delegation" 
        
        technical_delegate -> eDeskSystem "uses"
        technical_delegate -> report_admin "get delegation" 
        
        technical_delegate -> s3System "uses"
        technical_delegate -> company_bucket "for each customer, files the report for the company"
       // technical_delegate -> delegate_bucket "files the report for the customer company"
    
    }

    views {
        theme default
    }

}