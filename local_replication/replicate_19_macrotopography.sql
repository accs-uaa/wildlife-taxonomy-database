create table macrotopography
(
    macrotopographyid smallint    not null
        constraint macrotopography_pkey
            primary key,
    macrotopography   varchar(50) not null
        constraint macrotopography_macrotopography_key
            unique
);

alter table macrotopography
    owner to postgres;

INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (1, 'alluvial cone');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (2, 'alluvial fan');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (3, 'alluvial flat');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (4, 'beach');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (5, 'beach berm');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (6, 'beach plain');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (7, 'beach terrace');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (8, 'bench');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (9, 'bluff');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (10, 'cirque');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (11, 'colluvial apron');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (12, 'cove');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (13, 'depression');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (14, 'draw');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (15, 'dunes');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (16, 'esker');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (17, 'floodplain abandoned');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (18, 'floodplain bar');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (19, 'floodplain basin');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (20, 'floodplain island');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (21, 'floodplain overflow channel');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (22, 'floodplain oxbow');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (23, 'floodplain terrace');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (24, 'glacier');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (25, 'inlet');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (26, 'lake bed');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (27, 'lake shore');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (28, 'moraine');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (29, 'moraine lateral');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (30, 'moraine medial');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (31, 'moraine terminal');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (32, 'nearshore zone');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (33, 'non-patterned drained thaw lake basin');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (34, 'pingo');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (35, 'plane');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (36, 'polygons flat-center');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (37, 'polygons high-center');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (38, 'polygons low-center');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (39, 'polygons low-center coalescent');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (40, 'polygons mixed');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (41, 'ridge');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (42, 'river bed');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (43, 'saddle');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (44, 'slope');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (45, 'slope concave');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (46, 'slope convex');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (47, 'slope planar');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (48, 'spur');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (49, 'summit');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (50, 'terrace');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (51, 'tidal');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (52, 'tidal flat');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (53, 'tidal inlet');
INSERT INTO public.macrotopography (macrotopographyid, macrotopography) VALUES (54, 'undulating');