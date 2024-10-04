# TUTORIAL PARA USAR O TERRAFORM E ANSIBLE

Terraform: Cria as maquinas (AWS) de forma automatizada
Ansible: Faz alteração dentro da maquina (AWS) sem precisar ficar destruindo a maquina e subindo outra (como aconteceria com o Terraform)


### Comandos:
- terraform init
- terraform plan     ...(planeja oq será feito mas não provisioniza)
- terraform apply    ...(provisionisa a maquina na aws de acordo com o arquivo main.tf)
- terraform destroy  ...(destrói a maquina criada no AWS)

---
ansible-playbook playbook.yml -u ubuntu --private-key iac-alura.pem -i hosts.yml 
...(roda de forma playbook o arquivo .yml na maquina chamada ubuntu na AWS com a chave .pem apontado no IP definido no arquivo host.yml)


---
### Estrutura:
- main.tf

- hosts.yml 

- arquivo playbook.yml (blocos de tarefas)

---
### No arquivo main.tf:
é adicionado o: 
- provider (aws) ... 
- resource (dados da aws.. t2.micro, ami,  chave .pem, etc)

### No arquivo hosts.yml:
- (IP publico da Maquina na AWS)

### No arquivo playbook.yml
- Aponta o Host
- Blocos de Tarefas a serem executada dentro da maquina (AWS)


---
### Gerar Chave Pública ssh
- ssh-keygen       >> ./IaC-Prod  (ex. local onde vai salvar a chave)



- terraform output (para exibir o IP que foi solicitado pelo main.tf)