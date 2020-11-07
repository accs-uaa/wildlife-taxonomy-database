create table datum
(
    datumid smallint    not null
        constraint datum_pkey
            primary key,
    datum   varchar(50) not null
        constraint datum_datum_key
            unique
);

alter table datum
    owner to postgres;

INSERT INTO public.datum (datumid, datum) VALUES (1, 'NAD83');