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

                // Create VM (when the job will finish VM will be dead!!!)
                sh 'vagrant up'
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
