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
                githubNotify account: 'vecinomio', context: 'jenkins2-test', credentialsId: 'cf908719-307d-4663-b24e-1e09f1808c12', description: 'some description from Igor', gitApiUrl: '', repo: 'rails_pro', sha: '803b7f8102ee0b03333b94830ccf36a6320c26ed', status: 'SUCCESS', targetUrl: ''
            }
        }

    }

}
