create table stratification
(
    strataid smallint    not null
        constraint stratification_pkey
            primary key,
    strata   varchar(50) not null
        constraint stratification_strata_key
            unique
);

alter table stratification
    owner to postgres;

INSERT INTO public.stratification (strataid, strata) VALUES (1, 'aquatic forb');
INSERT INTO public.stratification (strataid, strata) VALUES (2, 'barrens or partially vegetated');
INSERT INTO public.stratification (strataid, strata) VALUES (3, 'bog meadow');
INSERT INTO public.stratification (strataid, strata) VALUES (4, 'deciduous forest');
INSERT INTO public.stratification (strataid, strata) VALUES (5, 'bryoid herbaceous');
INSERT INTO public.stratification (strataid, strata) VALUES (6, 'coastal water');
INSERT INTO public.stratification (strataid, strata) VALUES (7, 'dwarf shrub');
INSERT INTO public.stratification (strataid, strata) VALUES (8, 'forb emergent');
INSERT INTO public.stratification (strataid, strata) VALUES (9, 'forb meadow');
INSERT INTO public.stratification (strataid, strata) VALUES (10, 'glacial ice');
INSERT INTO public.stratification (strataid, strata) VALUES (11, 'graminoid emergent');
INSERT INTO public.stratification (strataid, strata) VALUES (12, 'grass meadow');
INSERT INTO public.stratification (strataid, strata) VALUES (13, 'lake water');
INSERT INTO public.stratification (strataid, strata) VALUES (14, 'lichen tundra');
INSERT INTO public.stratification (strataid, strata) VALUES (15, 'low shrub');
INSERT INTO public.stratification (strataid, strata) VALUES (16, 'low-tall shrub');
INSERT INTO public.stratification (strataid, strata) VALUES (17, 'marine water');
INSERT INTO public.stratification (strataid, strata) VALUES (18, 'mixed forest');
INSERT INTO public.stratification (strataid, strata) VALUES (19, 'moist tundra');
INSERT INTO public.stratification (strataid, strata) VALUES (20, 'coniferous forest');
INSERT INTO public.stratification (strataid, strata) VALUES (21, 'open water');
INSERT INTO public.stratification (strataid, strata) VALUES (22, 'river water');
INSERT INTO public.stratification (strataid, strata) VALUES (23, 'sedge emergent');
INSERT INTO public.stratification (strataid, strata) VALUES (24, 'sedge meadow');
INSERT INTO public.stratification (strataid, strata) VALUES (25, 'tall shrub');
INSERT INTO public.stratification (strataid, strata) VALUES (26, 'tidal marsh');
INSERT INTO public.stratification (strataid, strata) VALUES (27, 'tussock tundra');
INSERT INTO public.stratification (strataid, strata) VALUES (28, 'wet meadow');
INSERT INTO public.stratification (strataid, strata) VALUES (29, 'wetland');