pipeline
{
    agent any
    stages{
        
        stage("Execute Shell")
        {
            steps
            {
                sh 'pwd'
                
            }
        }
            stage("checkout the code from the repo")
            {
                
                steps
                {
                    git credentialsId: 'gitcredentials', url: 'https://github.com/hellotohello/springproject.git'
                }
                
                
                
            }
        }
    
    
}
                                        
