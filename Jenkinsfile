pipeline {
    agent any
    triggers {
        pollSCM '* * * * *'
    }

    stages {
        //stage ('Checkout') {
            //steps {
                //echo 'Checkout....'
                //checkout([$class: 'GitSCM', branches: [[name: '*']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: '/Users/imaki/vagrant-projects/rails_pro']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/vecinomio/rails_pro.git']]])

            //}
        //}
        stage ('creating vm') {
            steps {

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
                dir('/Users/imaki/vagrant-projects/rails_pro') {
                    sh 'vagrant provision --provision-with rspec'
                }
            }
        }
        stage ('Deploy') {
            steps {
                echo 'Deploy something'
            }
        }

    }

}
