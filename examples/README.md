# Examples

No exemplo _complex_ as variáveis obrigatórias database_subnets, private_subnets e public_subnets são inicializadas dentro da própria declaração do módulo, fazendo com que aja uma certa "poluição" no arquivo.

O ideal é que no corpo da declaração do módulo, as variáveis obrigatórias apontem para o arquivo _variables.tf_ este inicializado através do arquivo _terraform.tfstate_, facilitando assim o entendimento e diminuindo a complexidade do código.