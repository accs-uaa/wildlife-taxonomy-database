create table perspective
(
    perspectiveid smallint    not null
        constraint perspective_pkey
            primary key,
    perspective   varchar(50) not null
        constraint perspective_perspective_key
            unique
);

alter table perspective
    owner to postgres;

INSERT INTO public.perspective (perspectiveid, perspective) VALUES (1, 'ground');
INSERT INTO public.perspective (perspectiveid, perspective) VALUES (2, 'aerial');