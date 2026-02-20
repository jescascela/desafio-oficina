# 🛠️ Mechanical Workshop Database

Projeto de modelagem e implementação de banco de dados relacional para uma **Oficina Mecânica**, desenvolvido como desafio prático de modelagem de Banco de Dados.

---

## 📌 Objetivo

Criar o esquema lógico a partir do modelo ER previamente desenvolvido, implementar o banco de dados via script SQL, inserir dados para testes e elaborar consultas SQL simples e complexas.

---

## 🗂️ Estrutura do Projeto

O repositório contém:

- 📄 `script-oficina.sql` → Script completo de criação do banco e inserção de dados  
- 📄 `README.md` → Documentação do projeto  

---

## 🧠 Modelo Lógico

O banco de dados foi modelado para representar o funcionamento de uma oficina mecânica, contemplando:

### 🔹 Entidades Principais

- **State** → Estados  
- **Cities** → Cidades  
- **Employees** → Funcionários  
- **Teams** → Equipes  
- **Clients** → Clientes  
- **Vehicles** → Veículos  
- **Services** → Serviços oferecidos  
- **StockParts** → Peças em estoque  
- **Orders** → Ordens de serviço  

### 🔹 Tabelas Associativas

- **OMServices** → Relação entre Ordens e Serviços  
- **OMParts** → Relação entre Ordens e Peças  

---

## 🏗️ Tecnologias Utilizadas

- MySQL  
- Modelo Relacional  
- SQL (DDL e DML)  

---

## 📊 Funcionalidades Implementadas

O projeto contempla:

✔ Criação de banco de dados  
✔ Criação de tabelas com chaves primárias e estrangeiras  
✔ Inserção de dados para testes  
✔ Consultas SQL contendo:

- SELECT simples  
- WHERE  
- Atributos derivados  
- ORDER BY  
- GROUP BY  
- HAVING  
- JOINs entre múltiplas tabelas  

---

## 🔎 Exemplos de Consultas Desenvolvidas

Algumas perguntas respondidas pelas queries:

- Quais clientes estão cadastrados?
- Quais ordens estão concluídas?
- Qual a margem de lucro das peças?
- Quais serviços são mais caros?
- Quais clientes possuem mais de uma ordem?
- Quais serviços foram realizados em cada ordem?
- Qual cliente realizou qual serviço e em qual veículo?

---

## 👨‍💻 Autor

Projeto desenvolvido para fins acadêmicos como desafio de modelagem e implementação de Banco de Dados.
