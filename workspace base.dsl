workspace {

    model {
        user = person "User"
        softwareSystem = softwareSystem "Software System" "technology"{
            webapp = container "web" "Web Application" {
                user -> this "Uses"
            }
            api = container "API" "description" "technology" "tag"{
                component "a"{

                }
                component "b"{

                }
                user -> this "curl"
                webapp -> this "use"
            }
            container "Database" "description" "technology" "tag"{
                api -> this "Reads from and writes to"
            }
        }
    }

    views {

        systemLandscape {
          include *
            autolayout lr  
        }
        systemContext softwareSystem {
            include *
            autolayout lr
        }

        container softwareSystem {
            include *
            autolayout lr
        }

        
        component api {
            include *
            autolayout lr
        }

        theme default
    }

}