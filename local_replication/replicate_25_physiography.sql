create table physiography
(
    physiographyid smallint    not null
        constraint physiography_pkey
            primary key,
    physiography   varchar(50) not null
        constraint physiography_physiography_key
            unique
);

alter table physiography
    owner to postgres;

INSERT INTO public.physiography (physiographyid, physiography) VALUES (1, 'alpine');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (2, 'subalpine');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (3, 'montane');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (4, 'hills');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (5, 'upland');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (6, 'lowland');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (7, 'coastal');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (8, 'glacial');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (9, 'lacustrine');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (10, 'riverine');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (11, 'anthropogenic');
INSERT INTO public.physiography (physiographyid, physiography) VALUES (12, 'volcanic');