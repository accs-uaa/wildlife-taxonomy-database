-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Create citations tables
-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science
-- Last Updated:  2021-06-09
-- Usage: Script should be executed in a MySQL 5.6+ database.
-- Description: "Create citations tables" pushes data for comprehensive citations into the web database server.
-- ---------------------------------------------------------------------------

-- Drop citation tables and create new versions
DROP TABLE IF EXISTS
`comprehensive_citations`;
CREATE TABLE `comprehensive_citations` (
`taxon_source_id` int(4) NOT NULL,
`taxon_source` varchar(50) NOT NULL,
`citation` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Insert comprehensive citations
INSERT INTO `comprehensive_citations` (`taxon_source_id`, `taxon_source`, `citation`) VALUES
(1, 'Gibson et al. 2021', 'Gibson, D. D., L. H. DeCicco, N. R. Hajdukovich, S. C. Heinl, A. J. Lang, R. L. Scher, T. G. Tobish Jr., and J. J. Withrow. 2021. Checklist of Alaska Birds. 27th edition. Alaska Checklist Committee, University of Alaska, Fairbanks, AK, USA.'),
(2, 'Hope et al. 2020', 'Hope, A. G., R. B. Stephens, S. D. Mueller, V. V. Tkach, and J. R. Demboski. 2020. Speciation of North American pygmy shrews (Eulipotyphla: Soricidae) supports spatial but not temporal congruence of diversification among boreal species. Biological Journal of the Linnean Society 129(1):41–60.'),
(3, 'Lausen et al. 2019', 'Lausen, C. L., M. Proctor, D. W. Nagorsen, D. Burles, D. Paetkau, E. Harmston, K. Blejwas, P. Govindarajulu, and L. Friis. 2019. Population genetics reveal <i>Myotis keenii</i> (Keen’s myotis) and <i>Myotis evotis</i> (long-eared myotis) to be a single species. Canadian Journal of Zoology 97(3):267–279.'),
(4, 'Lepage et al. 2014', 'Lepage D, Vaidya G, Guralnick R. 2014. Avibase - A database system for managing and organizing taxonomic concepts. ZooKeys 135:117–135.'),
(5, 'MacDonald 2010', 'MacDonald, S. O. 2010. The Amphibians and Reptiles of Alaska: A Field Handbook. Version 2.0. University of Alaska, Fairbanks, AK, USA.'),
(6, 'Olson 2021', 'Olson, L. E. 2021. Checklist of the Mammals of Alaska. University of Alaska, Fairbanks, AK, USA.'),
(7, 'Vollmer et al. 2019', 'Vollmer N. L., E. Ashe, R. L. Brownell, F. Cipriano, J. G. Mead, R. R. Reeves, M. S. Soldevilla, and R. Williams. 2019. Taxonomic revision of the dolphin genus <i>Lagenorhynchus</i>. Marine Mammal Science 35:957–1057.'),
(8, 'Weksler et al. 2010', 'Weksler, M., H. C. Lanier, and L. E. Olson. 2010. Eastern Beringian biogeography: Historical and spatial genetic structure of singing voles in Alaska. Journal of Biogeography 37(8):1414–1431.'),
(9, 'Woodman 2018', 'Woodman, N. 2018. American recent Eulipotyphla: Nesophontids, solendons, moles, and shrews in the New World. Smithsonian Institution Scholarly Press, Washington, D.C., USA.');

-- Commit transaction
COMMIT;
