create table schemacategory
(
    schemacategoryid smallint    not null
        constraint schemacategory_pkey
            primary key,
    schemacategory   varchar(80) not null
        constraint schemacategory_schemacategory_key
            unique
);

alter table schemacategory
    owner to postgres;

INSERT INTO public.schemacategory (schemacategoryid, schemacategory) VALUES (1, 'environment');
INSERT INTO public.schemacategory (schemacategoryid, schemacategory) VALUES (2, 'metadata');
INSERT INTO public.schemacategory (schemacategoryid, schemacategory) VALUES (3, 'project');
INSERT INTO public.schemacategory (schemacategoryid, schemacategory) VALUES (4, 'site');
INSERT INTO public.schemacategory (schemacategoryid, schemacategory) VALUES (5, 'taxonomy');
INSERT INTO public.schemacategory (schemacategoryid, schemacategory) VALUES (6, 'vegetation');