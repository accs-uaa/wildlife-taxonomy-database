create table completion
(
    completionid smallint    not null
        constraint completion_pkey
            primary key,
    completion   varchar(30) not null
        constraint completion_completion_key
            unique
);

alter table completion
    owner to postgres;

INSERT INTO public.completion (completionid, completion) VALUES (1, 'finished');
INSERT INTO public.completion (completionid, completion) VALUES (2, 'ongoing');