# Linha em branco
echo 
echo "Congiguração do source-list com Java + Cassandra"

echo "Adicionar repositorio do Java ao sourcelist e instalar?"
echo "sim/nao"
read java

if [ $java = "sim" ];then
	# Linha em branco
	echo 
	echo "Adicionando Repositorio Java"
	echo >> /etc/apt/sources.list # Linha em branco
	echo "# Java" >> /etc/apt/sources.list
	echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list
	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list
	echo "Repositorio Java adicionado com sucesso"
	
	# Linha em branco
	echo "Adicionando Chave Publica do Java"
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
	echo "Chave público do Java adicionado com sucesso"

	echo "Atualizando repositorios"
	apt-get update
	echo "Repositorios atualizados"

	echo "Instalando Java"
	apt-get install oracle-java7-installer
	echo "Java instalado com sucesso"

	# Linha em branco
	echo 
	echo "Adicionar o repositorio do cassandra - Datastax?"
	echo "sim/nao"
	read repositorioCassandra

	if [ $repositorioCassandra = "sim" ];then
		echo "Adicionando Repositorio Cassandra - Datastax"
		echo >> /etc/apt/sources.list # Linha em branco
		echo "# Cassandra" >> /etc/apt/sources.list
		echo "deb http://debian.datastax.com/community stable main" >> /etc/apt/sources.list
		echo "Repositorio Datastax adicionado com sucesso"

		# Linha em branco
		echo 
		echo "Instalando o curl"
		apt-get install curl
		echo "Instalado com sucesso"

		# Linha em branco
		echo 
		echo "Adicionando chave publica do Datastax (Cassandra)"
		curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
		echo "Chave publica da Datastax adicionada com sucesso"
		
		echo "Atualizando repositorios"
		apt-get update
		echo "Repositorios atualizados"

		# Linha em branco
		echo 
		echo "Instalar o Cassandra?"
		echo "sim/nao"
		read cassandra

		if [ $cassandra = "sim" ];then
			echo "Instalando Cassandra"
			apt-get install dsc21
			echo "Cassandra instalado com sucesso"

			# Linha em branco
			echo 	
			echo "Instalar o datastax-agent?"
			echo "sim/nao"
			read dataS
			
			if [ $dataS = "sim" ];then
				echo "Instalando datastax-agent"
				apt-get install datastax-agent
				echo "datastax-agent instalado com sucesso"
			fi

			# Linha em branco
			echo 
			echo "Instalar o OPSCenter?"
			echo "sim/nao"
			read opsC
			
			if [ $opsC = "sim" ];then
				echo "Instalando o OPSCenter para gerenciar as maquinas distribuidas do Cassandra"
				apt-get install opscenter
				echo "OPSCenter instalado com sucesso"
			fi
		fi
	fi
fi

