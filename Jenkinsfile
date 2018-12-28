pipeline {
    agent any

    stages {
        stage ('creating vm') {
            steps {
                echo 'Trying to setup VM.....'
                
                // Change to the project dir
                dir('/Users/imaki/vagrant-projects/testvm') {
                    
                    // Start freestyle job that create VM using vagrant plugin
                    build 'test1_up'
                }    
            }
        }
        stage ('Tests') {
            steps {
                echo 'Trying some tests'
            }    
        }
        stage ('Deploy') {
            steps {
                echo 'Deploy something'
            }    
        }

    }


}
