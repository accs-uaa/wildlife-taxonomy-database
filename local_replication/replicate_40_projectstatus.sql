create table projectstatus
(
    projectstatusid     smallint not null
        constraint projectstatus_pkey
            primary key,
    projectid           smallint not null
        constraint projectstatus_projectid_fkey
            references project,
    projectmodified     date     not null,
    sitemodified        date,
    covermodified       date,
    environmentmodified date,
    modifiedbyid        smallint not null
);

alter table projectstatus
    owner to postgres;

INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (1, 1, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (2, 2, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (3, 3, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (4, 4, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (5, 5, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (6, 6, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (7, 7, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (8, 8, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (9, 9, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (10, 10, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (11, 11, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (12, 12, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (13, 13, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (14, 14, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (15, 15, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (16, 16, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (17, 17, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (18, 18, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (19, 19, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (20, 20, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (21, 21, '2020-11-05', '2020-11-05', '2020-11-05', '2020-11-05', 80);
INSERT INTO public.projectstatus (projectstatusid, projectid, projectmodified, sitemodified, covermodified, environmentmodified, modifiedbyid) VALUES (22, 22, '2020-11-05', '2020-11-05', '2020-11-05', null, 80);