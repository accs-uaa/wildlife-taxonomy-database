create table plotdimensions
(
    plotdimensionsid smallint    not null
        constraint plotdimensions_pkey
            primary key,
    plotdimensions   varchar(50) not null
        constraint plotdimensions_plotdimensions_key
            unique
);

alter table plotdimensions
    owner to postgres;

INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (1, '1 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (2, '1×7');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (3, '1×8');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (4, '1×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (5, '1×12');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (6, '2×2');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (7, '2×5');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (8, '2×7');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (9, '2×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (10, '2×12');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (11, '2×20');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (12, '2×30');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (13, '3×6');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (14, '3×7');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (15, '3×8');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (16, '3×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (17, '3×12');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (18, '3×15');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (19, '3×20');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (20, '3×25');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (21, '4×4');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (22, '4×8');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (23, '4×25');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (24, '5 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (25, '5×5');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (26, '5×8');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (27, '5×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (28, '5×15');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (29, '5×20');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (30, '5×30');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (31, '6×6');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (32, '6×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (33, '6×12');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (34, '7×8');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (35, '7×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (36, '8 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (37, '8×8');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (38, '8×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (39, '8×12');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (40, '10 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (41, '10×10');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (42, '10×12');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (43, '10×20');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (44, '10×30');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (45, '10×40');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (46, '100×100');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (47, '12×12');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (48, '15 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (49, '15×15');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (50, '15×18');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (51, '15×30');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (52, '18×18');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (53, '20 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (54, '20×20');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (55, '20×40');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (56, '20×80');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (57, '20×100');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (58, '25×25');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (59, '25×50');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (60, '25×80');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (61, '25×100');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (62, '23 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (63, '30 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (64, '30×30');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (65, '30×80');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (66, '34.7 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (67, '40×40');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (68, '50×50');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (69, '50×80');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (70, '55 radius');
INSERT INTO public.plotdimensions (plotdimensionsid, plotdimensions) VALUES (71, 'unknown');