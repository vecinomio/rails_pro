pipeline {
    agent none

    stages {
        //stage ('Checkout') { //Used only with pipeline script, not with declarative pipeline
            //steps {
                //echo 'Checkout....'
                //checkout([$class: 'GitSCM', branches: [[name: '*']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/vecinomio/rails_pro.git']]])
            //}
        //}
        //stage ('creating vm') { // Used only on local machine, not in cloud service (AWS, GCP)
            //steps {
                //sh 'echo $USER'

                //sh 'berks install'

                // Create VM (when the job will finish VM will be dead!!!)
                //sh 'vagrant up --provision'
            //}
        //}
        stage ('Turn on cnt7 instance') {
            agent { label 'master' }
            options { skipDefaultCheckout() }
                steps {
                    echo 'Starting instance'
                    sh 'gcloud compute instances start cnt7 --zone=europe-west3-c'
                }
        }
        stage ('RSpec tests') {
            agent { label 'cnt7' }
                steps {
                    script {
                        try {
                            sh 'cd ~/workspace/work-env-pipe/ss_trainee && bundle exec rspec -f d spec' //Used with cloud instance
                            currentBuild.result = 'SUCCESS'
                        }
                        catch (exc) {
                            echo 'Testing failed!'
                            currentBuild.result = 'FAILURE'
                        }
                    }
                    //catchError {
                        //sh 'vagrant provision --provision-with rspec' // Used with vagrant VM on local machine
                        //sh 'cd ~/workspace/work-env-pipe/ss_trainee && bundle exec rspec -f d spec' //Used with cloud instance
                    //}
                    //echo currentBuild.result
                }
        }
        stage ('Rubocop tests') {
            agent { label 'cnt7' }
            options { skipDefaultCheckout() }
                steps {
                    script {
                        try {
                            sh 'cd ~/workspace/work-env-pipe/ss_trainee && bundle exec rubocop -D' //Used with cloud instance                      
                            currentBuild.result = 'SUCCESS'
                        }
                        catch (exc) {
                            echo 'Testing failed!'
                            currentBuild.result = 'UNSTABLE'
                        }
                    }
                }
        }
        stage ('Turn off cnt7 instance') {
            agent { label 'master' }
            options { skipDefaultCheckout() }
                steps {
                    echo 'Stoping instance'
                    sh 'gcloud compute instances stop cnt7 --zone=europe-west3-c'
                }
        }
    }

}
