create table organization
(
    organizationid     smallint     not null
        constraint organization_pkey
            primary key,
    organization       varchar(250) not null
        constraint organization_organization_key
            unique,
    organizationabbr   varchar(20)  not null
        constraint organization_organizationabbr_key
            unique,
    organizationtypeid smallint     not null
        constraint organization_organizationtypeid_fkey
            references organizationtype
);

alter table organization
    owner to postgres;

INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (1, 'ABR, Inc.—Environmental Research & Services', 'ABR', 4);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (2, 'Alaska Center for Conservation Science', 'ACCS', 1);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (3, 'Alaska Department of Fish and Game', 'ADF&G', 3);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (4, 'Alaska Department of Natural Resources', 'ADNR', 3);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (5, 'Bureau of Land Management', 'BLM', 2);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (6, 'Environmental Protection Agency', 'EPA', 2);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (7, 'National Park Service', 'NPS', 2);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (8, 'National Science Foundation', 'NSF', 2);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (9, 'North Slope Science Initiative', 'NSSI', 2);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (10, 'U.S. Fish and Wildlife Service', 'USFWS', 2);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (11, 'U.S. Forest Service', 'USFS', 2);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (12, 'University of Alaska Anchorage', 'UAA', 1);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (13, 'University of Alaska Fairbanks', 'UAF', 1);
INSERT INTO public.organization (organizationid, organization, organizationabbr, organizationtypeid) VALUES (14, 'University of Alaska Southeast', 'UAS', 1);