# Vamos usar a imagem base do próprio N8N
# https://hub.docker.com/r/n8nio/n8n/tags

FROM n8nio/n8n:next

################################################################################################
# Vamos definir algumas variáveis de ambiente para configurar o N8N
# Desse modo, se você não definir essas variáveis no Stack do Docker Swarm
# o N8N vai usar esses valores por padrão
# Caso você defina essas variáveis no Stack do Docker Swarm, elas vão sobrescrever
################################################################################################

# Configura o Tamanho do Payload aceito pelo N8N (em MB)
ENV N8N_PAYLOAD_SIZE_MAX=16

# Configura o nível de log do N8N
ENV N8N_LOG_LEVEL=info

# Configura o Timezone do N8N
ENV GENERIC_TIMEZONE=America/Sao_Paulo

# para instalar o jq e o iputils, precisamos usar o usuário root
USER root

# Instala o jq e o iputils
# RUN apk add --update jq iputils

# Depois de instalar os aplicatibos, voltamos para o usuário node
# que o n8n usa por padrão para executar os processos
USER node

################################################################################################
# Encontre os Community nodes nodes aqui:
# https://www.npmjs.com/search?q=keywords%3An8n-community-node-package
################################################################################################

# Cria a pasta nodes para instalar os community nodes
RUN mkdir -p ~/.n8n/nodes

################################################################################################
# Estes são os nodes que vamos usar no Curso de N8N da Promovaweb
################################################################################################

# Instala o n8n-nodes-text-manipulation
# Documentação: https://www.npmjs.com/package/n8n-nodes-text-manipulation
RUN cd ~/.n8n/nodes && npm i n8n-nodes-text-manipulation

# Instala n8n-nodes-edit-image-plus
# Documentação: https://www.npmjs.com/package/n8n-nodes-edit-image-plus
RUN cd ~/.n8n/nodes && npm i n8n-nodes-edit-image-plus

# Instala n8n-nodes-document-generator
# Documentação: https://www.npmjs.com/package/n8n-nodes-document-generator
RUN cd ~/.n8n/nodes && npm i n8n-nodes-document-generator

# Instala o n8n-nodes-phonenumber-parser
# Documentação: https://www.npmjs.com/package/@splainez/n8n-nodes-phonenumber-parser
RUN cd ~/.n8n/nodes && npm i @splainez/n8n-nodes-phonenumber-parser

# Instala o n8n-nodes-browserless
# Documentação: https://www.npmjs.com/package/n8n-nodes-browserless
RUN cd ~/.n8n/nodes && npm i n8n-nodes-browserless

# Instala o n8n-nodes-data-validation
# Documentação: https://www.npmjs.com/package/n8n-nodes-data-validation
RUN cd ~/.n8n/nodes && npm i n8n-nodes-data-validation