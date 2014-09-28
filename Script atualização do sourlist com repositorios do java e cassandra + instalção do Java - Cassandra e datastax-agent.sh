echo "Congiguração do source-list com Java + Cassandra"

echo "Adicionando Repositorio Java"
echo "# Java" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list
echo "Repositorio Java adicionado com sucesso"

echo "Adicionando Repositorio Cassandra - Datastax"
echo "# Cassandra" >> /etc/apt/sources.list
echo "deb http://debian.datastax.com/community stable main" >> /etc/apt/sources.list
echo "Repositorio Datastax adicionado com sucesso"

echo "Instalando o curl"
apt-get install curl
echo "Instalado com sucesso"

echo "Adicionando chave publica do Datastax (Cassandra)"
curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
echo "Chave publica da Datastax adicionada com sucesso"

echo "Adicionando Chave Publica do Java"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
echo "Chave público do Java adicionado com sucesso"

echo "Atualizando repositorios"
apt-get update
echo "Repositorios atualizados"

echo "Instalando Java"
apt-get install oracle-java7-installer
echo "Java instalado com sucesso"

echo "Instalando Cassandra"
apt-get install dsc21
echo "Cassandra instalado com sucesso"

echo "Instalando datastax-agent"
apt-get install datastax-agent
echo "datastax-agent instalado com sucesso"
