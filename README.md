# escola-db
Base de dados feita para o projeto final da disciplina SCC0240 – Bases de Dados

## Build
Para buidar o a base faça:

```
Git clone https://github.com/Helio0408/bd-escola.git

cd bd-escola/src
cp *.sql /tmp/
cd /tmp

sudo -u postgres createdb sistema_escolar
sudo -u postgres psql -d sistema_escolar -f basededados.sql
```
Com isso voce criou a base de dados e iniciou os dados

## Consultas
Depois de fazer o buid, faca:
```
sudo -u postgres psql -d sistema_escolar -f consultas.sql
```
E o resultado de todas as consultas será printado

## Teste indices
Para testar os indices, rode:
```
sudo -u postgres psql -d sistema_escolar -f indices.sql
```
E será printado resultado com e sem o indice
