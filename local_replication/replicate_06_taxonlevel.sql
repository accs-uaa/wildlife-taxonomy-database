create table taxonlevel
(
    levelid smallint    not null
        constraint taxonlevel_pkey
            primary key,
    level   varchar(30) not null
        constraint taxonlevel_level_key
            unique
);

alter table taxonlevel
    owner to postgres;

INSERT INTO public.taxonlevel (levelid, level) VALUES (1, 'genus');
INSERT INTO public.taxonlevel (levelid, level) VALUES (2, 'hybrid');
INSERT INTO public.taxonlevel (levelid, level) VALUES (3, 'microspecies');
INSERT INTO public.taxonlevel (levelid, level) VALUES (4, 'species');
INSERT INTO public.taxonlevel (levelid, level) VALUES (5, 'subspecies');
INSERT INTO public.taxonlevel (levelid, level) VALUES (6, 'unknown');
INSERT INTO public.taxonlevel (levelid, level) VALUES (7, 'variety');