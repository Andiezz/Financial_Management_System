CREATE TABLE [dbo].[sessions](
    [sid] [nvarchar](255) NOT NULL PRIMARY KEY,
    [session] [nvarchar](max) NOT NULL,
    [expires] [datetime] NOT NULL
)

CREATE TABLE [users](
    id INT NOT NULL IDENTITY(1,1),
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
	firstName NVARCHAR(255),
	lastName NVARCHAR(255),
	dob DATE,
	job NVARCHAR(255),
	address NVARCHAR(255),
	phone VARCHAR(20),
	facebook VARCHAR(255),
	linkedin VARCHAR(255),
	gender BIT
	CONSTRAINT PK_users PRIMARY KEY (id)
)

CREATE TABLE [wallets](
	wallet_id INT IDENTITY(1,1),
	id INT,
	name NVARCHAR(255),
	type NVARCHAR(255),
	acc_balance INT,
	percentage FLOAT,
	period INT,
	CONSTRAINT PK_wallets PRIMARY KEY (wallet_id),
	CONSTRAINT FK_wallets_users FOREIGN KEY (id) REFERENCES users(id)
	ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE [categories](
	category_id INT,
	name NVARCHAR(255),
	parent_id INT,
	CONSTRAINT PK_categories PRIMARY KEY (category_id)
)

CREATE TABLE [incomes](
	income_id INT IDENTITY(1,1),
	amount INT,
	note NVARCHAR(255),
	date DATE,
	wallet_id INT,
	category_id INT,
	CONSTRAINT PK_incomes PRIMARY KEY (income_id),
	CONSTRAINT FK_incomes_wallets FOREIGN KEY (wallet_id) REFERENCES wallets(wallet_id)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_incomes_categories FOREIGN KEY (category_id) REFERENCES categories(category_id)
	ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE [expenses](
	expense_id INT IDENTITY(1,1),
	amount INT,
	note NVARCHAR(255),
	date DATE,
	wallet_id INT,
	category_id INT,
	CONSTRAINT PK_expenses PRIMARY KEY (expense_id),
	CONSTRAINT FK_expenses_wallets FOREIGN KEY (wallet_id) REFERENCES wallets(wallet_id)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_expenses_categories FOREIGN KEY (category_id) REFERENCES categories(category_id)
	ON UPDATE CASCADE ON DELETE CASCADE
)