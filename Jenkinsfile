pipeline {
    agent { label 'cnt7' }

    stages {
        stage ('Configure test rails env') {
            steps {
                sh 'cd ~/workspace/work-env-pipe/ss_trainee && bundle install'
            }
        }
        stage ('Run rspec tests') {
            steps {
                sh 'cd ~/workspace/work-env-pipe/ss_trainee && bundle exec rspec -f d spec'
            }
        }
    }
}
