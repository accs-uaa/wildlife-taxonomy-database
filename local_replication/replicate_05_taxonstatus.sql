create table taxonstatus
(
    taxonstatusid smallint    not null
        constraint taxonstatus_pkey
            primary key,
    taxonstatus   varchar(30) not null
        constraint taxonstatus_taxonstatus_key
            unique
);

alter table taxonstatus
    owner to postgres;

INSERT INTO public.taxonstatus (taxonstatusid, taxonstatus) VALUES (1, 'accepted');
INSERT INTO public.taxonstatus (taxonstatusid, taxonstatus) VALUES (2, 'name misapplied');
INSERT INTO public.taxonstatus (taxonstatusid, taxonstatus) VALUES (3, 'provisional');
INSERT INTO public.taxonstatus (taxonstatusid, taxonstatus) VALUES (4, 'spelling variant');
INSERT INTO public.taxonstatus (taxonstatusid, taxonstatus) VALUES (5, 'synonym');