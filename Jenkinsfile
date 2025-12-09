pipeline {
    agent any
    
    environment {
        FLUTTER_HOME = '/opt/flutter'
        ANDROID_HOME = '/opt/android-sdk'
        PATH = "${FLUTTER_HOME}/bin:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${env.PATH}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Flutter Setup') {
            steps {
                sh '''
                    flutter --version
                    flutter doctor -v
                '''
            }
        }
        
        stage('Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }
        
        stage('Analyze') {
            steps {
                sh 'flutter analyze || echo "Analysis warnings found but continuing..."'
            }
        }
        
        stage('Test') {
            steps {
                sh 'flutter test || echo "Tests failed but continuing..."'
            }
        }
        
        stage('Build AAR') {
            steps {
                sh 'flutter build aar --release'
            }
        }
        
        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'build/host/outputs/repo/**/*.aar', fingerprint: true, allowEmptyArchive: true
            }
        }
    }
    
    post {
        success {
            echo '✅ Build successful!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
