create table covertype
(
    covertypeid smallint    not null
        constraint covertype_pkey
            primary key,
    covertype   varchar(50) not null
        constraint covertype_covertype_key
            unique
);

alter table covertype
    owner to postgres;

INSERT INTO public.covertype (covertypeid, covertype) VALUES (1, 'total cover');
INSERT INTO public.covertype (covertypeid, covertype) VALUES (2, 'top cover');
INSERT INTO public.covertype (covertypeid, covertype) VALUES (3, 'density');