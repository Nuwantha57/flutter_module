pipeline {
    agent any
    
    environment {
        ANDROID_HOME = '/opt/android-sdk'
        FLUTTER_HOME = '/opt/flutter'
        PATH = "${FLUTTER_HOME}/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${env.PATH}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git submodule update --init --recursive'
            }
        }
        
        stage('Flutter Setup') {
            steps {
                dir('flutter_module') {
                    sh 'flutter pub get'
                    sh 'flutter doctor'
                }
            }
        }
        
        stage('Build Android App') {
            steps {
                dir('mobile-app') {
                    sh 'chmod +x gradlew'
                    sh './gradlew clean assembleDebug'
                }
            }
        }
        
        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'mobile-app/app/build/outputs/apk/debug/*.apk', fingerprint: true
            }
        }
    }
    
    post {
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed. Check console output.'
        }
    }
}
