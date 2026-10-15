# Publicação Stormlord

O GitHub Actions testa o código, constrói a imagem de produção uma vez, inicia essa imagem e publica seu digest imutável. A publicação é manual e entra na fila do VPS 1, que apenas baixa a imagem aprovada e troca a versão.

## Configuração

- sistema: `stormlord-site`;
- domínio: `stormlord.dev.br`;
- porta interna: `80`;
- verificação: `/`;
- variáveis de build: nenhuma;
- ambiente de execução: `/opt/stormlord/apps/stormlord-site/env`.

## Comandos

```bash
./deploy-stormlord validar
./deploy-stormlord estado
./deploy-stormlord publicar
./deploy-stormlord retornar [versao]
```

No GitHub, escolha a branch na ação **Stormlord** e execute o trabalho. O servidor mantém apenas a versão ativa e uma anterior.
