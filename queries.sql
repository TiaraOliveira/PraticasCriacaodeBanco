CREATE TABLE "customers"(
"id" SERIAL PRIMARY KEY,
"fullName" TEXT NOT NULL,
"cpf" CHAR(11) NOT NULL UNIQUE,
"email" text NOT NULL,
"password" text NOT NULL
)

SELECT * FROM customers;

CREATE TABLE states(
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL)

SELECT * FROM states;

CREATE table cities(
	"id" SERIAL PRIMARY KEY,
	"name" TEXT,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id") 
)
SELECT * FROM cities;

CREATE TABLE "customerAddresses"(
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id") UNIQUE,
"street" TEXT NOT NULL,
"number" INTEGER NOT NULL,
complement TEXT,
"postalCode" VARCHAR(8) NOT NULL,
"cityId" INTEGER NOT NULL REFERENCES "cities"("id") 
)

SELECT * FROM "customerAddresses";

CREATE TABLE "customerPhones"(
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
"number" VARCHAR (11) NOT NULL,
"type" TEXT
)


CREATE TABLE "bankAccount"(
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
"accountNumber" VARCHAR(30),
"agency" VARCHAR(6),
"opendate" date,
"closeDate" date
)

CREATE TABLE transactions(
"id" SERIAL PRIMARY KEY,
"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
"amount" REAL NOT NULL DEFAULT 0,
"type" TEXT NOT NULL DEFAULT 'Conta Corrente',
"time" TIME, 
description TEXT,
"cancelled" BOOLEAN DEFAULT false
)

CREATE TABLE "creditCards"(
"id" SERIAL PRIMARY KEY,
"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
"name" TEXT NOT NULL,
"securityCode" CHAR(3) NOT NULL,
"expirationMonth" CHAR(2) NOT NULL,
"expirationYear" CHAR(4) NOT NULL,
"password" VARCHAR(6) NOT NULL,
"limit" REAL NOT NULL DEFAULT 1000
)
