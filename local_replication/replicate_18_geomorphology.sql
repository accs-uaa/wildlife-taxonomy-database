create table geomorphology
(
    geomorphologyid smallint    not null
        constraint geomorphology_pkey
            primary key,
    geomorphology   varchar(50) not null
        constraint geomorphology_geomorphology_key
            unique
);

alter table geomorphology
    owner to postgres;

INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (1, 'aeolian deposit');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (2, 'alluvial plain');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (3, 'alluvial plain remnant');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (4, 'aquatic, lake');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (5, 'aquatic, river');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (6, 'barrier island');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (7, 'basin');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (8, 'batholith');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (9, 'breached anticline');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (10, 'caldera');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (11, 'canyon');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (12, 'coastal plain');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (13, 'colluvial deposit');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (14, 'delta');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (15, 'drumlin');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (16, 'estuary');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (17, 'fjord');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (18, 'floodplain');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (19, 'fluviomarine terrace');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (20, 'glaciofluvial outwash');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (21, 'gorge');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (22, 'headwater stream');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (23, 'hill');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (24, 'ice-margin complex');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (25, 'intermontane basin');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (26, 'island');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (27, 'lagoon');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (28, 'lake');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (29, 'marine, bay');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (30, 'marine, gulf');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (31, 'marine, ocean');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (32, 'marine, sea');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (33, 'marine, terrace');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (34, 'mountain');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (35, 'ocean shore');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (36, 'peninsula');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (37, 'plain');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (38, 'plateau');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (39, 'stream');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (40, 'valley');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (41, 'valley, alpine');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (42, 'valley, lowland');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (43, 'volcano');
INSERT INTO public.geomorphology (geomorphologyid, geomorphology) VALUES (44, 'volcano, shield');