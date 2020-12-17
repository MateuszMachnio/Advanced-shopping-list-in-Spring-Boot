CREATE DATABASE shopping_list
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

create table day_of_the_week
(
    id       bigint auto_increment
        primary key,
    day_name varchar(15) not null,
    constraint UK_4n2gri203vuks702qjhbxfail
        unique (day_name)
);

INSERT INTO shopping_list.day_of_the_week (id, day_name) VALUES (4, 'czwartek');
INSERT INTO shopping_list.day_of_the_week (id, day_name) VALUES (7, 'niedziela');
INSERT INTO shopping_list.day_of_the_week (id, day_name) VALUES (5, 'piątek');
INSERT INTO shopping_list.day_of_the_week (id, day_name) VALUES (1, 'poniedziałek');
INSERT INTO shopping_list.day_of_the_week (id, day_name) VALUES (6, 'sobota');
INSERT INTO shopping_list.day_of_the_week (id, day_name) VALUES (3, 'środa');
INSERT INTO shopping_list.day_of_the_week (id, day_name) VALUES (2, 'wtorek');

create table meal_names
(
    id        bigint auto_increment
        primary key,
    meal_name varchar(15) not null,
    constraint UK_mqdubsgro0vff0rfu4sumx3dn
        unique (meal_name)
);

INSERT INTO shopping_list.meal_names (id, meal_name) VALUES (2, 'II śniadanie');
INSERT INTO shopping_list.meal_names (id, meal_name) VALUES (5, 'kolacja');
INSERT INTO shopping_list.meal_names (id, meal_name) VALUES (3, 'obiad');
INSERT INTO shopping_list.meal_names (id, meal_name) VALUES (4, 'podwieczorek');
INSERT INTO shopping_list.meal_names (id, meal_name) VALUES (1, 'śniadanie');

create table plan_schedules
(
    id        bigint auto_increment
        primary key,
    day_id    bigint not null,
    meal_id   bigint not null,
    plan_id   bigint not null,
    recipe_id bigint not null,
    constraint FK7lge8s4if8ro49kb4y3om6oi9
        foreign key (meal_id) references meal_names (id),
    constraint FK8ubml4m9h9x0e68qoda15nuft
        foreign key (plan_id) references plans (id),
    constraint FKbfpcs9mgggqe4u9o6mn6tv4jc
        foreign key (day_id) references day_of_the_week (id),
    constraint FKpt006ibj60vkni2qvds89jgch
        foreign key (recipe_id) references recipes (id)
);


create table plans
(
    id          bigint auto_increment
        primary key,
    created_on  datetime(6)  null,
    description varchar(700) not null,
    name        varchar(50)  not null,
    updated_on  datetime(6)  null,
    user_id     bigint       null,
    constraint FKbybv5po44ssyv6svnv062dwrf
        foreign key (user_id) references users (id)
);
create table ingredients
(
    id   bigint auto_increment
        primary key,
    name varchar(255) not null,
    constraint UK_j6tsl15xx76y4kv41yxr4uxab
        unique (name)
);

