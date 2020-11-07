create table drainage
(
    drainageid smallint    not null
        constraint drainage_pkey
            primary key,
    drainage   varchar(50) not null
        constraint drainage_drainage_key
            unique
);

alter table drainage
    owner to postgres;

INSERT INTO public.drainage (drainageid, drainage) VALUES (1, 'well drained');
INSERT INTO public.drainage (drainageid, drainage) VALUES (2, 'moderately drained');
INSERT INTO public.drainage (drainageid, drainage) VALUES (3, 'poorly drained');
INSERT INTO public.drainage (drainageid, drainage) VALUES (4, 'flooded');
INSERT INTO public.drainage (drainageid, drainage) VALUES (5, 'aquatic');