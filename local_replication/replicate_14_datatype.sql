create table datatype
(
    datatypeid smallint    not null
        constraint datatype_pkey
            primary key,
    datatype   varchar(80) not null
        constraint datatype_datatype_key
            unique
);

alter table datatype
    owner to postgres;

INSERT INTO public.datatype (datatypeid, datatype) VALUES (1, 'boolean');
INSERT INTO public.datatype (datatypeid, datatype) VALUES (2, 'date');
INSERT INTO public.datatype (datatypeid, datatype) VALUES (3, 'decimal');
INSERT INTO public.datatype (datatypeid, datatype) VALUES (4, 'integer');
INSERT INTO public.datatype (datatypeid, datatype) VALUES (5, 'serial');
INSERT INTO public.datatype (datatypeid, datatype) VALUES (6, 'smallint');
INSERT INTO public.datatype (datatypeid, datatype) VALUES (7, 'varchar');