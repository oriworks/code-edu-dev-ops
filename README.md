# Comandos Docker

## Containers

### Listar todos os containers

```bash
docker container ls -a
```

### Remover todos os containers

```bash
docker container rm $(docker container ls -aq) -f
```

# Comandos do projecto

### Migrar tabelas

```bash
docker exec -it app php artisan migrate
```
