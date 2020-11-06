create table habit
(
    habitid smallint    not null
        constraint habit_pkey
            primary key,
    habit   varchar(80) not null
        constraint habit_habit_key
            unique
);

alter table habit
    owner to postgres;

INSERT INTO public.habit (habitid, habit) VALUES (1, 'Algae');
INSERT INTO public.habit (habitid, habit) VALUES (2, 'Coniferous Tree');
INSERT INTO public.habit (habitid, habit) VALUES (3, 'Crust');
INSERT INTO public.habit (habitid, habit) VALUES (4, 'Cyanobacteria');
INSERT INTO public.habit (habitid, habit) VALUES (5, 'Deciduous Tree');
INSERT INTO public.habit (habitid, habit) VALUES (6, 'Dwarf Shrub');
INSERT INTO public.habit (habitid, habit) VALUES (7, 'Dwarf Shrub, Shrub');
INSERT INTO public.habit (habitid, habit) VALUES (8, 'Dwarf Shrub, Shrub, Tree');
INSERT INTO public.habit (habitid, habit) VALUES (9, 'Forb');
INSERT INTO public.habit (habitid, habit) VALUES (10, 'Forb, Dwarf Shrub, Shrub');
INSERT INTO public.habit (habitid, habit) VALUES (11, 'Forb, Shrub');
INSERT INTO public.habit (habitid, habit) VALUES (12, 'Fungus');
INSERT INTO public.habit (habitid, habit) VALUES (13, 'Graminoid');
INSERT INTO public.habit (habitid, habit) VALUES (14, 'Hornwort');
INSERT INTO public.habit (habitid, habit) VALUES (15, 'Lichen');
INSERT INTO public.habit (habitid, habit) VALUES (16, 'Liverwort');
INSERT INTO public.habit (habitid, habit) VALUES (17, 'Moss');
INSERT INTO public.habit (habitid, habit) VALUES (18, 'Parasitic/Saprophytic');
INSERT INTO public.habit (habitid, habit) VALUES (19, 'Shrub');
INSERT INTO public.habit (habitid, habit) VALUES (20, 'Shrub, Deciduous Tree');
INSERT INTO public.habit (habitid, habit) VALUES (21, 'Spore-bearing');
INSERT INTO public.habit (habitid, habit) VALUES (22, 'Vine');