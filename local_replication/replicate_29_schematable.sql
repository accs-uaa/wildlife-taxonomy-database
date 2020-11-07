create table schematable
(
    schematableid smallint    not null
        constraint schematable_pkey
            primary key,
    schematable   varchar(80) not null
        constraint schematable_schematable_key
            unique
);

alter table schematable
    owner to postgres;

INSERT INTO public.schematable (schematableid, schematable) VALUES (1, 'author');
INSERT INTO public.schematable (schematableid, schematable) VALUES (2, 'category');
INSERT INTO public.schematable (schematableid, schematable) VALUES (3, 'completion');
INSERT INTO public.schematable (schematableid, schematable) VALUES (4, 'cover');
INSERT INTO public.schematable (schematableid, schematable) VALUES (5, 'coverMethod');
INSERT INTO public.schematable (schematableid, schematable) VALUES (6, 'coverType');
INSERT INTO public.schematable (schematableid, schematable) VALUES (7, 'databaseDictionary');
INSERT INTO public.schematable (schematableid, schematable) VALUES (8, 'databaseSchema');
INSERT INTO public.schematable (schematableid, schematable) VALUES (9, 'dataType');
INSERT INTO public.schematable (schematableid, schematable) VALUES (10, 'datum');
INSERT INTO public.schematable (schematableid, schematable) VALUES (11, 'disturbance');
INSERT INTO public.schematable (schematableid, schematable) VALUES (12, 'drainage');
INSERT INTO public.schematable (schematableid, schematable) VALUES (13, 'environment');
INSERT INTO public.schematable (schematableid, schematable) VALUES (14, 'family');
INSERT INTO public.schematable (schematableid, schematable) VALUES (15, 'geomorphology');
INSERT INTO public.schematable (schematableid, schematable) VALUES (16, 'habit');
INSERT INTO public.schematable (schematableid, schematable) VALUES (17, 'hierarchy');
INSERT INTO public.schematable (schematableid, schematable) VALUES (18, 'macrotopography');
INSERT INTO public.schematable (schematableid, schematable) VALUES (19, 'microtopography');
INSERT INTO public.schematable (schematableid, schematable) VALUES (20, 'moisture');
INSERT INTO public.schematable (schematableid, schematable) VALUES (21, 'organization');
INSERT INTO public.schematable (schematableid, schematable) VALUES (22, 'organizationType');
INSERT INTO public.schematable (schematableid, schematable) VALUES (23, 'personnel');
INSERT INTO public.schematable (schematableid, schematable) VALUES (24, 'perspective');
INSERT INTO public.schematable (schematableid, schematable) VALUES (25, 'physiography');
INSERT INTO public.schematable (schematableid, schematable) VALUES (26, 'plotDimensions');
INSERT INTO public.schematable (schematableid, schematable) VALUES (27, 'project');
INSERT INTO public.schematable (schematableid, schematable) VALUES (28, 'projectStatus');
INSERT INTO public.schematable (schematableid, schematable) VALUES (29, 'restrictiveType');
INSERT INTO public.schematable (schematableid, schematable) VALUES (30, 'schemaCategory');
INSERT INTO public.schematable (schematableid, schematable) VALUES (31, 'schemaTable');
INSERT INTO public.schematable (schematableid, schematable) VALUES (32, 'scope');
INSERT INTO public.schematable (schematableid, schematable) VALUES (33, 'site');
INSERT INTO public.schematable (schematableid, schematable) VALUES (34, 'soilClass');
INSERT INTO public.schematable (schematableid, schematable) VALUES (35, 'stratification');
INSERT INTO public.schematable (schematableid, schematable) VALUES (36, 'taxonAccepted');
INSERT INTO public.schematable (schematableid, schematable) VALUES (37, 'taxonAdjudicated');
INSERT INTO public.schematable (schematableid, schematable) VALUES (38, 'taxonLevel');
INSERT INTO public.schematable (schematableid, schematable) VALUES (39, 'taxonSource');
INSERT INTO public.schematable (schematableid, schematable) VALUES (40, 'taxonStatus');