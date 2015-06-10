-- Did not use. Did it by hand through terminal.

CREATE TABLE contacts (
  id        serial NOT NULL PRIMARY KEY,
  firstname varchar(40) NOT NULL,
  lastname  varchar(40) NOT NULL,
  email     varchar(40) NOT NULL
);

CREATE TABLE phones (
  id        		serial NOT NULL PRIMARY KEY,
  contact_id		integer NOT NULL FOREIGN KEY,
  phone_number  varchar(40) NOT NULL
);

ALTER TABLE phones
  ADD CONSTRAINT phone_contact_fkey FOREIGN KEY (contact_id) REFERENCES contacts (id)
   ON UPDATE CASCADE ON DELETE CASCADE;
CREATE INDEX fki_phone_contact_fkey
  ON phones(contact_id);


COPY contacts (id, firstname, lastname, email) FROM stdin;
Caitlin, Millar, cnmillar@gmail.com
\.