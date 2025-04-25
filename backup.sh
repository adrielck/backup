#!/bin/bash

iniciar_backup() {
    echo "=============================="
    echo " Iniciando backup: $(date)"
    echo "=============================="
}

# Função que faz o backup dos arquivos
executar_backup() {
    # Diretório de origem (edite conforme necessário)
    origem="/home/usuario/documentos"

    # Diretório de destino (edite conforme necessário)
    destino="/home/usuario/backup"

    # Verifica se o diretório de destino existe. Se não, cria.
    if [ ! -d "$destino" ]; then
        echo "Diretório de destino não existe. Criando..."
        mkdir -p "$destino"
    fi

    # Executa o backup usando rsync
    echo "Copiando arquivos de $origem para $destino..."
    rsync -av --delete "$origem/" "$destino/"

    # Verifica se o comando rsync foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Backup realizado com sucesso!"
    else
        echo "Erro ao realizar backup!"
    fi
}

# Função para registrar o log do backup
registrar_log() {
    logfile="/home/usuario/backup_log.txt"
    echo "$(date) - Backup realizado de $origem para $destino" >> "$logfile"
}

# Função de encerramento
finalizar_backup() {
    echo "=============================="
    echo " Backup finalizado: $(date)"
    echo "=============================="
}

# Execução do script
iniciar_backup
executar_backup
registrar_log
finalizar_backup
