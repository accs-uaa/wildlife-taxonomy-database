create table restrictivetype
(
    restrictivetypeid smallint    not null
        constraint restrictivetype_pkey
            primary key,
    restrictivetype   varchar(50) not null
        constraint restrictivetype_restrictivetype_key
            unique
);

alter table restrictivetype
    owner to postgres;

INSERT INTO public.restrictivetype (restrictivetypeid, restrictivetype) VALUES (1, 'seasonal frost');
INSERT INTO public.restrictivetype (restrictivetypeid, restrictivetype) VALUES (2, 'permafrost');
INSERT INTO public.restrictivetype (restrictivetypeid, restrictivetype) VALUES (3, 'bedrock');
INSERT INTO public.restrictivetype (restrictivetypeid, restrictivetype) VALUES (4, 'paralithic contact');
INSERT INTO public.restrictivetype (restrictivetypeid, restrictivetype) VALUES (5, 'densic layer');
INSERT INTO public.restrictivetype (restrictivetypeid, restrictivetype) VALUES (6, 'rock, unconsolidated');