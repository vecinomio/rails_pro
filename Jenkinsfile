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
                sh 'vagrant up --provision'
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
                githubNotify account: 'vecinomio', context: 'jenkins_test', credentialsId: '679eea3d-b331-4ea3-87e7-d6ac1d600d3f', description: 'test test test', gitApiUrl: '', repo: 'rails_pro', sha: 'cace8646c197401b6bd43c642865e3348bf4a83e', status: 'SUCCESS', targetUrl: ''
            }
        }

    }

}
