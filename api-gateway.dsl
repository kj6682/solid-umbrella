workspace {

    model {
        user_anonymous = person "Anonymous User" "A user who logs to the application as anonymous. This user is limited in content and the number of api calls before being asked to login again."
        user_simple_authentication = person "Simple User" "A user that logs to the application with her credentials (valid email). This user is limited in content."
        user_premium = person "Premium User" "This user has signed a contract and authenticates through the eDesk platform. She can access extra information to the data with no restrictions"
        
        group "Commission" {
            user_compliance = person "Compliance" "The department of compliance"
            
            system_entity_catalog = softwareSystem "Entity Catalog" "The catalog with the list of entities software system."
            system_edesk = softwareSystem "eDesk Plaform" "The transactional portal for reports and notifications."
            systme_myentities = softwareSystem "MyEntities" "The agent internal platform"
            system_microservices = softwareSystem "Micro Services" "The microservices platorm"
            
            user_anonymous -> system_entity_catalog "limited use"
            user_simple_authentication -> system_entity_catalog "Uses"
            user_premium -> user_compliance "signs the api contract"
            user_premium -> system_edesk "authenticate and manage credentials"
            user_premium -> system_entity_catalog "Uses"
            user_compliance -> systme_myentities "manages the premium user"
            
            system_entity_catalog -> system_microservices "depend on"
            system_edesk -> system_microservices "depend on"
            systme_myentities -> system_microservices "depend on"
            
        }
    }

    views {
        systemContext system_entity_catalog "SystemContext" {
            include * system_edesk user_compliance system_microservices systme_myentities
            autoLayout
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
        }
    }
    
}