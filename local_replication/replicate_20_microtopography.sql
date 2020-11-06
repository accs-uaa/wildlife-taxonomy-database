create table microtopography
(
    microtopographyid smallint    not null
        constraint microtopography_pkey
            primary key,
    microtopography   varchar(50) not null
        constraint microtopography_microtopography_key
            unique
);

alter table microtopography
    owner to postgres;

INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (1, 'anthroscape');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (2, 'boulder field');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (3, 'channeled');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (4, 'circles (non-sorted, sorted)');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (5, 'concave');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (6, 'convex');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (7, 'debris');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (8, 'fluviokarst');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (9, 'frost scars and boils');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (10, 'hummocks');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (11, 'gelifluction lobes');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (12, 'glaciokarst');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (13, 'ice wedge');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (14, 'ice-cored mounds');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (15, 'karst');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (16, 'lava field');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (17, 'mounds');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (18, 'mounds caused by trees');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (19, 'mounds caused by wildlife');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (20, 'nets (non-sorted, sorted)');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (21, 'outcrops');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (22, 'peat mounds');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (23, 'plane');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (24, 'polygonal');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (25, 'ponds');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (26, 'reticulate');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (27, 'ridges and swales');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (28, 'scree');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (29, 'soil-covered rocks');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (30, 'solifluction lobes');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (31, 'steps (non-sorted, sorted)');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (32, 'string');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (33, 'stripes (non-sorted, sorted)');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (34, 'talus');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (35, 'thermokarst');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (36, 'tors');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (37, 'treads and risers');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (38, 'tussocks');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (39, 'undulating');
INSERT INTO public.microtopography (microtopographyid, microtopography) VALUES (40, 'water tracks');