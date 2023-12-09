# Supermarket - Reports

Proyecto #1 y #2 para Tópicos Especiales de Gestión de Datos, hecho por:
- [Carlos Fornari](https://github.com/cdfornari)
- [Alejandro Molina](https://github.com/Alejo-FM)
- [Sandro Portanova](https://github.com/Sspa1)
- [Gianfranco Lanza](https://github.com/GianL22)

## Tech Stack
<p style="display:flex; align-content:center; justify-content:center; width: 100%">
  <a href="https://nextjs.org/" target="blank"><img src="https://cdn.worldvectorlogo.com/logos/next-js.svg" width="200" alt="Next Logo" /></a>
</p>

**Database**
+ [PostgresSQL](https://www.postgresql.org/)

## Installation

### 1. Clone the project
```bash
  git clone https://github.com/cdfornari/supermarket-reports.git
```

### 2. Go to the project directory
```bash
  cd supermarket-reports
```

### 3. Install dependencies to the client
```bash
  cd app && npm install
```

### 4. From this step you need to have docker installed. If you don't have it, you can install it from [here](https://docs.docker.com/get-docker/). This step is to run the database and load the seed.
```bash
  npm run db
```

### 5. Run the client.
```bash
  npm start
```

## Other Scripts (Optional)

### Drop the database. This script drops the database.
```bash
  npm run dbdrop
```

### Reset the database. This script drops the database and then runs the seed again.
```bash
  npm run dbreset
```

## Information about the second project

All references to the second project are in the `datamart` folder. Where you can find:
- The `datamart.sql` file, which contains the queries to create the datamart.
- The `dmseed.sql` file, which contains the seed to load the datamart.
- A ETL folder with the scripts to load the datamart using pentaho.
- A Power BI folder with the report and the data model.

Note: The dimension and fact tables are created when the database is created

### Seed for the dimensional database
````bash
  npm run dmseed
```