INSERT INTO shopping_list.ingredients (id, name) VALUES (62, 'amarantus');
INSERT INTO shopping_list.ingredients (id, name) VALUES (356, 'ananas');
INSERT INTO shopping_list.ingredients (id, name) VALUES (177, 'aromat');
INSERT INTO shopping_list.ingredients (id, name) VALUES (134, 'awokado');
INSERT INTO shopping_list.ingredients (id, name) VALUES (179, 'bakalie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (178, 'banan');
INSERT INTO shopping_list.ingredients (id, name) VALUES (183, 'bazylia (przyprawa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (184, 'bazylia świeża');
INSERT INTO shopping_list.ingredients (id, name) VALUES (257, 'bób');
INSERT INTO shopping_list.ingredients (id, name) VALUES (338, 'borówki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (339, 'borówki mrożone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (258, 'brokuły');
INSERT INTO shopping_list.ingredients (id, name) VALUES (259, 'brukselka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (326, 'brzoskwinia');
INSERT INTO shopping_list.ingredients (id, name) VALUES (353, 'budyń waniliowy (proszek)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (63, 'bulgur');
INSERT INTO shopping_list.ingredients (id, name) VALUES (224, 'bulion warzywny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (322, 'bułka grahamka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (324, 'bułka maślana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (323, 'bułka pszenna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (226, 'burak');
INSERT INTO shopping_list.ingredients (id, name) VALUES (25, 'camembert');
INSERT INTO shopping_list.ingredients (id, name) VALUES (331, 'cebula cukrowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (330, 'cebula czerwona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (332, 'cebula szalotka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (329, 'cebula żółta');
INSERT INTO shopping_list.ingredients (id, name) VALUES (26, 'cheddar');
INSERT INTO shopping_list.ingredients (id, name) VALUES (303, 'chleb graham');
INSERT INTO shopping_list.ingredients (id, name) VALUES (304, 'chleb pełnoziarnisty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (305, 'chleb pszenny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (306, 'chleb zwykły');
INSERT INTO shopping_list.ingredients (id, name) VALUES (307, 'chleb żytni');
INSERT INTO shopping_list.ingredients (id, name) VALUES (310, 'chleb żytni jasny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (309, 'chleb żytni pełnoziarnisty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (308, 'chleb żytni razowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (207, 'chrzan');
INSERT INTO shopping_list.ingredients (id, name) VALUES (135, 'ciecierzyca');
INSERT INTO shopping_list.ingredients (id, name) VALUES (118, 'cukier');
INSERT INTO shopping_list.ingredients (id, name) VALUES (122, 'cukier brązowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (123, 'cukier brzozowy (ksylitol)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (125, 'cukier puder');
INSERT INTO shopping_list.ingredients (id, name) VALUES (124, 'cukier trzcinowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (185, 'cukier wanilinowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (121, 'cukinia');
INSERT INTO shopping_list.ingredients (id, name) VALUES (230, 'curry (przyprawa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (119, 'cynamon (przyprawa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (274, 'czarna porzeczka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (275, 'czarnuszka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (333, 'czosnek');
INSERT INTO shopping_list.ingredients (id, name) VALUES (343, 'daktyle');
INSERT INTO shopping_list.ingredients (id, name) VALUES (348, 'daktyle suszone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (186, 'drożdże');
INSERT INTO shopping_list.ingredients (id, name) VALUES (260, 'dynia');
INSERT INTO shopping_list.ingredients (id, name) VALUES (214, 'dżem');
INSERT INTO shopping_list.ingredients (id, name) VALUES (220, 'dżem brzoskwiniowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (219, 'dżem jagodowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (218, 'dżem malinowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (221, 'dżem morelowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (217, 'dżem porzeczkowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (215, 'dżem truskawkowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (216, 'dżem wiśniowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (27, 'edam');
INSERT INTO shopping_list.ingredients (id, name) VALUES (187, 'ekstrakt migdałowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (188, 'ekstrakt waniliowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (136, 'fasola biała');
INSERT INTO shopping_list.ingredients (id, name) VALUES (137, 'fasola czarna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (138, 'fasola czerwona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (139, 'fasola konserwowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (261, 'fasolka szparagowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (28, 'feta');
INSERT INTO shopping_list.ingredients (id, name) VALUES (142, 'frankfurterka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (29, 'gorgonzola');
INSERT INTO shopping_list.ingredients (id, name) VALUES (189, 'gorzka czekolada');
INSERT INTO shopping_list.ingredients (id, name) VALUES (30, 'gouda');
INSERT INTO shopping_list.ingredients (id, name) VALUES (86, 'granola');
INSERT INTO shopping_list.ingredients (id, name) VALUES (120, 'grejpfrut');
INSERT INTO shopping_list.ingredients (id, name) VALUES (262, 'groszek');
INSERT INTO shopping_list.ingredients (id, name) VALUES (140, 'groszek w puszce');
INSERT INTO shopping_list.ingredients (id, name) VALUES (341, 'gruszka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (31, 'halumi');
INSERT INTO shopping_list.ingredients (id, name) VALUES (101, 'hebata zielona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (99, 'herbata czarna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (100, 'herbata ziołowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (357, 'herbatniki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (336, 'indyk filet');
INSERT INTO shopping_list.ingredients (id, name) VALUES (340, 'jabłko');
INSERT INTO shopping_list.ingredients (id, name) VALUES (276, 'jagody');
INSERT INTO shopping_list.ingredients (id, name) VALUES (277, 'jagody mrożone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (1, 'jajka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (263, 'jarmuż');
INSERT INTO shopping_list.ingredients (id, name) VALUES (278, 'jeżyny mrożone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (2, 'jogurt grecki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (3, 'jogurt naturalny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (5, 'jogurt skyr');
INSERT INTO shopping_list.ingredients (id, name) VALUES (4, 'jogurt smakowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (358, 'kajmak');
INSERT INTO shopping_list.ingredients (id, name) VALUES (325, 'kajzerka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (102, 'kakao (proszek)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (264, 'kalafior');
INSERT INTO shopping_list.ingredients (id, name) VALUES (141, 'kapary');
INSERT INTO shopping_list.ingredients (id, name) VALUES (73, 'kasza bulgur');
INSERT INTO shopping_list.ingredients (id, name) VALUES (64, 'kasza gryczana niepalona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (65, 'kasza gryczana prażona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (66, 'kasza jaglana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (68, 'kasza jęczmienna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (67, 'kasza jęczmienna pęczak');
INSERT INTO shopping_list.ingredients (id, name) VALUES (70, 'kasza jęczmienna perłowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (69, 'kasza jęczmienna wiejska');
INSERT INTO shopping_list.ingredients (id, name) VALUES (75, 'kasza kukurydziana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (72, 'kasza kuskus');
INSERT INTO shopping_list.ingredients (id, name) VALUES (74, 'kasza manna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (77, 'kasza owsiana łamana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (76, 'kasza owsiana pęczak');
INSERT INTO shopping_list.ingredients (id, name) VALUES (103, 'kawa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (6, 'kefir');
INSERT INTO shopping_list.ingredients (id, name) VALUES (222, 'ketchup');
INSERT INTO shopping_list.ingredients (id, name) VALUES (352, 'kiełbasa żywiecka sucha');
INSERT INTO shopping_list.ingredients (id, name) VALUES (344, 'kiełki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (345, 'kiwi');
INSERT INTO shopping_list.ingredients (id, name) VALUES (10, 'kluski śląskie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (268, 'kolendra (przyprawa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (267, 'kolendra świeża');
INSERT INTO shopping_list.ingredients (id, name) VALUES (71, 'komosa ryżowa (quinoa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (144, 'koncentrat pomidorowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (286, 'koper');
INSERT INTO shopping_list.ingredients (id, name) VALUES (223, 'kostka bulionowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (146, 'kukurydza');
INSERT INTO shopping_list.ingredients (id, name) VALUES (337, 'kurczak filet');
INSERT INTO shopping_list.ingredients (id, name) VALUES (241, 'laska wanili');
INSERT INTO shopping_list.ingredients (id, name) VALUES (328, 'len mielony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (327, 'len nasiona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (175, 'łosoś filet');
INSERT INTO shopping_list.ingredients (id, name) VALUES (176, 'łosoś wędzony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (320, 'majeranek');
INSERT INTO shopping_list.ingredients (id, name) VALUES (225, 'majonez');
INSERT INTO shopping_list.ingredients (id, name) VALUES (49, 'mąka biała');
INSERT INTO shopping_list.ingredients (id, name) VALUES (50, 'mąka gryczana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (51, 'mąka kokosowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (52, 'mąka kukurydziana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (53, 'mąka orkiszowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (54, 'mąka owsiana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (55, 'mąka pszenna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (56, 'mąka pszenna graham');
INSERT INTO shopping_list.ingredients (id, name) VALUES (57, 'mąka razowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (58, 'mąka ryżowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (365, 'mąka tortowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (59, 'mąka ziemniaczana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (61, 'mąka żytnia');
INSERT INTO shopping_list.ingredients (id, name) VALUES (195, 'makaron farfalle (koradki)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (196, 'makaron fusili (świderki)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (197, 'makaron gnocchi (muszelki)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (198, 'makaron gryczany');
INSERT INTO shopping_list.ingredients (id, name) VALUES (199, 'makaron jajeczny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (200, 'makaron pełnoziarnisty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (201, 'makaron penne (rurka skośna)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (202, 'makaron penne pełnoziarnisty (rurka skośna)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (203, 'makaron ryżowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (204, 'makaron spaghetti');
INSERT INTO shopping_list.ingredients (id, name) VALUES (205, 'makaron spaghetti pełnoziarnisty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (206, 'makaron tagliatelle (wstążki)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (279, 'maliny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (280, 'maliny mrożone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (265, 'marchew');
INSERT INTO shopping_list.ingredients (id, name) VALUES (11, 'margaryna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (32, 'mascarpone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (13, 'maślanka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (12, 'masło');
INSERT INTO shopping_list.ingredients (id, name) VALUES (14, 'masło klarowane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (227, 'masło orzechowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (334, 'mięso mielone z indyka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (335, 'mięso mielone z kurczaka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (270, 'mieszanka sałat');
INSERT INTO shopping_list.ingredients (id, name) VALUES (269, 'mieszanka warzyw');
INSERT INTO shopping_list.ingredients (id, name) VALUES (240, 'migdały');
INSERT INTO shopping_list.ingredients (id, name) VALUES (242, 'migdały płatki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (243, 'migdały słupki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (88, 'mintaj');
INSERT INTO shopping_list.ingredients (id, name) VALUES (126, 'miód');
INSERT INTO shopping_list.ingredients (id, name) VALUES (128, 'miód gryczany');
INSERT INTO shopping_list.ingredients (id, name) VALUES (127, 'miód lipowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (130, 'miód rzepakowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (131, 'miód spadziowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (129, 'miód wielokwiatowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (15, 'mleko');
INSERT INTO shopping_list.ingredients (id, name) VALUES (18, 'mleko 1,5%');
INSERT INTO shopping_list.ingredients (id, name) VALUES (16, 'mleko 2%');
INSERT INTO shopping_list.ingredients (id, name) VALUES (17, 'mleko 3,2%');
INSERT INTO shopping_list.ingredients (id, name) VALUES (19, 'mleko kokosowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (190, 'mleko kondensowane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (20, 'mleko migdałowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (21, 'mleko owsiane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (22, 'mleko ryżowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (23, 'mleko sojowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (33, 'mozarella');
INSERT INTO shopping_list.ingredients (id, name) VALUES (87, 'musli');
INSERT INTO shopping_list.ingredients (id, name) VALUES (89, 'musli z orzechami');
INSERT INTO shopping_list.ingredients (id, name) VALUES (228, 'musztarda');
INSERT INTO shopping_list.ingredients (id, name) VALUES (109, 'napój energetyczny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (110, 'napój gazowany');
INSERT INTO shopping_list.ingredients (id, name) VALUES (244, 'nasiona Chia');
INSERT INTO shopping_list.ingredients (id, name) VALUES (7, 'natka pietruszki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (290, 'ocet balsamiczny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (291, 'ocet jabłkowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (292, 'ocet ryżowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (293, 'ocet spirytusowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (294, 'ocet winny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (150, 'ogórek gruntowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (147, 'ogórek kiszony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (148, 'ogórek konserwowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (149, 'ogórek małosolny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (151, 'ogórek szklarniowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (295, 'olej kokosowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (296, 'olej lniany');
INSERT INTO shopping_list.ingredients (id, name) VALUES (297, 'olej rzepakowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (298, 'olej sezamowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (299, 'olej słonecznikowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (300, 'olej z pestek winogron');
INSERT INTO shopping_list.ingredients (id, name) VALUES (302, 'oliwa z oliwek');
INSERT INTO shopping_list.ingredients (id, name) VALUES (156, 'oliwki czarne');
INSERT INTO shopping_list.ingredients (id, name) VALUES (158, 'oliwki czarne marynowane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (157, 'oliwki czarne w puszce');
INSERT INTO shopping_list.ingredients (id, name) VALUES (153, 'oliwki zielone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (155, 'oliwki zielone marynowane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (154, 'oliwki zielone w puszce');
INSERT INTO shopping_list.ingredients (id, name) VALUES (349, 'oregano (przyprawa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (246, 'orzechy arachidowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (247, 'orzechy brazylijskie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (248, 'orzechy laskowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (245, 'orzechy nerkowca');
INSERT INTO shopping_list.ingredients (id, name) VALUES (249, 'orzechy włoskie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (250, 'orzeszki piniowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (90, 'otręby owiane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (211, 'papryka chili');
INSERT INTO shopping_list.ingredients (id, name) VALUES (209, 'papryka czerwona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (213, 'papryka ostra (przyprawa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (212, 'papryka słodka (przyprawa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (208, 'papryka zielona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (210, 'papryka żułta');
INSERT INTO shopping_list.ingredients (id, name) VALUES (34, 'parmezan');
INSERT INTO shopping_list.ingredients (id, name) VALUES (229, 'pasta curry');
INSERT INTO shopping_list.ingredients (id, name) VALUES (251, 'pestki dyni');
INSERT INTO shopping_list.ingredients (id, name) VALUES (231, 'pesto');
INSERT INTO shopping_list.ingredients (id, name) VALUES (354, 'pieczarki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (313, 'pieprz biały');
INSERT INTO shopping_list.ingredients (id, name) VALUES (314, 'pieprz biały mielony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (312, 'pieprz czarny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (315, 'pieprz czarny mielony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (317, 'pieprz kolorowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (316, 'pieprz kolorowy mielony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (8, 'pietruszka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (9, 'pietruszka suszona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (252, 'pistacje');
INSERT INTO shopping_list.ingredients (id, name) VALUES (91, 'płatki drożdżowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (92, 'płatki gryczane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (93, 'płatki jaglane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (94, 'płatki orkiszowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (95, 'płatki owsiane');
INSERT INTO shopping_list.ingredients (id, name) VALUES (96, 'płatki quinoa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (97, 'płatki ryżowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (98, 'płatki żytnie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (159, 'poimdory suszone w oleju');
INSERT INTO shopping_list.ingredients (id, name) VALUES (79, 'polędwiczka wieprzowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (78, 'polenta');
INSERT INTO shopping_list.ingredients (id, name) VALUES (143, 'pomarańcza');
INSERT INTO shopping_list.ingredients (id, name) VALUES (165, 'pomidory daktylowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (164, 'pomidory koktajlowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (160, 'pomidory krojone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (169, 'pomidory malinowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (167, 'pomidory paprykowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (166, 'pomidory rzymskie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (161, 'pomidory suszone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (162, 'pomidory suszone w zalewie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (163, 'pomidory w całości');
INSERT INTO shopping_list.ingredients (id, name) VALUES (168, 'pomidory zielone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (170, 'pomidory żółte');
INSERT INTO shopping_list.ingredients (id, name) VALUES (191, 'proszek do pieczenia');
INSERT INTO shopping_list.ingredients (id, name) VALUES (145, 'przecier pomidorowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (182, 'przyprawa do ryb');
INSERT INTO shopping_list.ingredients (id, name) VALUES (181, 'przyprawa do ziemniaków');
INSERT INTO shopping_list.ingredients (id, name) VALUES (180, 'przyprawa włoska');
INSERT INTO shopping_list.ingredients (id, name) VALUES (35, 'ricotta');
INSERT INTO shopping_list.ingredients (id, name) VALUES (318, 'rozmaryn');
INSERT INTO shopping_list.ingredients (id, name) VALUES (266, 'rukola');
INSERT INTO shopping_list.ingredients (id, name) VALUES (80, 'ryż basmati');
INSERT INTO shopping_list.ingredients (id, name) VALUES (81, 'ryż biały');
INSERT INTO shopping_list.ingredients (id, name) VALUES (82, 'ryż brązowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (83, 'ryż dziki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (84, 'ryż jaśminowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (152, 'rzodkiewka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (355, 'salami');
INSERT INTO shopping_list.ingredients (id, name) VALUES (232, 'salsa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (287, 'sałata');
INSERT INTO shopping_list.ingredients (id, name) VALUES (288, 'sałata lodowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (289, 'sałata masłowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (342, 'schab');
INSERT INTO shopping_list.ingredients (id, name) VALUES (39, 'ser Camembert');
INSERT INTO shopping_list.ingredients (id, name) VALUES (37, 'ser feta');
INSERT INTO shopping_list.ingredients (id, name) VALUES (36, 'ser kozi');
INSERT INTO shopping_list.ingredients (id, name) VALUES (40, 'ser mozzarella');
INSERT INTO shopping_list.ingredients (id, name) VALUES (38, 'ser pleśniowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (41, 'ser topiony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (42, 'ser żółty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (43, 'ser żółty tarty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (44, 'serek kanapkowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (45, 'serek wiejski');
INSERT INTO shopping_list.ingredients (id, name) VALUES (253, 'sezam (nasiona)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (254, 'siemie lnianie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (192, 'skrobia kukurydziana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (193, 'skrobia ziemniaczana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (281, 'śliwki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (24, 'śmietana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (359, 'śmietana 12%');
INSERT INTO shopping_list.ingredients (id, name) VALUES (360, 'śmietana 18%');
INSERT INTO shopping_list.ingredients (id, name) VALUES (361, 'śmietana 30%');
INSERT INTO shopping_list.ingredients (id, name) VALUES (362, 'śmietana 36%');
INSERT INTO shopping_list.ingredients (id, name) VALUES (85, 'soczewica');
INSERT INTO shopping_list.ingredients (id, name) VALUES (171, 'soczewica konserwowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (194, 'soda oczyszczona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (233, 'sok cytrynowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (234, 'sok limonkowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (111, 'sok owocowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (112, 'sok z cytryny');
INSERT INTO shopping_list.ingredients (id, name) VALUES (321, 'sól');
INSERT INTO shopping_list.ingredients (id, name) VALUES (235, 'sos BBQ');
INSERT INTO shopping_list.ingredients (id, name) VALUES (236, 'sos sojowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (237, 'sos Worcestshire');
INSERT INTO shopping_list.ingredients (id, name) VALUES (238, 'sriracha');
INSERT INTO shopping_list.ingredients (id, name) VALUES (132, 'syrop klonowy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (133, 'syrop z agawy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (311, 'szczypiorek');
INSERT INTO shopping_list.ingredients (id, name) VALUES (272, 'szpinak');
INSERT INTO shopping_list.ingredients (id, name) VALUES (273, 'szpinak mrożony');
INSERT INTO shopping_list.ingredients (id, name) VALUES (350, 'szynka z indyka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (351, 'szynka z kurczaka');
INSERT INTO shopping_list.ingredients (id, name) VALUES (239, 'tahini (pasta sezamowa)');
INSERT INTO shopping_list.ingredients (id, name) VALUES (282, 'truskawki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (283, 'truskawki mrożone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (172, 'tuńczyk');
INSERT INTO shopping_list.ingredients (id, name) VALUES (173, 'tuńczyk w oleju');
INSERT INTO shopping_list.ingredients (id, name) VALUES (174, 'tuńczyk w sosie własnym');
INSERT INTO shopping_list.ingredients (id, name) VALUES (46, 'twaróg chudy');
INSERT INTO shopping_list.ingredients (id, name) VALUES (47, 'twaróg półtłusty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (48, 'twaróg tłusty');
INSERT INTO shopping_list.ingredients (id, name) VALUES (319, 'tymianek');
INSERT INTO shopping_list.ingredients (id, name) VALUES (108, 'wafle ryżowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (346, 'wanilia ekstrakt');
INSERT INTO shopping_list.ingredients (id, name) VALUES (347, 'wanilia laska');
INSERT INTO shopping_list.ingredients (id, name) VALUES (271, 'warzywa mrożone wiosenne');
INSERT INTO shopping_list.ingredients (id, name) VALUES (301, 'winogrona');
INSERT INTO shopping_list.ingredients (id, name) VALUES (255, 'wiórki kokosowe');
INSERT INTO shopping_list.ingredients (id, name) VALUES (284, 'wiśnie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (285, 'wiśnie mrożone');
INSERT INTO shopping_list.ingredients (id, name) VALUES (113, 'woda gazowana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (115, 'woda kokosowa');
INSERT INTO shopping_list.ingredients (id, name) VALUES (116, 'woda mineralna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (114, 'woda niegazowana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (117, 'woda źródlana');
INSERT INTO shopping_list.ingredients (id, name) VALUES (363, 'żelatyna');
INSERT INTO shopping_list.ingredients (id, name) VALUES (256, 'ziarna słonecznika');
INSERT INTO shopping_list.ingredients (id, name) VALUES (60, 'ziemniaki');
INSERT INTO shopping_list.ingredients (id, name) VALUES (104, 'zioła do drobiu');
INSERT INTO shopping_list.ingredients (id, name) VALUES (107, 'zioła do sałatek');
INSERT INTO shopping_list.ingredients (id, name) VALUES (105, 'zioła do schabu');
INSERT INTO shopping_list.ingredients (id, name) VALUES (106, 'zioła prowansalskie');
INSERT INTO shopping_list.ingredients (id, name) VALUES (364, 'żółtko jajka');

create table set_of_ingredients_with_quantities
(
    id bigint auto_increment
        primary key
);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (1);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (2);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (3);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (4);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (5);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (6);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (7);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (8);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (9);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (10);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (11);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (12);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (13);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (14);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (15);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (16);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (17);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (18);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (19);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (20);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (21);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (22);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (23);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (24);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (25);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (26);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (27);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (28);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (29);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (30);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (31);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (32);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (33);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (34);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (35);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (36);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (37);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (38);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (39);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (40);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (41);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (42);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (43);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (44);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (45);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (46);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (47);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (48);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (49);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (50);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (51);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (52);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (53);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (54);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (55);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (56);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (57);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (58);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (59);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (60);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (61);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (62);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (63);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (64);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (65);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (66);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (67);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (68);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (69);
INSERT INTO shopping_list.set_of_ingredients_with_quantities (id) VALUES (70);
create table shopping_lists
(
    id bigint auto_increment
        primary key
);

create table ingredients_with_quantities
(
    id                        bigint auto_increment
        primary key,
    quantity                  int    not null,
    ingredient_id             bigint not null,
    shopping_list_id          bigint null,
    set_of_ingr_with_quant_id bigint null,
    constraint FK4msrngts67ix0au75psk2sq27
        foreign key (shopping_list_id) references shopping_lists (id),
    constraint FK6ced2vit5cq3cpyc543a0jc08
        foreign key (set_of_ingr_with_quant_id) references set_of_ingredients_with_quantities (id),
    constraint FKb2k3htuhfjbk9670amj5xpg72
        foreign key (ingredient_id) references ingredients (id)
);

INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (1, 60, 303, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (2, 5, 12, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (3, 60, 46, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (4, 50, 3, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (5, 5, 296, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (6, 60, 152, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (7, 50, 150, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (8, 5, 311, null, 1);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (9, 120, 326, null, 2);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (10, 12, 245, null, 2);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (11, 150, 282, null, 2);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (12, 5, 327, null, 2);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (13, 220, 114, null, 2);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (14, 25, 329, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (15, 4, 333, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (16, 130, 334, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (17, 50, 205, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (18, 6, 290, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (19, 10, 302, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (20, 200, 160, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (21, 3, 183, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (22, 2, 212, null, 3);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (23, 65, 338, null, 4);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (24, 150, 5, null, 4);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (25, 72, 279, null, 4);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (26, 30, 310, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (27, 5, 12, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (28, 5, 287, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (29, 20, 351, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (30, 70, 301, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (31, 60, 288, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (32, 130, 163, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (33, 65, 209, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (34, 25, 329, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (35, 5, 275, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (36, 5, 290, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (37, 5, 302, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (38, 5, 129, null, 5);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (39, 60, 303, null, 6);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (40, 60, 46, null, 6);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (41, 6, 184, null, 6);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (42, 5, 333, null, 6);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (43, 10, 302, null, 6);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (44, 9, 153, null, 6);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (45, 130, 163, null, 6);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (46, 30, 303, null, 7);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (47, 50, 1, null, 7);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (48, 10, 3, null, 7);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (49, 2, 212, null, 7);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (50, 5, 43, null, 7);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (51, 2, 311, null, 7);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (52, 50, 338, null, 7);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (53, 100, 1, null, 8);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (54, 5, 297, null, 8);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (55, 220, 13, null, 8);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (56, 75, 3, null, 8);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (57, 150, 150, null, 8);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (58, 280, 60, null, 8);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (59, 150, 3, null, 9);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (60, 30, 89, null, 9);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (61, 60, 304, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (62, 5, 12, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (63, 70, 46, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (64, 4, 333, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (65, 25, 3, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (66, 100, 150, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (67, 3, 302, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (68, 60, 152, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (69, 5, 112, null, 10);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (70, 60, 309, null, 11);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (71, 5, 12, null, 11);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (72, 10, 287, null, 11);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (73, 60, 1, null, 11);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (74, 16, 352, null, 11);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (75, 65, 209, null, 11);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (76, 100, 178, null, 12);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (77, 100, 5, null, 12);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (78, 100, 143, null, 12);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (79, 4, 333, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (80, 120, 337, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (81, 7, 126, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (82, 10, 302, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (83, 130, 163, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (84, 3, 180, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (85, 30, 287, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (86, 10, 112, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (87, 60, 72, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (88, 6, 7, null, 13);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (89, 25, 3, null, 14);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (90, 60, 345, null, 14);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (91, 75, 282, null, 14);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (92, 90, 279, null, 14);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (93, 5, 12, null, 14);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (94, 4, 249, null, 14);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (95, 7, 90, null, 14);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (96, 60, 310, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (97, 7, 161, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (98, 50, 134, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (99, 3, 333, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (100, 60, 138, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (101, 5, 302, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (102, 60, 163, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (103, 3, 349, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (104, 3, 212, null, 15);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (105, 60, 307, null, 16);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (106, 5, 12, null, 16);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (107, 120, 164, null, 16);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (108, 60, 46, null, 16);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (109, 50, 134, null, 16);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (110, 30, 350, null, 16);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (111, 5, 112, null, 16);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (112, 150, 326, null, 17);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (113, 18, 245, null, 17);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (114, 75, 282, null, 17);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (115, 90, 10, null, 18);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (116, 50, 329, null, 18);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (117, 10, 302, null, 18);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (118, 60, 342, null, 18);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (119, 13, 193, null, 18);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (120, 2, 212, null, 18);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (121, 200, 271, null, 18);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (122, 25, 348, null, 19);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (123, 5, 102, null, 19);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (124, 3, 327, null, 19);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (125, 8, 249, null, 19);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (126, 5, 255, null, 19);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (127, 10, 114, null, 19);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (128, 110, 142, null, 20);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (129, 60, 303, null, 20);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (130, 10, 344, null, 20);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (131, 5, 228, null, 20);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (132, 130, 163, null, 20);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (133, 10, 287, null, 20);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (134, 10, 242, null, 21);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (135, 220, 16, null, 21);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (136, 40, 95, null, 21);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (137, 75, 282, null, 21);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (138, 30, 309, null, 22);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (139, 5, 12, null, 22);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (140, 5, 287, null, 22);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (141, 20, 350, null, 22);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (142, 50, 147, null, 22);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (143, 160, 340, null, 22);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (144, 5, 333, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (145, 120, 337, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (146, 6, 286, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (147, 6, 126, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (148, 5, 228, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (149, 8, 302, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (150, 10, 112, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (151, 50, 73, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (152, 80, 340, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (153, 100, 265, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (154, 5, 296, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (155, 5, 112, null, 23);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (156, 60, 310, null, 24);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (157, 20, 217, null, 24);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (158, 150, 45, null, 24);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (159, 25, 330, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (160, 100, 150, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (161, 5, 302, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (162, 10, 153, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (163, 50, 209, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (164, 150, 163, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (165, 2, 183, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (166, 60, 288, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (167, 30, 37, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (168, 2, 106, null, 25);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (169, 110, 337, null, 26);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (170, 50, 201, null, 26);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (171, 5, 296, null, 26);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (172, 5, 302, null, 26);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (173, 28, 162, null, 26);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (174, 25, 266, null, 26);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (175, 3, 104, null, 26);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (176, 20, 353, null, 27);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (177, 5, 118, null, 27);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (178, 60, 279, null, 27);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (179, 140, 16, null, 27);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (180, 60, 303, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (181, 5, 12, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (182, 10, 287, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (183, 15, 42, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (184, 20, 351, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (185, 25, 329, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (186, 5, 302, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (187, 180, 163, null, 28);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (188, 60, 310, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (189, 1, 112, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (190, 5, 12, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (191, 40, 134, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (192, 55, 1, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (193, 25, 3, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (194, 2, 212, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (195, 5, 311, null, 29);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (196, 100, 178, null, 30);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (197, 100, 5, null, 30);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (198, 12, 249, null, 30);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (199, 100, 226, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (200, 25, 329, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (201, 3, 112, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (202, 4, 333, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (203, 140, 336, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (204, 10, 302, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (205, 2, 183, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (206, 1, 349, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (207, 1, 318, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (208, 1, 319, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (209, 50, 68, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (210, 5, 296, null, 31);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (211, 5, 126, null, 32);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (212, 60, 46, null, 32);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (213, 100, 282, null, 32);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (214, 20, 108, null, 32);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (215, 60, 303, null, 33);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (216, 30, 163, null, 33);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (217, 2, 183, null, 33);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (218, 40, 39, null, 33);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (219, 120, 341, null, 33);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (220, 60, 339, null, 34);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (221, 60, 280, null, 34);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (222, 10, 242, null, 34);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (223, 5, 126, null, 34);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (224, 220, 15, null, 34);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (225, 30, 95, null, 34);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (226, 60, 308, null, 35);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (227, 5, 12, null, 35);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (228, 40, 209, null, 35);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (229, 10, 287, null, 35);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (230, 20, 351, null, 35);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (231, 150, 326, null, 36);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (232, 18, 245, null, 36);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (233, 75, 282, null, 36);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (234, 60, 303, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (235, 20, 329, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (236, 100, 150, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (237, 5, 302, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (238, 5, 153, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (239, 200, 163, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (240, 3, 183, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (241, 15, 288, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (242, 30, 37, null, 37);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (243, 18, 348, null, 38);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (244, 50, 3, null, 38);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (245, 30, 66, null, 38);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (246, 60, 345, null, 38);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (247, 120, 15, null, 38);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (248, 10, 244, null, 38);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (249, 15, 287, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (250, 28, 161, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (251, 50, 209, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (252, 45, 152, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (253, 20, 37, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (254, 3, 311, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (255, 2, 107, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (256, 5, 302, null, 39);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (257, 3, 286, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (258, 160, 175, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (259, 2, 183, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (260, 5, 182, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (261, 10, 112, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (262, 2, 106, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (263, 5, 181, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (264, 300, 60, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (265, 25, 329, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (266, 80, 150, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (267, 80, 147, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (268, 5, 302, null, 40);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (269, 70, 338, null, 41);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (270, 16, 249, null, 41);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (271, 150, 282, null, 41);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (272, 60, 310, null, 42);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (273, 5, 12, null, 42);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (274, 10, 287, null, 42);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (275, 40, 350, null, 42);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (276, 30, 42, null, 42);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (277, 130, 163, null, 42);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (278, 5, 311, null, 42);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (279, 10, 217, null, 43);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (280, 150, 5, null, 43);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (281, 5, 95, null, 43);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (282, 75, 282, null, 43);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (283, 5, 333, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (284, 50, 3, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (285, 8, 286, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (286, 60, 152, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (287, 40, 289, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (288, 10, 311, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (289, 10, 297, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (290, 3, 212, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (291, 3, 213, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (292, 120, 79, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (293, 50, 80, null, 44);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (294, 50, 1, null, 45);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (295, 2, 241, null, 45);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (296, 36, 279, null, 45);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (297, 10, 126, null, 45);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (298, 70, 46, null, 45);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (299, 30, 306, null, 46);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (300, 70, 134, null, 46);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (301, 6, 7, null, 46);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (302, 120, 164, null, 46);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (303, 3, 112, null, 46);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (304, 90, 174, null, 46);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (305, 100, 1, null, 47);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (306, 5, 12, null, 47);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (307, 10, 311, null, 47);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (308, 60, 308, null, 47);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (309, 30, 163, null, 47);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (310, 40, 350, null, 47);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (311, 150, 3, null, 48);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (312, 30, 345, null, 48);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (313, 20, 89, null, 48);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (314, 15, 244, null, 49);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (315, 60, 279, null, 49);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (316, 200, 15, null, 49);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (317, 30, 95, null, 49);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (318, 5, 132, null, 49);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (319, 30, 303, null, 50);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (320, 5, 12, null, 50);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (321, 40, 209, null, 50);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (322, 15, 42, null, 50);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (323, 20, 350, null, 50);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (324, 70, 282, null, 50);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (325, 50, 200, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (326, 20, 37, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (327, 90, 174, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (328, 15, 330, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (329, 10, 297, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (330, 12, 153, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (331, 20, 266, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (332, 200, 120, null, 51);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (333, 30, 303, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (334, 50, 270, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (335, 50, 1, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (336, 40, 351, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (337, 10, 43, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (338, 3, 184, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (339, 200, 163, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (340, 50, 330, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (341, 3, 333, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (342, 75, 3, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (343, 3, 349, null, 52);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (344, 200, 224, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (345, 25, 329, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (346, 150, 121, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (347, 5, 333, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (348, 140, 88, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (349, 10, 296, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (350, 10, 302, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (351, 65, 209, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (352, 3, 106, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (353, 60, 82, null, 53);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (354, 60, 310, null, 54);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (355, 5, 12, null, 54);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (356, 10, 287, null, 54);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (357, 50, 149, null, 54);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (358, 20, 351, null, 54);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (359, 60, 163, null, 54);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (360, 75, 45, null, 54);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (361, 140, 178, null, 55);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (362, 5, 102, null, 55);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (363, 5, 328, null, 55);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (364, 5, 126, null, 55);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (365, 20, 248, null, 55);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (366, 30, 95, null, 55);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (367, 30, 310, null, 56);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (368, 5, 12, null, 56);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (369, 5, 287, null, 56);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (370, 20, 350, null, 56);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (371, 80, 326, null, 56);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (372, 15, 3, null, 56);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (373, 160, 163, null, 56);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (374, 120, 326, null, 57);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (375, 75, 45, null, 57);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (376, 10, 253, null, 57);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (377, 220, 340, null, 58);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (378, 20, 245, null, 58);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (379, 100, 258, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (380, 50, 66, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (381, 2, 9, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (382, 3, 333, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (383, 3, 268, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (384, 8, 286, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (385, 150, 175, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (386, 8, 126, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (387, 5, 302, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (388, 5, 112, null, 59);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (389, 60, 303, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (390, 10, 287, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (391, 5, 12, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (392, 50, 147, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (393, 60, 174, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (394, 25, 329, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (395, 5, 302, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (396, 25, 3, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (397, 3, 112, null, 60);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (398, 70, 322, null, 61);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (399, 5, 12, null, 61);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (400, 10, 287, null, 61);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (401, 20, 351, null, 61);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (402, 50, 150, null, 61);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (403, 60, 1, null, 61);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (404, 60, 163, null, 61);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (405, 25, 338, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (406, 5, 124, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (407, 20, 1, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (408, 25, 56, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (409, 30, 15, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (410, 4, 249, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (411, 3, 191, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (412, 2, 119, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (413, 1, 346, null, 62);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (414, 60, 309, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (415, 4, 333, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (416, 3, 243, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (417, 3, 290, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (418, 5, 296, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (419, 80, 164, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (420, 3, 184, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (421, 2, 349, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (422, 30, 40, null, 63);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (423, 3, 230, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (424, 130, 337, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (425, 10, 302, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (426, 50, 3, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (427, 25, 287, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (428, 5, 112, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (429, 5, 12, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (430, 300, 60, null, 64);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (431, 40, 200, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (432, 20, 139, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (433, 5, 302, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (434, 9, 158, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (435, 100, 163, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (436, 10, 145, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (437, 15, 37, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (438, 40, 174, null, 65);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (439, 500, 56, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (440, 50, 186, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (441, 30, 302, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (442, 275, 114, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (443, 10, 333, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (444, 15, 12, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (445, 250, 145, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (446, 5, 349, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (447, 5, 183, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (448, 300, 40, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (449, 150, 43, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (450, 200, 354, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (451, 80, 355, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (452, 200, 356, null, 66);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (453, 250, 1, null, 67);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (454, 150, 163, null, 67);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (455, 100, 329, null, 67);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (456, 30, 12, null, 67);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (457, 150, 323, null, 67);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (458, 510, 55, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (459, 300, 12, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (460, 300, 1, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (461, 500, 118, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (462, 20, 102, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (463, 10, 191, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (464, 1000, 47, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (465, 50, 353, null, 68);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (466, 600, 357, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (467, 500, 358, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (468, 500, 362, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (469, 500, 15, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (470, 60, 364, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (471, 30, 118, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (472, 85, 55, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (473, 200, 12, null, 69);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (474, 200, 1, null, 70);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (475, 300, 118, null, 70);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (476, 300, 265, null, 70);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (477, 250, 297, null, 70);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (478, 510, 55, null, 70);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (479, 5, 119, null, 70);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (480, 5, 194, null, 70);
INSERT INTO shopping_list.ingredients_with_quantities (id, quantity, ingredient_id, shopping_list_id, set_of_ingr_with_quant_id) VALUES (481, 10, 191, null, 70);




create table recipes
(
    id                        bigint auto_increment
        primary key,
    created_on                datetime(6)   null,
    description               varchar(255)  null,
    name                      varchar(60)   not null,
    number_of_servings        int           not null,
    original                  bit           null,
    preparation               varchar(1000) not null,
    preparation_time          int           not null,
    updated_on                datetime(6)   null,
    set_of_ingr_with_quant_id bigint        not null,
    constraint UK_f6uwt9846wblckm6dtdp8xjyu
        unique (set_of_ingr_with_quant_id),
    constraint FK87coij7vpoql2w6uohvism2bh
        foreign key (set_of_ingr_with_quant_id) references set_of_ingredients_with_quantities (id)
);

INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (1, '2020-12-11 17:53:20.480916', 'pyszne dietetyczne śniadanie', 'Chleb graham z twarożkiem i rzodkiewką', 1, true, 'Twaróg wymieszać z jogurtem, olejem, i drobno pokrojoną rzodkiewką. Przyprawić solą i pieprzem. Ułożyć na kromkach posmarowanych masłem. Na wierzch ułożyć plastry ogórka i posypać pokrojonym szczypiorkiem.', 10, null, 1);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (2, '2020-12-11 19:29:00.907531', '', 'Koktajl brzoskwiniowo-truskawkowy', 1, true, 'Owoce umyć. Brzoskwinię pokroić na kawałki. Wszystkie składniki przełożyć do wysokiego naczynia i zmiksować na gładką masę.', 5, null, 2);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (3, '2020-12-11 19:31:32.027763', '', 'Spaghetti bolognese', 1, true, 'Cebulę posiekać i podsmażyć na oliwie z oliwek. Dodać mięso i przyprawić papryką słodką, solą i pieprzem. Smażyć około 5 minut. Następnie dodać pomidory, przeciśnięty przez praskę czosnek, bazylię i ocet balsamiczny. Dusić pod przykryciem przez około 15 minut. Ugotować makaron i połączyć z przygotowanym sosem.', 40, null, 3);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (4, '2020-12-11 19:34:14.472114', '', 'Owoce leśne z jogurtem naturalnym', 1, true, 'Owoce umyć. Wszystkie składniki połączyć.', 5, null, 4);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (5, '2020-12-11 19:47:15.844253', 'bardzo pożywne śniadanie', 'Kanapki z szynką, sałatka warzywna z czarnuszką, owoc', 1, true, '1. Chleb posmarować masłem. Obłożyć szynką i umytą sałatą. \n2. Sałatę lodową, pomidora i paprykę umyć. Sałatę porwać na kawałki. Pomidora, paprykę i cebulę pokroić. Wszystkie warzywa wymieszać z sosem przygotowanym z oliwy, octu balsamicznego, miodu i pieprzu. Na wierzch posypać czarnuszką. \n3. Podawać z umytymi winogronami', 20, null, 5);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (6, '2020-12-11 20:20:11.721791', '', 'Bruschetta z pomidorem i oliwkami', 1, true, 'Pomidora i bazylię umyć. Pomidora pokroić w małą kostkę i wymieszać z bazylią. Kromki chleba opiec na grillu, jeszcze ciepłe natrzeć oliwą z przeciśniętym przez praskę czosnkiem i lekko posolić. Na każdej grzance ułożyć porcję serka, pomidorów, pokrojonych oliwek i przyprawić pieprzem. Podawać, gdy pieczywo jest jeszcze ciepłe.', 15, null, 6);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (7, '2020-12-11 20:26:24.192871', '', 'Kanapka z pastą jajeczną i szczypiorkiem, owoc', 1, true, 'Jajko ugotować i pokroić w drobną kostkę. Dodać starty ser, jogurt naturalny i szczypiorek. Doprawić papryką słodką, solą i pieprzem. Wymieszać. Gotową pastę położyć na kromkę chleba. Podawać z owocem, np. borówkami.', 10, null, 7);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (8, '2020-12-11 20:33:03.762552', '', 'Jajka sadzone z ziemniakami, mizerią i maślanką', 1, true, '1. Ziemniaki obrać, umyć i ugotować do miękkości. \n2. Jajka rozbić i wrzucić na rozgrzany olej. Przyprawić solą i pieprzem. Smażyć na małym ogniu do momentu aż się zetną. \n3. Ogórki umyć, obrać i pokroić w plasterki. Dodać jogurt i przyprawić solą i pieprzem. \n4. Podawać z maślanką.', 20, null, 8);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (9, '2020-12-11 20:35:27.715919', 'bardzo szybki deser', 'Musli z orzechami', 1, true, 'Przełożyć składniki do miski i wymieszać.', 2, null, 9);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (10, '2020-12-11 20:43:41.737978', '', 'Kanapka z twarogiem, sałatka z rzodkiewką i ogórki', 1, true, '1. Rzodkiewki oczyścić i pokroić w ćwiartki. Ogórka umyć, obrać i pokroić w półplasterki. Warzywa przełożyć do miski. Jogurt wymieszać z sokiem z cytryny i czosnkiem przeciśniętym przez praskę. Dodać do warzyw i wymieszać. Skropić oliwą. \n2. Kromki posmarować masłem i położyć plastry twarogu.', 15, null, 10);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (11, '2020-12-11 20:48:11.797064', '', 'Kanapka z szynką, sałatą i papryką, jajko na miękko', 1, true, 'Jajko ugotować na miękko. Chleb posmarować masłem, obłożyć sałatą, kiełbasą i papryką pokrojoną w paski.', 10, null, 11);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (12, '2020-12-11 20:53:05.769855', '', 'Koktajl pomarańczowo-bananowy', 1, true, 'Składniki przełożyć do wysokiego naczynia i zmiksować blenderem.', 5, null, 12);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (13, '2020-12-11 21:06:24.917728', '!!! Mięso trzeba wcześniej przygotować !!!', 'Aromatyczny filet z kurczaka na sałacie z kaszą kuskus', 1, true, '1. Zrobić marynatę: wymieszać oliwę, miód, sok z cytryny, posiekany czosnek i przyprawy. Mięso umyć, osuszyć i natrzeć marynatą (przygotować kilka godzin wcześniej lub na noc). \n2. Zamarynowane mięso włożyć do piekarnika i piec około 20-25 min. \n3. Kaszę zalać wrzącą wodą nieco ponad jej poziom. Przykryć i odstawić na 2-3 min. Gotową kaszę wymieszać i posypać posiekaną natką. \n4. Sałatę umyć i porwać na kawałki. Ułożyć na talerzu. Dookoła sałaty ułożyć pokrojonego w ósemki pomidora. Na wierzchu położyć upieczonego kurczaka.', 30, null, 13);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (14, '2020-12-11 21:14:10.843594', 'przepyszny deser', 'Crumble owocowe z otrębami i jogurtem', 1, true, 'Owoce umyć i osuszyć. Kiwi obrać ze skórki. Owoce pokroić na kawałki i wymieszać. Ułożyć w małym żaroodpornym naczyniu. Otręby wymieszać z zimnym masłem i posiekanym orzechem zagniatając jak kruszonkę. Wyłożyć na owoce i zapiekać około 20 minut w temperaturze 170 stopni. Ciepły deser udekorować jogurtem.', 30, null, 14);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (15, '2020-12-11 21:23:49.813196', '', 'Chleb pełnoziarnisty z pastą z czerwonej fasoli', 1, true, 'Fasolę odsączyć, przepłukać i włożyć do wysokiego naczynia razem z czosnkiem, oliwą, suszonymi pomidorami i przyprawami. Do smaku dodać sól i pieprz. Zblendować na gładką masę. Gotową pastą posmarować pieczywo. Podawać z awokado i pomidorami.', 10, null, 15);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (16, '2020-12-12 10:58:29.827287', '', 'Kanapka z szynką, sałatka z pomidorkami i awokado', 1, true, 'Pomidorki i awokado umyć. Pomidorki przekroić na pół. Awokado obrać, pokroić w kostkę i skropić sokiem z cytryny. Twaróg pokroić w kostkę. Wszystko wymieszać i oprószyć świeżo zmielonym pieprzem. Na posmarowany chleb masłem położyć plaster wędliny. ', 10, null, 16);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (17, '2020-12-12 11:01:01.371326', '', 'Owoce z orzechami nerkowca', 1, true, 'Owoce umyć i pokroić w kostkę. Przełożyć do miski i dodać orzechy.', 5, null, 17);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (18, '2020-12-12 11:10:18.354816', '', 'Bitki wieprzowe z kluskami śląskimi, warzywa', 1, true, '1. Mięso umyć i rozbić tłuczkiem. Obtoczyć w skrobi i natrzeć solą oraz pieprzem. Oliwę rozgrzać na patelni, dodać mięso i obsmażyć z każdej strony. Następnie dołożyć pokrojoną cebulkę i podlać mięso delikatnie wodą. Mięso dusić pod przykryciem ok. 30 min.. \n2. Mieszankę warzyw ugotować w wodzie z dodatkiem soli lub dusić na patelni pod przykryciem, podlewając niewielką ilością wody. Doprawić solą, pieprzem i słodką papryką.\n3. Kluski śląskie ugotować w wodzie z dodatkiem soli.', 40, null, 18);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (19, '2020-12-12 11:16:18.404523', 'bardzo sycący deser', 'Kulki orzechowo-czekoladowe', 1, true, 'Daktyle posiekać na kawałki. Wszystkie składniki oprócz wiórków kokosowych przełożyć do wysokiego naczynia i zblendować. Masę nabierać łyżeczką i formować dłonią kulki. Kulki obtoczyć w wiórkach i schłodzić w lodówce.', 10, null, 19);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (20, '2020-12-12 11:22:29.427293', '', 'Frankfurterka, kanapka z warzywami', 1, true, 'Frankfurterkę zagrzać w wodzie. Na pieczywo położyć warzywa. Podawać z musztardą lub ketchupem.', 10, null, 20);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (21, '2020-12-12 11:25:23.197045', '', 'Owsianka z truskawkami i migdałami', 1, true, 'Płatki owsiane gotować na mleku do miękkości. Przełożyć płatki do miski i ułożyć pokrojone truskawki. Oprószyć migdałami.', 15, null, 21);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (22, '2020-12-12 11:28:56.347468', '', 'Kanapka z wędliną i warzywami, owoc', 1, true, '1. Pieczywo posmarowane masłem obłożyć sałatą, szynką i ogórkiem.\n2. Podawać z umytym i pokrojonym jabłkiem.', 10, null, 22);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (23, '2020-12-12 11:40:38.408425', '', 'Grillowany filet z kurczaka w miodowo-musztardowej marynacie', 1, true, '1. Fileta umyć i dokładnie osuszyć papierowym ręcznikiem. Czosnek przecisnąć przez praskę i rozetrzeć z solą. Kurczaka skropić sokiem z cytryny, natrzeć czosnkiem z solą, posypać pieprzem i odstawić na 30 min do lodówki. \n2. Ugotować kaszę.\n3. Marchew i jabłko umyć i obrać. Zetrzeć na tarce o dużych oczkach. Dodać sok z cytryny i olej lniany. Wymieszać.\n4. Oliwę wymieszać z musztardą i miodem, koperek drobno posiekać. Mięso posmarować marynatą miodowo-musztardową, posypać koperkiem i grillować w piekarniku lub na patelni grillowej około 5 minut z każdej strony (w zależności od grubości).', 40, null, 23);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (24, '2020-12-12 11:43:15.655609', '', 'Chleb z dżemem i serkiem ziarnistym', 1, true, 'Serek połączyć z dżemem. Podawać z pieczywem.', 5, null, 24);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (25, '2020-12-12 11:49:51.996393', '', 'Sałatka grecka', 1, true, 'Warzywa umyć. Sałatę porwać na kawałki. Pomidora, ogórka i paprykę pokroić w kostkę a cebulę w plasterki. Pokrojone warzywa przełożyć do miski, dodać oliwki oraz przyprawy: sól, pieprz, bazylię i zioła prowansalskie. Następnie sałatkę skropić oliwą z oliwek i wymieszać. Na wierzchu sałatki pokruszyć ser feta.', 15, null, 25);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (26, '2020-12-12 11:59:02.098070', 'szybkie danie, może na wynos? :)', 'Makaron z kurczakiem, rukolą i suszonymi pomidorami', 1, true, '1. Ugotować makaron.\n2. Kurczaka umyć, pokroić w kostkę i smażyć na rozgrzanej oliwie. Dodać zioła do drobiu, cienkie plasterki pomidorów suszonych i rukolę. Dusić chwilę.\n3. Dodać ugotowany makaron i wymieszać. \n4. Gotowe danie skropić olejem lnianym lub oliwą.', 20, null, 26);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (27, '2020-12-12 12:03:06.750144', '', 'Budyń waniliowy z musem malinowym', 1, true, '1. Budyń ugotować według instrukcji na opakowaniu.\n2. Maliny zmiksować blenderem.\n3. Gotowy budyń przelać do miseczki i polać musem.', 10, null, 27);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (28, '2020-12-12 12:11:18.987706', '', 'Kanapki z polędwicą i żółtym serem, sałatka z pomidora', 1, true, '1. Chleb posmarowany masłem obłożyć sałatą, serem żółtym i szynką.\n2. Pomidora pokroić w półplasterki i przełożyć do miski. Cebulę posiekać i wymieszać z pomidorem. Przyprawić do smaku solą i pieprzem. Polać oliwą z oliwek lub olejem lnianym.', 10, null, 28);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (29, '2020-12-12 12:17:27.299909', '', 'Pieczywo z pastą jajeczną i szczypiorkiem', 1, true, 'Jajko ugotować i pokroić w drobną kostkę lub potrzeć na tarce. Awokado potrzeć na tarce, skropić sokiem z cytryny, wymieszać z jajkiem i jogurtem naturalnym. Doprawić solą, pieprzem i papryką. Wymieszać. Gotową pastę położyć na posmarowane masłem kromki chleba. Na wierzch położyć posiekany szczypiorek.', 15, null, 29);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (30, '2020-12-12 12:19:25.310645', '', 'Jogurt z bananem i orzechami', 1, true, 'Do salaterki przełożyć jogurt, dodać banana pokrojonego w plasterki i pokruszone orzechy włoskie.', 5, null, 30);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (31, '2020-12-12 12:30:39.201509', '', 'Filet z indyka w ziołach z kaszą jęczmienną, buraki tarte', 1, true, '1. Zioła wymieszać w miseczce z 2 łyżeczkami oiwy z oliwek. Do mieszanki przełożyć mięso, nacierać i odstawić do lodówki na około 20 minut. \n2. Ugotować buraki.\n3. Kaszę ugotować w wodzie z dodatkiem soli. Olej lniany spożyć po posiłku lub polać nim kaszę i wymieszać.\n4. Mięso zawinąć w folię aluminiową i piec w piekarniku nagrzanym do 200 stopni przez około 25 minut.\n5. Ugotowane buraki zetrzeć na tarce o grubych oczkach. Cebulę drobno posiekać i połączyć z burakami. Doprawić solą, pieprzem i sokiem z cytryny. Wymieszać.', 40, null, 31);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (32, '2020-12-12 12:33:33.613376', '', 'Wafle ryżowe z serkiem truskawkowym', 1, true, 'Ser twarogowy zmiksować z miodem i truskawkami. Gotową masą posmarować wafle ryżowe.', 5, null, 32);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (33, '2020-12-12 12:38:10.375249', '', 'Grzanki z camembertem i pomidorem, owoc', 1, true, 'Pieczywo opiec w tosterze lub opiekaczu. Położyć plasterki sera, pomidora i oprószyć ziołami. Podawać z gruszką.', 10, null, 33);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (34, '2020-12-12 21:37:19.379568', '', 'Owsianka z owocami i mlekiem', 1, true, 'Płatki owsiane zagotować z mlekiem. Następnie zdjąć z kuchenki i odstawić na kilka minut żeby płatki wchłonęły mleko. Maliny i borówki połączyć z miodem i zmiksować blenderem na mus (zostawić trochę borówek do udekorowania z wierzchu). Zmiksowane owoce dodać do owsianki i wymieszać. Z wierzchu udekorować borówkami i posypać płatkami migdałów.', 20, null, 34);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (35, '2020-12-12 21:40:42.601054', '', 'Kanapka z sałatą, wędliną i papryką', 1, true, 'Chleb posmarować, obłożyć sałatą, wędliną i na to położyć pokrojoną paprykę.', 5, null, 35);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (36, '2020-12-12 21:43:03.102361', '', 'Sałatka owocowa z orzechami', 1, true, 'Owoce umyć, pokroić i przełożyć do miski. Dodać orzechy i wymieszać.', 10, null, 36);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (37, '2020-12-12 21:51:07.915770', '', 'Sałatka grecka z chlebem graham', 1, true, 'Sałatę lodową umyć, osuszyć i porwać na małe kawałki. Pomidor sparzyć, obrać ze skórki i razem z ogórkiem pokroić w kostkę. Cebulę posiekać. Wszystkie składniki wymieszać z oliwą i przyprawami. Ser pokroić na kawałki i położyć na wierzch sałatki. Posypać pokrojonymi oliwkami. Podawać z  chlebem. Można ozdobić świeżą bazylią.', 15, null, 37);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (38, '2020-12-12 21:56:33.747567', '', 'Jaglanka z chia', 1, true, 'Kaszę jaglaną przelać wrzątkiem, przełożyć do garnka, dodać drobno pokrojone daktyle i nasiona chia. Zalać mlekiem i gotować około 12-15 min., aż kasza wchłonie mleko. Ugotowaną kaszę przełożyć do miseczki, dodać jogurt, udekorować pokrojonym w plasterki kiwi.', 20, null, 38);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (39, '2020-12-12 22:02:22.038295', '', 'Lekka sałatka warzywna', 1, true, 'Sałatę umyć, osuszyć, porwać na kawałki. Pomidory i oczyszczoną paprykę pokroić w kosteczkę. Ser pokroić w kostkę, rzodkiewki w półplasterki. Wszystko wymieszać, dodać posiekany szczypiorek oraz zioła. Tuż przed podaniem doprawić pieprzem i polać oliwą.', 15, null, 39);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (40, '2020-12-13 15:25:22.101998', '! rybę przygotować 40 minut wcześniej !', 'Łosoś w ziołach z piekarnika, pieczone ziemniaki, surówka', 1, true, '1. Rybę umyć, osuszyć i oprószyć przyprawą do ryb. Skropić cytryną i posypać koprem, bazylią i ziołami prowansalskimi. Odstawić do lodówki na pół godziny. \n2. Ziemniaki obrać, wrzucić do wrzącej wody i ugotować na półtwardo. Po odcedzeniu pokroić na ósemki, wyłożyć do naczynia żaroodpornego. \n3. Łososia zwinąć w folię aluminiową i piec w piekarniku 35 minut w 180 stopniach.\n4. Ziemniaki posypać przyprawą i piec około 25 minut w 180 stopniach. \n5. Ogórki pokroić w plasterki. Dodać posiekaną cebulę i oliwę. Wymieszać i oprószyć świeżo zmielonym pieprzem.', 40, null, 40);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (41, '2020-12-13 15:27:29.186487', '', 'Owoce, orzechy włoskie', 1, true, 'Owoce umyć, truskawki pokroić i przełożyć do miski. Dodać orzechy.', 5, null, 41);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (42, '2020-12-13 15:30:17.962620', '', 'Pieczywo z sałatą, szynką, serem i pomidorem', 1, true, 'Pieczywo posmarować masłem, obłożyć sałatą, szynką, serem oraz pokrojonym pomidorem. Posypać szczypiorkiem.', 10, null, 42);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (43, '2020-12-13 15:37:53.929376', '', 'Jogurtowy deser z truskawkami', 1, true, 'Truskawki umyć i oczyścić z szypułek (odłożyć kilka do dekoracji). Rozgnieść widelcem w misce. Dodać dżem porzeczkowy i delikatnie zamieszać. Przekładamy do szklanej salaterki robiąc warstwy: nałożyć kolejno 2 łyżki naturalnego jogurtu i łyżkę masy owocowej. Zakończyć na jogurcie. Całość posypać płatkami owsianymi i udekorować pozostałymi truskawkami.', 10, null, 43);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (44, '2020-12-13 15:48:42.184902', '! mięso przygotować 1,5 godziny wcześniej !', 'Pikantne polędwiczki z ryżem i letnią sałatką', 1, true, '1. Polędwiczkę posolić i doprawić pieprzem. Olej wymieszać z papryką ostrą i słodką i posmarować tą marynatą mięso. Wstawić do lodówki na co najmniej godzinę. \n2. Polędwiczkę piec w rozgrzanym piekarniku w 180 stopniach około pół godziny. Po upieczeniu pokroić w ukośne plastry.\n3. Warzywa oczyścić, sałatę porwać na mniejsze części, a rzodkiewki zetrzeć na tarce o grubych oczkach. szczypiorek i koperek drobno posiekać. Dodać jogurt z przeciśniętym przez praskę czosnkiem i wszystko wymieszać. Doprawić solą.\n4. Ryż ugotować według przepisu na opakowaniu.', 40, null, 44);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (45, '2020-12-13 15:52:33.081085', '', 'Dietetyczny sernik z owocami', 1, true, 'Laskę wanili przekroić wzdłuż i nożem wyskrobać nasiona. Twaróg, miód, jajko i nasionka zmiksować na gładką masę. Masę przelać do kokilki i piec w temperaturze 180 stopni około 20 minut. Podawać z owocami.', 30, null, 45);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (46, '2020-12-13 15:57:50.495907', '', 'Sałatka tuńczykowa z awokado i pomidorkami, pieczywo', 1, true, 'Awokado obrać ze skóry, pokroić w kostkę, skropić sokiem z cytryny i przełożyć do miski. Dodać pomidorki przekrojone na pół, odsączonego z zalewy tuńczyka i posiekaną natkę pietruszki. Doprawić solą i pieprzem. Wszystko wymieszać. Podawać z pieczywem.', 10, null, 46);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (47, '2020-12-13 16:03:20.716390', '', 'Jajecznica, kanapka z wędliną', 1, true, '1. Chleb obłożyć wędliną i położyć plastry pomidora.\n2. Na patelni rozgrzać masło, wbić jajka, dodać sól i smażyć do pożądanej konsystencji. Gotową jajecznicę posypać szczypiorkiem. Podawać z przygotowaną kanapką.', 10, null, 47);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (48, '2020-12-13 16:05:48.619336', '', 'Jogurt naturalny z musli i kiwi', 1, true, 'Jogurt przełożyć do miseczki, dodać musli, pokrojone w kostkę kiwi i wymieszać.', 5, null, 48);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (49, '2020-12-13 16:09:54.376516', '! przygotować dzień wcześniej na noc !', 'Nocna owsianka z chia i malinami', 1, true, 'Płatki i nasiona chia zalać mlekiem i odstawić w chłodne miejsce na noc. Następnego dnia wymieszać z syropem klonowym i dodać maliny.', 5, null, 49);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (50, '2020-12-13 16:13:08.726575', '', 'Kanapka z szynką, żółtym serem i warzywami, owoc', 1, true, 'Pieczywo posmarować masłem, obłożyć szynką, żółtym serem oraz pokrojoną w paski papryką. Podawać z truskawkami.', 5, null, 50);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (51, '2020-12-13 16:23:35.747449', '', 'Makaron z tuńczykiem i fetą, owoc', 1, true, 'Makaron ugotować. Posiekaną cebulę podsmażyć na rozgrzanym oleju, dodać tuńczyka i dusić 2-3 minuty. Dodać pokrojoną drobno fetę, przekrojone na pół oliwki i rukolę. Wymieszać i doprawić pieprzem. Gotowym sosem polać ugotowany makaron. Podawać z grejpfrutem.', 20, null, 51);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (52, '2020-12-13 16:31:36.853953', '', 'Kolorowa sałatka jajeczna', 1, true, 'Jajko ugotować na twardo. Wystudzić i obrać. W misce ułożyć sałatę, pokrojoną w paski szynkę, pomidory, cebulę w piórkach i jajko pokrojone w ćwiartki. Z wierzchu składniki oprószyć serem żółtym. Czosnek przecisnąć przez praskę, dodać jogurt. Dodać bazylię, oregano, pieprz i wymieszać. Sosem polać sałatkę. Podawać z pieczywem.', 15, null, 52);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (53, '2020-12-13 16:39:07.178441', '', 'Mintaj pieczony z cukinią i papryką, ryż', 1, true, 'Rybę umyć, osuszyć i ugotować w bulionie warzywnym. W naczyniu żaroodpornym ułożyć rybę przekładając plastrami cukinii, pokrojoną cebulą i paskami papryki. Całość podlać bulionem z gotowania ryby, posypać posiekanym czosnkiem i ziołami prowansalskimi, doprawić solą i pieprzem. Polać oliwą i wstawić do piekarnika nagrzanego do 170 stopni. Piec około 25 minut. Ugotować ryż. Olej lniany spożyć po posiłku.', 40, null, 53);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (54, '2020-12-13 16:44:51.367888', '', 'Pieczywo z sałatą i szynką, serek ziarnisty z pomidorem', 1, true, '1. Pieczywo posmarować masłem. Położyć szynkę, sałatę i pokrojonego w plastry ogórka kiszonego/małosolnego.\n2. Pomidory pokroić i wymieszać z serkiem wiejskim. Przyprawić solą i pieprzem.', 10, null, 54);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (55, '2020-12-13 16:52:27.388039', '', 'Kakaowa owsianka z bananem i orzechami', 1, true, 'Płatki oraz len przesypać do rondelka, zalać szklanką wody i zagotować. Banana rozgnieść widelcem i wrzucić do gotującej się owsianki. Dodać kakao, miód i dokładnie wymieszać. Przelać do miseczki i posypać posiekanymi orzechami.', 10, null, 55);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (56, '2020-12-13 19:04:50.294150', '', 'Kanapka z szynką, sałatka z pomidora, owoc', 1, true, 'Chleb posmarować masłem, obłożyć sałatą i szynką. Pomidora sparzyć, obrać ze skórki i pokroić w kostkę. Dodać jogurt, sól i pieprz. Wszystko wymieszać.', 10, null, 56);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (57, '2020-12-13 19:07:37.491613', '', 'Serek ziarnisty w brzoskwini', 1, true, 'Brzoskwinię umyć, przekroić na pół i wyjąć pestkę. Ułożyć na talerzu. Zagłębienia po pestkach wypełnić serkiem. Ziarna sezamu uprażyć na złoto na suchej patelni i posypać nimi brzoskwinię.', 10, null, 57);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (58, '2020-12-13 19:09:20.819625', 'szybki deser', 'Jabłko, orzechy nerkowca', 1, true, 'Jabłko umyć, pokroić i przełożyć do miski. Dodać orzechy.', 5, null, 58);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (59, '2020-12-13 19:18:13.875058', '! rybę przygotować 40 minut wcześniej !', 'Filet z łososia w koperkowej marynacie, kasza brokułowa', 1, true, '1. W małym naczyniu wymieszać koperek z oliwą, miodem, sokiem z cytryny, kolendrą, czosnkiem przeciśniętym przez praskę, solą i pieprzem. Rybę opłukać, osuszyć i natrzeć równomiernie marynatą. Następnie owinąć w folię spożywczą i wstawić do lodówki na 30 minut.\n2. Ugotować kaszę. Brokuły ugotować na parze. Składniki połączyć, dodać przyprawy i wymieszać.\n3. Rybę wyciągniętą z foli piec w temperaturze 220 stopni około 15 minut.', 30, null, 59);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (60, '2020-12-13 19:23:07.728221', '', 'Chleb z sałatą, pastą z tuńczyka i ogórkiem', 1, true, 'Tuńczyka odcedzić i przełożyć do salaterki. Skropić sokiem z cytryny oraz oliwą. Rozdrobnić widelcem na mniejsze kawałki. Doprawić odrobiną soli i pieprzu. Dodać posiekaną cebulkę, jogurt i dokładnie wymieszać. Chleb posmarować pastą, położyć sałatę i plasterki ogórka.', 10, null, 60);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (61, '2020-12-13 19:32:42.476364', '', 'Bułka grahamka z wędliną, jajkiem i warzywami', 1, true, 'Bułkę posmarować masłem. Położyć sałatę, szynkę, pokrojonego w plastry ogórka, pomidora i ugotowane jajo.', 10, null, 61);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (62, '2020-12-13 19:40:13.325469', '', 'Ciasto z borówkami', 1, true, 'Połączyć składniki suche: mąkę, proszek do pieczenia, cynamon i cukier. Połączyć składniki mokre: mleko, jaja i ekstrakt. Następnie mokre składniki przelać do suchych i dokładnie wymieszać. Do masy dodać posiekane orzechy i owoc. Delikatnie wymieszać. Masę przelać do formy do muffinków wyłożonej papilotkami do 3/4 wysokości. Piec w temperaturze 180 stopni przez około 15-20 minut. Ciasto można zrobić w większej porcji, wtedy można upiec w małej blaszce.', 30, null, 62);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (63, '2020-12-13 19:48:40.701762', '', 'Chrupiąca bruschetta z mozzarellą i pomidorami', 1, true, 'Pieczywo wyłożyć na blasze na papierze do pieczenia. W małej miseczce połączyć sól morską, ocet balsamiczny i suszone oregano. W misce połączyć ćwiartki pomidorków, pokrojony czosnek, migdały i liście bazylii. Składniki zalać octem balsamicznym z przyprawami. Na kromkę pieczywa położyć plaster mozzarelli i przygotowaną mieszankę z pomidorami. Zapiekać w piekarniku około 5-7 minut. Po wyjęciu z piekarnika pieczywo skropić olejem lnianym.', 20, null, 63);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (64, '2020-12-13 20:00:59.342104', '', 'Filet z kurczaka z ziemniakami i zieloną sałatą', 1, true, '1. Ziemniaki ugotować w wodzie z dodatkiem soli.\n2. Mięso umyć, osuszyć i lekko rozbić. Posypać przyprawami. Na patelni rozgrzać olej, położyć mięso i smażyć z obu stron po kilka minut do uzyskania złocistej barwy.\n3. Liście sałaty porwać na mniejsze kawałki. Jogurt doprawić solą, pieprzem i sokiem z cytryny. Polać sałatę i wymieszać.\n4. Na gotowych ziemniakach położyć masło.', 25, null, 64);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (65, '2020-12-13 20:09:01.438893', '', 'Sałatka makaronowa z tuńczykiem i serem feta', 1, true, 'Makaron ugotować w wodzie z dodatkiem soli. Pomidora pokroić w kostkę. W misce połączyć składniki: ugotowany makaron, tuńczyka, pomidora, fasolę oraz oliwki. Przecier pomidorowy przełożyć do miseczki. Dodać oliwę z oliwek, sól, pieprz, zioła prowansalskie oraz bazylię. Wymieszać i dodać do reszty składników. Całość wymieszać. Z wierzchu na sałatkę pokruszyć ser feta.', 20, null, 65);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (66, '2020-12-13 21:07:53.688203', '', 'Pizza', 4, true, '1. Drożdże ucierać z odrobiną cukru i ciepłej wody. Do dużego naczynia wsypać mąkę, pół łyżeczki soli, utarte drożdże, ciepłą wodę i oliwę. Zagniatać do momentu kiedy ciasto przestanie się kleić do rąk. Ciasto przykryć ścierką na 20 min. do wyrośnięcia. \n2. Przygotowanie sosu: do garnuszka wlać oliwy tak by przykryła dno, dodać przeciśnięty przez praskę czosnek, masło i bazylię. Gotować przez chwilę i dodać przecier. Przyprawić oregano, solą i pieprzem. Gotować jeszcze przez około 10 minut.\n3. Ciasto ponownie zagnieść, rozwałkować i przełożyć na blachę wyłożoną papierem do pieczenia. Wierzch ciasta posmarować sosem, posypać startym serem żółtym i ulubionymi składnikami, np. salami, pieczarki, ananas. Na końcu posypać startą mozzarellą. Piec 15 minut w piekarniku nagrzanym do 200 stopni.', 60, null, 66);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (67, '2020-12-13 21:18:44.695413', '', 'Jajecznica z pomidorami', 3, true, 'Masło roztopić na patelni, podsmażyć cebulę pokrojoną w kostkę. Dodać pokrojone pomidory. Smażyć do uzyskania lejącej konsystencji. Dodać jajka. Energicznie mieszać, aż do momentu gdy jajecznica przybierze odpowiednią konsystencję. Podawać ze świeżymi bułeczkami.', 20, null, 67);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (68, '2020-12-13 21:40:35.857924', '! spód ciasta przygotować 60 minut wcześniej !', 'Sernik w cieście kakaowym', 10, true, '1. Mąkę wymieszaną z proszkiem do pieczenia siekamy z kostką masła, wbijamy 1 jajko, dodajemy 220 gram cukru i kakao. Zagniatamy ciasto i wkładamy na minimum 60 minut do zamrażalnika.\n2. Ser mielimy. 100 gram masła ucieramy z żółtkami i resztą cukru. Cały czas mieszając dodajemy po łyżce sera. Wsypujemy budyń i na koniec do sera dodajemy pianę ubitą z białek. Mieszamy za pomocą łyżki.\n3. Połowę ciasta trzemy na tarce o grubych oczkach i przenosimy do blachy. Na ciasto wykładamy masę serową. Na nią trzemy resztę ciasta.\n4. Piec 60 minut w temperaturze 180 stopni.', 90, null, 68);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (69, '2020-12-13 21:52:48.209330', '', 'Torcik 3 bit', 10, true, '1. Ugotować budyń: odlać pół szklanki mleka, wymieszać w nim żółtka, cukier i mąkę. Resztę mleka zagotować. Do gotującego się mleka powoli wlewać przygotowaną mieszankę. Mieszać cały czas aż masa zgęstnieje. Budyń wystudzić.\n2. Do blachy położyć warstwę herbatników. Na herbatniki położyć podgrzany kajmak, następnie warstwę herbatników.\n3. Wystudzony budyń utrzeć z masłem i wyłożyć na warstwę herbatników.\n4. Położyć kolejną warstwę herbatników i ubitą śmietanę. Oprószyć tartą czekoladą lub kakao.', 45, null, 69);
INSERT INTO shopping_list.recipes (id, created_on, description, name, number_of_servings, original, preparation, preparation_time, updated_on, set_of_ingr_with_quant_id) VALUES (70, '2020-12-13 22:19:34.955785', '', 'Ciasto marchewkowe', 10, true, 'Jajka i cukier ubić. Marchew utrzeć na drobnych oczkach. Marchew razem z resztą składników wymieszać i dodać do ubitych jajek. Całość wymieszać, przełożyć do blachy i piec 30 minut w temperaturze 180 stopni. Można posypać cukrem pudrem.', 40, null, 70);

create table users
(
    id               bigint auto_increment
        primary key,
    created_on       datetime(6)  null,
    email            varchar(255) not null,
    first_name       varchar(50)  not null,
    last_name        varchar(50)  not null,
    password         varchar(255) not null,
    role             varchar(255) null,
    updated_on       datetime(6)  null,
    shopping_list_id bigint       null,
    constraint UK_6dotkott2kjsp8vw4d0m25fb7
        unique (email),
    constraint FKbnls4ojdoob2qnxgefa6jxy9g
        foreign key (shopping_list_id) references shopping_lists (id)
);

INSERT INTO shopping_list.users (id, created_on, email, first_name, last_name, password, role, updated_on, shopping_list_id) VALUES (1, '2020-12-03 10:31:32.113075', 'machniom93@gmail.com', 'Mateusz', 'Machnio', '$2a$10$hqTF64smXPXPX5mNEG2/o.9vv4tgk8Guce3HWO3BW0F194lSiTZ4a', 'USER', null, null);


create table user_recipes
(
    user_id   bigint not null,
    recipe_id bigint not null,
    primary key (user_id, recipe_id),
    constraint FKe3w33acv9hkobh8y449vep11c
        foreign key (recipe_id) references recipes (id),
    constraint FKs7028hxgb1vodinnh0odcyuor
        foreign key (user_id) references users (id)
);

INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 1);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 2);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 3);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 4);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 5);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 6);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 7);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 8);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 9);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 10);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 11);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 12);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 13);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 14);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 15);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 16);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 17);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 18);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 19);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 20);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 21);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 22);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 23);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 24);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 25);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 26);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 27);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 28);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 29);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 30);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 31);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 32);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 33);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 34);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 35);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 36);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 37);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 38);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 39);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 40);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 41);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 42);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 43);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 44);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 45);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 46);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 47);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 48);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 49);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 50);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 51);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 52);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 53);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 54);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 55);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 56);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 57);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 58);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 59);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 60);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 61);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 62);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 63);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 64);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 65);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 66);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 67);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 68);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 69);
INSERT INTO shopping_list.user_recipes (user_id, recipe_id) VALUES (1, 70);
