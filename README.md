# fronted_pipeline

## Instalar dependecias del proyeecto Vue
```
npm install
```
### Iniciar el proyecto
```
npm run serve
```
### Descargar de Docker Hub jenkins/jenkins
```
docker pull jenkins/jenkins
```
### Crear el contenedor de Jenkins
```
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --user root jenkins/jenkins:lts 
```
### Instalar docker y git en el contenedor Docker de Jenkins
```
apt-get update && apt-get install -y docker.io
```
```
apt update && apt install -y git 
```
### Añadir Jenkins al grupo docker
```
usermod -aG docker Jenkins 
```
```
docker restart jenkins-server 
```
```
groups jenkins
```
### Compiles and minifies for production
```
pipeline {
    agent any

    environment {
        IMAGE_NAME = "vue-app"
        CONTAINER_NAME = "vue-app-container"
        VUE_PORT = "7000"
    }

    stages {
        stage('Verificar Docker') {
            steps {
                sh 'id' // Muestra el usuario y los grupos (debe incluir "docker")
                sh 'groups' // Verifica si está en el grupo docker
                sh 'docker --version' // Asegura que docker está instalado
                sh 'docker ps' // Verifica acceso al socket Docker
            }
        }

        stage('Clonar repositorio') {
            steps {
                git branch: 'main', credentialsId: 'github-creds-id', url: 'https://github.com/JordanML28/integracion312'
            }
        }

        stage('Construir imagen Docker') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Eliminar contenedor anterior (si existe)') {
            steps {
                sh "docker rm -f ${CONTAINER_NAME} || true"
            }
        }

        stage('Levantar nuevo contenedor') {
            steps {
                sh "docker run -d --name ${CONTAINER_NAME} -p ${VUE_PORT}:80 ${IMAGE_NAME}"
            }
        }
    }
}

``` 
### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
