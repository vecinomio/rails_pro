pipeline {
    agent none
    
    stages {
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
                            echo currentBuild.result
                        }
                        catch (exc) {
                            currentBuild.result = 'FAILURE'
                            echo currentBuild.result
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
                            echo currentBuild.result
                        }
                        catch (exc) {
                            currentBuild.result = 'UNSTABLE'
                            echo currentBuild.result
                        }
                    }
                }
        }
        stage ('Turn off cnt7 instance') {
            agent { label 'master' }
            options { skipDefaultCheckout() }
                steps {
                    echo 'Stoping instance'
                    //sh 'gcloud compute instances stop cnt7 --zone=europe-west3-c'
                }
        }
    }

}
