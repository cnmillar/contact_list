CREATE TABLE contacts (
  id        serial NOT NULL PRIMARY KEY,
  firstname varchar(40) NOT NULL,
  lastname  varchar(40) NOT NULL,
  email     varchar(40) NOT NULL
);

COPY contacts (id, firstname, lastname, email) FROM stdin;
Caitlin, Millar, cnmillar@gmail.com
\.