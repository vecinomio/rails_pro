pipeline {
    agent { label 'cnt7' }

    stages {
        stage ('Configure test rails env') {
            steps {
                dir('ss_trainee') {
                    sh 'pwd'
                    sh 'bundle install'
                }
            }
        }
        stage ('Run rspec tests') {
            steps {
                sh 'pwd'
                sh 'cd ~/workspace/work-env-pipe/ss_trainee && bundle exec rspec -f d spec'
            }
        }
    }
}
