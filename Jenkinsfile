pipeline {
    agent {
        label 'cnt7'
    }

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
        stage ('Build') {
            steps {
                echo 'Building....'
            }
        }
        stage ('Tests') {
            steps {
                echo 'Trying some tests'
                //sh 'vagrant provision --provision-with rspec' // Used with vagrant VM on local machine
                sh 'cd /home/makienko_ig/workspace/work-env-pipe/ss_trainee && bundle exec rspec -f d spec' //Used with cloud instance
            }
        }
        stage ('Deploy') {
            steps {
                echo 'Deploy something'
            }
        }

    }

}
