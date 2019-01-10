pipeline {
    agent any
    triggers {
        pollSCM '* * * * *'
    }

    stages {
        //stage ('Checkout') {
            //steps {
                //echo 'Checkout....'
                //checkout([$class: 'GitSCM', branches: [[name: '*']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/vecinomio/rails_pro.git']]])
            //}
        //}
        stage ('creating vm') {
            steps {

                sh 'berks install'

                // Start freestyle job that create VM using vagrant plugin
                build 'work_env'
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
                sh 'vagrant provision --provision-with rspec'
            }
        }
        stage ('Deploy') {
            steps {
                echo 'Deploy something'
            }
        }

    }

}
