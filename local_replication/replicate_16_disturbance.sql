create table disturbance
(
    disturbanceid smallint    not null
        constraint disturbance_pkey
            primary key,
    disturbance   varchar(50) not null
        constraint disturbance_disturbance_key
            unique
);

alter table disturbance
    owner to postgres;

INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (1, 'aeolian process');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (2, 'agricultural');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (3, 'ATV use');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (4, 'clearing');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (5, 'contaminants');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (6, 'developed site');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (7, 'disturbance complex');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (8, 'excavation');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (9, 'fill');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (10, 'fire');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (11, 'geomorphic process');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (12, 'historic anthropogenic');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (13, 'man-made waterbody');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (14, 'none');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (15, 'permafrost dynamics');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (16, 'riparian');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (17, 'road');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (18, 'solifluction');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (19, 'structure');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (20, 'tidal');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (21, 'timber harvest');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (22, 'trail');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (23, 'weather process');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (24, 'wildlife digging');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (25, 'wildlife grazing');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (26, 'wildlife trails');
INSERT INTO public.disturbance (disturbanceid, disturbance) VALUES (27, 'wildlife trampling');