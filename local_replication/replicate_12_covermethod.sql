create table covermethod
(
    covermethodid smallint    not null
        constraint covermethod_pkey
            primary key,
    covermethod   varchar(50) not null
        constraint covermethod_covermethod_key
            unique
);

alter table covermethod
    owner to postgres;

INSERT INTO public.covermethod (covermethodid, covermethod) VALUES (1, 'line-point intercept');
INSERT INTO public.covermethod (covermethodid, covermethod) VALUES (2, 'grid-point intercept');
INSERT INTO public.covermethod (covermethodid, covermethod) VALUES (3, 'semi-quantitative visual estimate');
INSERT INTO public.covermethod (covermethodid, covermethod) VALUES (4, 'braun-blanquet visual estimate');
INSERT INTO public.covermethod (covermethodid, covermethod) VALUES (5, 'daubenmire visual estimate');
INSERT INTO public.covermethod (covermethodid, covermethod) VALUES (6, 'custom classification visual estimate');