CREATE TABLE [employee] (
	[employee_id] int NOT NULL,
	[user_name] nvarchar(30) NOT NULL,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[position] nvarchar(15) NOT NULL,
	[employment_date] date NOT NULL,
	[department_id] int,
	[manager_id] int,
	[rate] float(53) NOT NULL,
	[bonus] float(53),
	PRIMARY KEY ([employee_id])
);

CREATE TABLE [department] (
	[department_id] int NOT NULL,
	[department_name] nvarchar(30) NOT NULL,
	[city] nvarchar(30) NOT NULL,
	[street] nvarchar(40) NOT NULL,
	[building_no] int NOT NULL,
	PRIMARY KEY ([department_id])
);

CREATE TABLE [product] (
	[product_id] int NOT NULL,
	[product_name] nvarchar(40) NOT NULL,
	[product_description] nvarchar(150) NOT NULL,
	[category] nvarchar(15) NOT NULL,
	[manufacture] nvarchar(30) NOT NULL,
	[product_type] nvarchar(15) NOT NULL,
	[amount] int NOT NULL,
	[price] float(53) NOT NULL,
	PRIMARY KEY ([product_id])
);

CREATE TABLE [customer] (
	[customer_id] int IDENTITY(1,1) NOT NULL,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[genger] nvarchar(1) NOT NULL,
	[birth_date] date NOT NULL,
	[phone_number] int NOT NULL,
	[email] nvarchar(50) NOT NULL,
	[discount] int NOT NULL,
	PRIMARY KEY ([customer_id])
);

CREATE TABLE [orders] (
	[orders_id] int IDENTITY(1,1) NOT NULL,
	[employee_id] int NOT NULL,
	[product_id] int NOT NULL,
	[customer_id] int NOT NULL,
	[transaction_type] int NOT NULL,
	[transaction_moment] datetime NOT NULL,
	[amount] int NOT NULL,
	PRIMARY KEY ([orders_id])
);

ALTER TABLE [employee] ADD CONSTRAINT [employee_fk6] FOREIGN KEY ([department_id]) REFERENCES [department]([department_id]);

ALTER TABLE [employee] ADD CONSTRAINT [employee_fk7] FOREIGN KEY ([manager_id]) REFERENCES [employee]([employee_id]);



ALTER TABLE [orders] ADD CONSTRAINT [orders_fk1] FOREIGN KEY ([employee_id]) REFERENCES [employee]([employee_id]);

ALTER TABLE [orders] ADD CONSTRAINT [orders_fk2] FOREIGN KEY ([product_id]) REFERENCES [product]([product_id]);

ALTER TABLE [orders] ADD CONSTRAINT [orders_fk3] FOREIGN KEY ([customer_id]) REFERENCES [customer]([customer_id]);