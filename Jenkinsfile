pipeline
{
    agent any 
    stages{
        
        stage("Run Shell")
        {
            
            steps
            {
                
                sh 'pwd'
                sh 'ifconfig'
                
            }
            
        }
        
        stage("checkout-git")
        {
            
            steps
            {
                
        git credentialsId: 'gitcredentials', url: 'https://github.com/hellotohello/springproject.git'        
                
                
            }
            
            
            
        }
        
        
    }
    
}
