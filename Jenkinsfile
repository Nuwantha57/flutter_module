pipeline {
    agent any
    
    environment {
        FLUTTER_HOME = '/opt/flutter'
        ANDROID_HOME = '/opt/android-sdk'
        PATH = "${FLUTTER_HOME}/bin:${ANDROID_HOME}/platform-tools:${env.PATH}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Flutter Doctor') {
            steps {
                sh 'flutter --version'
                sh 'flutter doctor -v'
            }
        }
        
        stage('Get Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }
        
        stage('Build AAR') {
            steps {
                sh 'flutter build aar --release'
            }
        }
        
        stage('Archive Build') {
            steps {
                archiveArtifacts artifacts: 'build/host/outputs/repo/**/*', fingerprint: true
            }
        }
    }
    
    post {
        success {
            echo 'Flutter module build completed successfully!'
        }
        failure {
            echo 'Build failed. Check console output.'
        }
    }
}
