# truck-api
Projeto voltado para atender rotas Pré-Definidas


# Crie uma aplicação Rails com as seguintes características:
---
* Implemente endpoints que atendam as rotas definidas em rotas;
* Para as rotas de POST e PUT, efetue verificação de obrigatoriedade e formato dos dados e retorne uma resposta JSON apropriada com detalhes de falhas de preenchimento, retornando HTTP Code 422;
* Criar a modelagem de banco de dados necessária para suportar  as informações de todos os endpoints;
* Criar testes funcionais automatizados para validar o funcionamento dos serviços criados. Utilize o framework de testes de sua preferência.
## Entrega:
---
* O formato de dado trafegado deve ser JSON;
* O projeto deve conter um arquivo README explicando como o mesmo funciona e explicando como fazer para rodar a aplicação.
---
## Referências:
* Ruby on Rails: <http://rubyonrails.org/>
* HTTP Codes: <https://pt.wikipedia.org/wiki/Lista_de_c%C3%B3digos_de_estado_HTTP>
* JSON: <http://json.org/>
---
# Rotas API

### POST /api/shipments 
* #####  POST /api/shipments HTTP/1.1
* #####  Content-Type: application/json; charset="utf-8"
* ##### Location: /api/shipments/1
* ##### HTTP/1.1 201 Created
> 
```json
    {
        "shipment": {
            "value": 1500.0,
            "weight_kg": 2000,
            "contact": {
                "name": "Carlos", "phone": "(11) 98765-4321"
            },
            "vehicles": [
                { "type": "Truck", "body_type": "Baú" },
                { "type": "Truck", "body_type": "Sider" }
            ],
            "origin": { "city": "São Paulo", "state": "SP", "load_at": "2017-09-25" },
            "destination": { "city": "Goiânia", "state": "GO", "deliver_at": "2017-09-29" },
        }
```

### GET /api/shipments/1  
* #####  GET /api/shipments/1 HTTP/1.1
* #####  Content-Type: application/json; charset="utf-8"
* ##### HTTP/1.1 200 OK
> 
```json
    {
        "id": 1,
        "shipment": {
            "value": 1500.0,
            "weight_kg": 2000,
            "contact": {
                "name": "Carlos", "phone": "(11) 98765-4321"
            },
            "vehicles": [
                { "type": "Truck", "body_type": "Baú" },
                { "type": "Truck", "body_type": "Sider" }
            ],
            "origin": { "city": "São Paulo", "state": "SP", "load_at": "2017-09-25" },
            "destination": { "city": "Goiânia", "state": "GO", "deliver_at": "2017-09-29" },
        }
```

### POST /api/truckers
* #####  POST /api/truckers HTTP/1.1
* #####  Content-Type: application/json; charset="utf-8"
* ##### Location: /api/truckers/1
* ##### HTTP/1.1 201 Created
> 
```json
    {
        "trucker": {
            "name": "Lincoln Falcão",
            "phone": "(11) 97654-3210",
            "vehicle": {
                "type": "Truck", "body_type": "Baú"
            }
        }
```










### PUT /api/truckers/1/last_location
* #####  POST /api/truckers HTTP/1.1
* #####  Content-Type: application/json; charset="utf-8"
* ##### HTTP 204 No Content
> 
```json
    {
        "location": {
            "city": "São Paulo",
            "state": "SP"
                    }   
    }
```



### GET /api/shipments/1/nearby_truckers
* #####  GET /api/shipments/1/nearby_truckers HTTP/1.1
* #####  Content-Type: application/json; charset="utf-8"
* ##### HTTP 200 OK
> 
```json
    {
        "truckers": [
            {
                "id": 1,
                "name": "Lincoln Falcão",
                "phone": "(11) 97654-3210",
                "vehicle": {
                    "type": "Truck", "body_type": "Baú"
                }
            }
        ]
    }
```




