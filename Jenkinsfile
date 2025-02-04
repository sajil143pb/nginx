pipeline {
    agent {
        label "docker"
    }
    stages {
        stage('Git checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sajil143pb/nginx.git']]])
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t docker-host:5000/playground-image:public .'
                }
            }
        }
        stage('Push image to hub') {
            steps {
                script {
                    sh 'docker login -u dock_user -p dock_password docker-host:5000'
                    sh 'docker push docker-host:5000/playground-image:public' // Corrected line
                }
            }
        }
        stage('Deploy on K8s Cluster') {
            steps {
                withKubeConfig(caCertificate: "${KUBE_CERT}", clusterName: 'kubernetes', contextName: 'kubernetes-admin@kubernetes', credentialsId: 'my-kube-config-credentials', namespace: 'default', restrictKubeConfigAccess: false, serverUrl: 'https://jump-host:6443') 
                {
                sh 'kubectl apply -f manifests.yaml'
                sh 'kubectl get all'
                }
            }
        }    
    }
}