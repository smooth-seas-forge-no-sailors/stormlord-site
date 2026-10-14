# Publicação Stormlord

Este sistema executa o estágio `ci` do `Dockerfile` no GitHub Actions. A publicação é manual, usa a versão exata aprovada e entra na fila única do adaptador no VPS 1.

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
./deploy-stormlord testar
./deploy-stormlord publicar
./deploy-stormlord retornar [versao]
```

`publicar` é a alternativa manual. No fluxo normal, escolha a ação **Stormlord** no GitHub, informe a branch ou versão e execute o trabalho. O servidor mantém apenas a versão ativa e uma anterior.
