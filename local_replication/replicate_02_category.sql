create table category
(
    categoryid smallint    not null
        constraint category_pkey
            primary key,
    category   varchar(30) not null
        constraint category_category_key
            unique
);

alter table category
    owner to postgres;

INSERT INTO public.category (categoryid, category) VALUES (1, 'Eudicot');
INSERT INTO public.category (categoryid, category) VALUES (2, 'Fern');
INSERT INTO public.category (categoryid, category) VALUES (3, 'Gymnosperm');
INSERT INTO public.category (categoryid, category) VALUES (4, 'Hornwort');
INSERT INTO public.category (categoryid, category) VALUES (5, 'Horsetail');
INSERT INTO public.category (categoryid, category) VALUES (6, 'Lichen');
INSERT INTO public.category (categoryid, category) VALUES (7, 'Liverwort');
INSERT INTO public.category (categoryid, category) VALUES (8, 'Lycophyte');
INSERT INTO public.category (categoryid, category) VALUES (9, 'Monocot');
INSERT INTO public.category (categoryid, category) VALUES (10, 'Moss');
INSERT INTO public.category (categoryid, category) VALUES (11, 'Unknown');