create table personnel
(
    personnelid smallint    not null
        constraint personnel_pkey
            primary key,
    personnel   varchar(50) not null
        constraint personnel_personnel_key
            unique
);

alter table personnel
    owner to postgres;

INSERT INTO public.personnel (personnelid, personnel) VALUES (1, 'Abbey Rosso');
INSERT INTO public.personnel (personnelid, personnel) VALUES (2, 'Abe Schmidt');
INSERT INTO public.personnel (personnelid, personnel) VALUES (3, 'Aliza Segal');
INSERT INTO public.personnel (personnelid, personnel) VALUES (4, 'Amanda Droghini');
INSERT INTO public.personnel (personnelid, personnel) VALUES (5, 'Amanda Hardman');
INSERT INTO public.personnel (personnelid, personnel) VALUES (6, 'Amy Breen');
INSERT INTO public.personnel (personnelid, personnel) VALUES (7, 'Amy Miller');
INSERT INTO public.personnel (personnelid, personnel) VALUES (8, 'Anaka Mines');
INSERT INTO public.personnel (personnelid, personnel) VALUES (9, 'Anjanette Steer');
INSERT INTO public.personnel (personnelid, personnel) VALUES (10, 'Ann Garibaldi');
INSERT INTO public.personnel (personnelid, personnel) VALUES (11, 'Anna Jansen');
INSERT INTO public.personnel (personnelid, personnel) VALUES (12, 'Beth Koltun');
INSERT INTO public.personnel (personnelid, personnel) VALUES (13, 'Bonnie Bernard');
INSERT INTO public.personnel (personnelid, personnel) VALUES (14, 'Brian Heitz');
INSERT INTO public.personnel (personnelid, personnel) VALUES (15, 'Cassandra Wright');
INSERT INTO public.personnel (personnelid, personnel) VALUES (16, 'Chuck Lindsay');
INSERT INTO public.personnel (personnelid, personnel) VALUES (17, 'Chuck Lindsey');
INSERT INTO public.personnel (personnelid, personnel) VALUES (18, 'David Yokel');
INSERT INTO public.personnel (personnelid, personnel) VALUES (19, 'Elaine Blok');
INSERT INTO public.personnel (personnelid, personnel) VALUES (20, 'Elise Kahl');
INSERT INTO public.personnel (personnelid, personnel) VALUES (21, 'Emily Holt');
INSERT INTO public.personnel (personnelid, personnel) VALUES (22, 'Emily Kachergis');
INSERT INTO public.personnel (personnelid, personnel) VALUES (23, 'Eric Geisler');
INSERT INTO public.personnel (personnelid, personnel) VALUES (24, 'Greg Streveler');
INSERT INTO public.personnel (personnelid, personnel) VALUES (25, 'Heath Powers');
INSERT INTO public.personnel (personnelid, personnel) VALUES (26, 'Helen Klein');
INSERT INTO public.personnel (personnelid, personnel) VALUES (27, 'Janet Jorgenson');
INSERT INTO public.personnel (personnelid, personnel) VALUES (28, 'Jason Karl');
INSERT INTO public.personnel (personnelid, personnel) VALUES (29, 'Jeanne Osnas');
INSERT INTO public.personnel (personnelid, personnel) VALUES (30, 'Jen McGrath');
INSERT INTO public.personnel (personnelid, personnel) VALUES (31, 'Jennifer Allen');
INSERT INTO public.personnel (personnelid, personnel) VALUES (32, 'Jennifer Stevens');
INSERT INTO public.personnel (personnelid, personnel) VALUES (33, 'Jess Grunblatt');
INSERT INTO public.personnel (personnelid, personnel) VALUES (34, 'Jessy Ward');
INSERT INTO public.personnel (personnelid, personnel) VALUES (35, 'Jodi McClory');
INSERT INTO public.personnel (personnelid, personnel) VALUES (36, 'Jon Hall');
INSERT INTO public.personnel (personnelid, personnel) VALUES (37, 'Julia Steege');
INSERT INTO public.personnel (personnelid, personnel) VALUES (38, 'Justin Fulkerson');
INSERT INTO public.personnel (personnelid, personnel) VALUES (39, 'Karen Bosworth');
INSERT INTO public.personnel (personnelid, personnel) VALUES (40, 'Keith Boggs');
INSERT INTO public.personnel (personnelid, personnel) VALUES (41, 'Kelly Walton');
INSERT INTO public.personnel (personnelid, personnel) VALUES (42, 'Koren Bosworth');
INSERT INTO public.personnel (personnelid, personnel) VALUES (43, 'Kristin Schroder');
INSERT INTO public.personnel (personnelid, personnel) VALUES (44, 'Linda Geiser');
INSERT INTO public.personnel (personnelid, personnel) VALUES (45, 'Linda Hasselbach');
INSERT INTO public.personnel (personnelid, personnel) VALUES (46, 'Lindsey Flagstad');
INSERT INTO public.personnel (personnelid, personnel) VALUES (47, 'Lisa Stratford');
INSERT INTO public.personnel (personnelid, personnel) VALUES (48, 'Lorene Lynn');
INSERT INTO public.personnel (personnelid, personnel) VALUES (49, 'Mary Booth');
INSERT INTO public.personnel (personnelid, personnel) VALUES (50, 'Matthew Carlson');
INSERT INTO public.personnel (personnelid, personnel) VALUES (51, 'Michael Shephard');
INSERT INTO public.personnel (personnelid, personnel) VALUES (52, 'Michelle Sturdy');
INSERT INTO public.personnel (personnelid, personnel) VALUES (53, 'Monica McTeague');
INSERT INTO public.personnel (personnelid, personnel) VALUES (54, 'Monte Garroutte');
INSERT INTO public.personnel (personnelid, personnel) VALUES (55, 'None');
INSERT INTO public.personnel (personnelid, personnel) VALUES (56, 'Page Spencer');
INSERT INTO public.personnel (personnelid, personnel) VALUES (57, 'Parker Martyn');
INSERT INTO public.personnel (personnelid, personnel) VALUES (58, 'Peter Neitlich');
INSERT INTO public.personnel (personnelid, personnel) VALUES (59, 'Priscilla Lema');
INSERT INTO public.personnel (personnelid, personnel) VALUES (60, 'Rebecca Shaftel');
INSERT INTO public.personnel (personnelid, personnel) VALUES (61, 'Robert Lieberman');
INSERT INTO public.personnel (personnelid, personnel) VALUES (62, 'Robert Lipkin');
INSERT INTO public.personnel (personnelid, personnel) VALUES (63, 'Ruth Gronquist');
INSERT INTO public.personnel (personnelid, personnel) VALUES (64, 'Sara Wesser');
INSERT INTO public.personnel (personnelid, personnel) VALUES (65, 'Sarah Burnett');
INSERT INTO public.personnel (personnelid, personnel) VALUES (66, 'Sarah Lamagna');
INSERT INTO public.personnel (personnelid, personnel) VALUES (67, 'Sarah McCord');
INSERT INTO public.personnel (personnelid, personnel) VALUES (68, 'Sarah Nobel');
INSERT INTO public.personnel (personnelid, personnel) VALUES (69, 'Sarah Nunn');
INSERT INTO public.personnel (personnelid, personnel) VALUES (70, 'Scott Guyer');
INSERT INTO public.personnel (personnelid, personnel) VALUES (71, 'Scott Miller');
INSERT INTO public.personnel (personnelid, personnel) VALUES (72, 'Sean Patrick');
INSERT INTO public.personnel (personnelid, personnel) VALUES (73, 'Sean Salley');
INSERT INTO public.personnel (personnelid, personnel) VALUES (74, 'Shanti Berryman');
INSERT INTO public.personnel (personnelid, personnel) VALUES (75, 'Shawnee Gowan');
INSERT INTO public.personnel (personnelid, personnel) VALUES (76, 'Stephen Talbot');
INSERT INTO public.personnel (personnelid, personnel) VALUES (77, 'Sue Ives');
INSERT INTO public.personnel (personnelid, personnel) VALUES (78, 'Susan Klein');
INSERT INTO public.personnel (personnelid, personnel) VALUES (79, 'Theresa Rzeczycki');
INSERT INTO public.personnel (personnelid, personnel) VALUES (80, 'Timm Nawrocki');
INSERT INTO public.personnel (personnelid, personnel) VALUES (81, 'Tina Boucher');
INSERT INTO public.personnel (personnelid, personnel) VALUES (82, 'Todd Helt');
INSERT INTO public.personnel (personnelid, personnel) VALUES (83, 'Unknown');