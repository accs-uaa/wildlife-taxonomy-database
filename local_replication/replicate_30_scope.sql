create table scope
(
    scopeid smallint    not null
        constraint scope_pkey
            primary key,
    scope   varchar(30) not null
        constraint scope_scope_key
            unique
);

alter table scope
    owner to postgres;

INSERT INTO public.scope (scopeid, scope) VALUES (1, 'exhaustive');
INSERT INTO public.scope (scopeid, scope) VALUES (2, 'non-trace species');
INSERT INTO public.scope (scopeid, scope) VALUES (3, 'high cover species');
INSERT INTO public.scope (scopeid, scope) VALUES (4, 'common species');
INSERT INTO public.scope (scopeid, scope) VALUES (5, 'partial');
INSERT INTO public.scope (scopeid, scope) VALUES (6, 'genus');
INSERT INTO public.scope (scopeid, scope) VALUES (7, 'functional group or life form');
INSERT INTO public.scope (scopeid, scope) VALUES (8, 'none');