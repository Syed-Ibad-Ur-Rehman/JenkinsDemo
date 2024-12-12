

def globalagent = any
def default_client_Name = 'https://opensource-demo.orangehrmlive.com'

pipeline {
    agent any 

    parameters{
        string name: 'ClientName',
        defaultValue: default_client_Name,
        trim: true

        string name: 'TestTags',
        defaultValue: null,
        trim: true

        // booleanParam name: 'Send Email'
        // defaultValue: false
    }
    stages {
        stage('Run downstream suites') {
            steps {
                script {
            echo "JOB_BASE_NAME: ${env.JOB_BASE_NAME}"
            echo "ClientName: ${params.ClientName}"
            echo "TestTags: ${params.TestTags}"
                }}
        //     when {
        //         beforeAgent true
        //         expression {env.JOB_BASE_NAME == 'All_Suites' || env.JOB_BASE_NAME == 'All_Test'}
        //     }
        //        steps {
        //             dir('downstream') {
        //             deleteDir()
        //         }
        //             dir('downstream-aggregate') {
        //             deleteDir()
        //         }
        // }

    }
}
}
