pipeline {
    agent any

    stages {
        stage ('creating vm') {
            steps {
                echo 'Trying to setup VM.....'
                
                // Change to the project dir
                dir('/Users/imaki/vagrant-projects/rails_pro') {
                    sh 'berks install'
                    
                    // Start freestyle job that create VM using vagrant plugin
                    build 'work_env'
                }    
            }
        }
        stage ('Build') {
            steps {
                echo 'Building....'
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
