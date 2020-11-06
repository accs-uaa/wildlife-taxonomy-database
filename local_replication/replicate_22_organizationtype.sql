create table organizationtype
(
    organizationtypeid smallint    not null
        constraint organizationtype_pkey
            primary key,
    organizationtype   varchar(50) not null
        constraint organizationtype_organizationtype_key
            unique
);

alter table organizationtype
    owner to postgres;

INSERT INTO public.organizationtype (organizationtypeid, organizationtype) VALUES (1, 'University');
INSERT INTO public.organizationtype (organizationtypeid, organizationtype) VALUES (2, 'Federal Agency');
INSERT INTO public.organizationtype (organizationtypeid, organizationtype) VALUES (3, 'State Agency');
INSERT INTO public.organizationtype (organizationtypeid, organizationtype) VALUES (4, 'Environmental Consultant');
INSERT INTO public.organizationtype (organizationtypeid, organizationtype) VALUES (5, 'Industry');