create table project
(
    projectid          smallint     not null
        constraint project_pkey
            primary key,
    originatorid       smallint     not null
        constraint project_originatorid_fkey
            references organization,
    funderid           smallint     not null
        constraint project_funderid_fkey
            references organization,
    managerid          smallint     not null
        constraint project_managerid_fkey
            references personnel,
    projectname        varchar(250) not null
        constraint project_projectname_key
            unique,
    projectnameabbr    varchar(20)  not null
        constraint project_projectnameabbr_key
            unique,
    completionid       smallint     not null
        constraint project_completionid_fkey
            references completion,
    yearstart          smallint     not null,
    yearend            smallint,
    projectdescription varchar(255) not null
);

alter table project
    owner to postgres;

INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (1, 2, 5, 81, 'Assessment, Inventory, and Monitoring Pilot for National Petroleum Reserve - Alaska', 'AIM NPR-A', 1, 2012, 2017, 'Establishment and measure of long-term monitoring plots for the BLM Assessment, Inventory, and Monitoring Program in National Petroleum Reserve - Alaska.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (2, 2, 3, 80, 'Colville River Small Mammal Surveys', 'ACCS Colville', 1, 2015, 2015, 'Vegetation plots assessed during small mammal surveys conducted along the Colville River in 2015 by ACCS.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (3, 13, 8, 6, 'Balsam Poplar Communities on the Arctic Slope of Alaska', 'Breen Poplar', 1, 2003, 2006, 'The vegetation associated with balsam poplar stands in the Arctic Foothills of Alaska and the interior boreal forests of Alaska and Yukon was described by Breen (2014) as part of her doctoral dissertation research.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (4, 2, 7, 40, 'Landsat Derived Map and Landcover Descriptions for Gates of the Arctic National Park and Preserve', 'NPS Gates LC', 1, 1998, 1999, 'Ground and aerial plots collected for the creation of a land cover map for Gates of the Arctic National Park and Preserve.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (5, 9, 9, 33, 'North Slope Land Cover', 'North Slope LC', 1, 2008, 2011, 'Ground plots for the creation of a land cover map and plant associations for the North Slope.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (6, 2, 7, 40, 'Plant Associations and Post-fire Succession in Yukon-Charley Rivers National Preserve', 'NPS Yukon-Charley PA', 1, 2003, 2003, 'Ground plots collected to describe plant associations of Yukon-Charley Rivers National Preserve.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (7, 2, 5, 81, 'Fortymile River Region Assessment, Inventory, and Monitoring', 'AIM Fortymile', 1, 2016, 2017, 'Establishment and measure of long-term monitoring plots for the BLM Assessment, Inventory, and Monitoring Program in Fortymile River Region of Eastern Interior Field Office (EIFO).');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (8, 7, 7, 58, 'Lichen Inventory of the National Park Service Arctic Network', 'NPS ARCN Lichen', 1, 1996, 2007, 'Lichen and bryophyte ground plots for describing lichen community structure and its relation to environment in NPS Arctic Network.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (9, 10, 10, 76, 'Plant Associations of the Selawik National Wildlife Refuge', 'USFWS SELA PA', 1, 2005, 2005, 'Vegetation plots collected to classify plant associations of the Selawik National Wildlife Refuge by Stephen Talbot.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (10, 10, 10, 76, 'Selawik National Wildlife Refuge Land Cover', 'USFWS Selawik LC', 1, 1996, 1998, 'Ground plot data collected by USFWS in Selawik National Wildlife Refuge for development of a land cover map.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (11, 10, 10, 61, 'Vegetation Monitoring in Interior Refuges', 'USFWS Interior', 1, 2013, 2014, 'Vegetation plot data collected in Interior Alaska Refuges as part of the Alaska Regional Refuge Inventory and Monitoring Strategic Plan.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (12, 2, 7, 40, 'Land Cover and Plant Associations of Denali National Park and Preserve', 'NPS Denali LC', 1, 1998, 1999, 'Ground plots collected for the creation of a land cover map and plant associations for Denali National Park and Preserve.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (13, 2, 7, 40, 'Alagnak Wild River Land Cover and Plant Associations', 'NPS Alagnak LC', 1, 2010, 2014, 'Ground plots collected for the creation of a land cover map and plant associations for Alagnak National Wild River.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (14, 2, 7, 40, 'Landcover Classes, Ecoregions, and Plant Associations of Katmai National Park and Preserve', 'NPS Katmai LC', 1, 2000, 2003, 'Ground plots collected for the creation of a land cover map and plant associations for Katmai National Park and Preserve.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (15, 2, 7, 40, 'Plant Associations, Vegetation Succession, and Earth Cover Classes of Aniakchak National Monument and Preserve', 'NPS Aniakchak LC', 1, 2009, 2012, 'Ground plots collected for the creation of a land cover map and plant associations for Aniakchak National Monument and Preserve.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (16, 2, 5, 29, 'GMT-2 Assessment, Inventory, and Monitoring', 'AIM GMT-2', 2, 2019, 2020, 'Establishment of vegetation monitoring plots within the Greater Mooses Tooth 2 Oil and Gas Lease Area for BLM Assessment, Inventory, and Monitoring.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (17, 2, 3, 80, 'Bristol Bay Vegetation Cover', 'ACCS Bristol Bay VC', 1, 2019, 2019, 'Vegetation plots with focus towards likely moose habitat for development of species- or aggregate-level foliar cover maps.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (18, 2, 2, 80, 'Vegetation Mapping of North American Beringia', 'ACCS Beringia VC', 2, 2019, null, 'Vegetation plots collected for development of species- or aggregate-level foliar cover maps and other quantitative vegetation maps of North American Beringia.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (19, 2, 7, 40, 'Landcover Classes, Ecological Systems, and Plant Associations of Kenai Fjords National Park', 'NPS Kenai Fjords LC', 1, 2004, 2008, 'Ground and aerial plots collected for the creation of a land cover map and plant associations for Kenai Fjords National Park.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (20, 2, 7, 40, 'Landcover Classes and Plant Associations for Glacier Bay National Park and Preserve', 'NPS Glacier Bay LC', 1, 2001, 2008, 'Ground plots collected for the creation of a land cover map and plant associations for Kenai Fjords National Park.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (21, 2, 7, 81, 'Klondike Gold Rush National Park Land Cover', 'NPS Klondike LC', 1, 2011, 2012, 'Ground plots collected for the creation of a land cover map and plant associations for Klondike Gold Rush National Park.');
INSERT INTO public.project (projectid, originatorid, funderid, managerid, projectname, projectnameabbr, completionid, yearstart, yearend, projectdescription) VALUES (22, 2, 7, 46, 'Landcover Classes of Sitka National Historic Park', 'NPS Sitka LC', 1, 2011, 2013, 'Ground plots collected for the creation of a land cover map for Sitka National Historic Park.');