create table moisture
(
    moistureid smallint    not null
        constraint moisture_pkey
            primary key,
    moisture   varchar(50) not null
        constraint moisture_moisture_key
            unique
);

alter table moisture
    owner to postgres;

INSERT INTO public.moisture (moistureid, moisture) VALUES (1, 'marine');
INSERT INTO public.moisture (moistureid, moisture) VALUES (2, 'brackish');
INSERT INTO public.moisture (moistureid, moisture) VALUES (3, 'aquatic');
INSERT INTO public.moisture (moistureid, moisture) VALUES (4, 'hydric-aquatic');
INSERT INTO public.moisture (moistureid, moisture) VALUES (5, 'hydric');
INSERT INTO public.moisture (moistureid, moisture) VALUES (6, 'hygric-hydric');
INSERT INTO public.moisture (moistureid, moisture) VALUES (7, 'hygric');
INSERT INTO public.moisture (moistureid, moisture) VALUES (8, 'mesic-hygric');
INSERT INTO public.moisture (moistureid, moisture) VALUES (9, 'mesic');
INSERT INTO public.moisture (moistureid, moisture) VALUES (10, 'xeric-mesic');
INSERT INTO public.moisture (moistureid, moisture) VALUES (11, 'xeric');