--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE game;
--
-- Name: game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game OWNER TO freecodecamp;

\connect game

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 9, 1);
INSERT INTO public.games VALUES (3, 12, 1);
INSERT INTO public.games VALUES (4, 10, 1);
INSERT INTO public.games VALUES (5, 10, 6);
INSERT INTO public.games VALUES (6, 18, 6);
INSERT INTO public.games VALUES (7, 26, 7);
INSERT INTO public.games VALUES (8, 106, 7);
INSERT INTO public.games VALUES (9, 744, 8);
INSERT INTO public.games VALUES (10, 320, 8);
INSERT INTO public.games VALUES (11, 733, 7);
INSERT INTO public.games VALUES (12, 314, 7);
INSERT INTO public.games VALUES (13, 941, 7);
INSERT INTO public.games VALUES (14, 166, 9);
INSERT INTO public.games VALUES (15, 630, 9);
INSERT INTO public.games VALUES (16, 622, 10);
INSERT INTO public.games VALUES (17, 83, 10);
INSERT INTO public.games VALUES (18, 501, 9);
INSERT INTO public.games VALUES (19, 884, 9);
INSERT INTO public.games VALUES (20, 653, 9);
INSERT INTO public.games VALUES (21, 121, 11);
INSERT INTO public.games VALUES (22, 861, 11);
INSERT INTO public.games VALUES (23, 278, 12);
INSERT INTO public.games VALUES (24, 789, 12);
INSERT INTO public.games VALUES (25, 976, 11);
INSERT INTO public.games VALUES (26, 980, 11);
INSERT INTO public.games VALUES (27, 913, 11);
INSERT INTO public.games VALUES (28, 7, 1);
INSERT INTO public.games VALUES (29, 8, 1);
INSERT INTO public.games VALUES (30, 472, 13);
INSERT INTO public.games VALUES (31, 303, 13);
INSERT INTO public.games VALUES (32, 680, 14);
INSERT INTO public.games VALUES (33, 909, 14);
INSERT INTO public.games VALUES (34, 342, 13);
INSERT INTO public.games VALUES (35, 557, 13);
INSERT INTO public.games VALUES (36, 801, 13);
INSERT INTO public.games VALUES (37, 608, 15);
INSERT INTO public.games VALUES (38, 289, 15);
INSERT INTO public.games VALUES (39, 615, 16);
INSERT INTO public.games VALUES (40, 586, 16);
INSERT INTO public.games VALUES (41, 569, 15);
INSERT INTO public.games VALUES (42, 899, 15);
INSERT INTO public.games VALUES (43, 619, 15);
INSERT INTO public.games VALUES (44, 10, 1);
INSERT INTO public.games VALUES (45, 653, 17);
INSERT INTO public.games VALUES (46, 673, 17);
INSERT INTO public.games VALUES (47, 686, 18);
INSERT INTO public.games VALUES (48, 555, 18);
INSERT INTO public.games VALUES (49, 304, 17);
INSERT INTO public.games VALUES (50, 843, 17);
INSERT INTO public.games VALUES (51, 993, 17);
INSERT INTO public.games VALUES (52, 696, 19);
INSERT INTO public.games VALUES (53, 612, 19);
INSERT INTO public.games VALUES (54, 806, 20);
INSERT INTO public.games VALUES (55, 30, 20);
INSERT INTO public.games VALUES (56, 119, 19);
INSERT INTO public.games VALUES (57, 272, 19);
INSERT INTO public.games VALUES (58, 915, 19);
INSERT INTO public.games VALUES (59, 340, 21);
INSERT INTO public.games VALUES (60, 293, 21);
INSERT INTO public.games VALUES (61, 920, 22);
INSERT INTO public.games VALUES (62, 419, 22);
INSERT INTO public.games VALUES (63, 547, 21);
INSERT INTO public.games VALUES (64, 560, 21);
INSERT INTO public.games VALUES (65, 642, 21);
INSERT INTO public.games VALUES (66, 982, 23);
INSERT INTO public.games VALUES (67, 400, 23);
INSERT INTO public.games VALUES (68, 732, 24);
INSERT INTO public.games VALUES (69, 8, 24);
INSERT INTO public.games VALUES (70, 570, 23);
INSERT INTO public.games VALUES (71, 544, 23);
INSERT INTO public.games VALUES (72, 316, 23);
INSERT INTO public.games VALUES (73, 467, 25);
INSERT INTO public.games VALUES (74, 907, 25);
INSERT INTO public.games VALUES (75, 885, 26);
INSERT INTO public.games VALUES (76, 303, 26);
INSERT INTO public.games VALUES (77, 487, 25);
INSERT INTO public.games VALUES (78, 130, 25);
INSERT INTO public.games VALUES (79, 156, 25);
INSERT INTO public.games VALUES (80, 103, 27);
INSERT INTO public.games VALUES (81, 975, 27);
INSERT INTO public.games VALUES (82, 16, 28);
INSERT INTO public.games VALUES (83, 72, 28);
INSERT INTO public.games VALUES (84, 505, 27);
INSERT INTO public.games VALUES (85, 893, 27);
INSERT INTO public.games VALUES (86, 787, 27);
INSERT INTO public.games VALUES (87, 64, 29);
INSERT INTO public.games VALUES (88, 708, 29);
INSERT INTO public.games VALUES (89, 80, 30);
INSERT INTO public.games VALUES (90, 46, 30);
INSERT INTO public.games VALUES (91, 924, 29);
INSERT INTO public.games VALUES (92, 47, 29);
INSERT INTO public.games VALUES (93, 220, 29);
INSERT INTO public.games VALUES (94, 216, 31);
INSERT INTO public.games VALUES (95, 474, 31);
INSERT INTO public.games VALUES (96, 960, 32);
INSERT INTO public.games VALUES (97, 459, 32);
INSERT INTO public.games VALUES (98, 178, 31);
INSERT INTO public.games VALUES (99, 867, 31);
INSERT INTO public.games VALUES (100, 940, 31);
INSERT INTO public.games VALUES (101, 388, 33);
INSERT INTO public.games VALUES (102, 636, 33);
INSERT INTO public.games VALUES (103, 708, 34);
INSERT INTO public.games VALUES (104, 218, 34);
INSERT INTO public.games VALUES (105, 226, 33);
INSERT INTO public.games VALUES (106, 459, 33);
INSERT INTO public.games VALUES (107, 495, 33);
INSERT INTO public.games VALUES (108, 229, 35);
INSERT INTO public.games VALUES (109, 857, 35);
INSERT INTO public.games VALUES (110, 432, 36);
INSERT INTO public.games VALUES (111, 527, 36);
INSERT INTO public.games VALUES (112, 473, 35);
INSERT INTO public.games VALUES (113, 711, 35);
INSERT INTO public.games VALUES (114, 161, 35);
INSERT INTO public.games VALUES (115, 281, 37);
INSERT INTO public.games VALUES (116, 285, 37);
INSERT INTO public.games VALUES (117, 432, 38);
INSERT INTO public.games VALUES (118, 760, 38);
INSERT INTO public.games VALUES (119, 703, 37);
INSERT INTO public.games VALUES (120, 715, 37);
INSERT INTO public.games VALUES (121, 398, 37);
INSERT INTO public.games VALUES (122, 171, 39);
INSERT INTO public.games VALUES (123, 181, 39);
INSERT INTO public.games VALUES (124, 85, 40);
INSERT INTO public.games VALUES (125, 109, 40);
INSERT INTO public.games VALUES (126, 487, 39);
INSERT INTO public.games VALUES (127, 169, 39);
INSERT INTO public.games VALUES (128, 331, 39);
INSERT INTO public.games VALUES (129, 211, 41);
INSERT INTO public.games VALUES (130, 298, 41);
INSERT INTO public.games VALUES (131, 571, 42);
INSERT INTO public.games VALUES (132, 994, 42);
INSERT INTO public.games VALUES (133, 771, 41);
INSERT INTO public.games VALUES (134, 293, 41);
INSERT INTO public.games VALUES (135, 955, 41);
INSERT INTO public.games VALUES (136, 8, 8);
INSERT INTO public.games VALUES (137, 277, 43);
INSERT INTO public.games VALUES (138, 237, 43);
INSERT INTO public.games VALUES (139, 975, 44);
INSERT INTO public.games VALUES (140, 753, 44);
INSERT INTO public.games VALUES (141, 403, 43);
INSERT INTO public.games VALUES (142, 693, 43);
INSERT INTO public.games VALUES (143, 950, 43);
INSERT INTO public.games VALUES (144, 253, 45);
INSERT INTO public.games VALUES (145, 102, 45);
INSERT INTO public.games VALUES (146, 378, 46);
INSERT INTO public.games VALUES (147, 794, 46);
INSERT INTO public.games VALUES (148, 796, 45);
INSERT INTO public.games VALUES (149, 324, 45);
INSERT INTO public.games VALUES (150, 950, 45);
INSERT INTO public.games VALUES (151, 596, 47);
INSERT INTO public.games VALUES (152, 933, 47);
INSERT INTO public.games VALUES (153, 81, 48);
INSERT INTO public.games VALUES (154, 509, 48);
INSERT INTO public.games VALUES (155, 850, 47);
INSERT INTO public.games VALUES (156, 962, 47);
INSERT INTO public.games VALUES (157, 414, 47);
INSERT INTO public.games VALUES (158, 527, 49);
INSERT INTO public.games VALUES (159, 935, 49);
INSERT INTO public.games VALUES (160, 190, 50);
INSERT INTO public.games VALUES (161, 260, 50);
INSERT INTO public.games VALUES (162, 831, 49);
INSERT INTO public.games VALUES (163, 936, 49);
INSERT INTO public.games VALUES (164, 251, 49);
INSERT INTO public.games VALUES (165, 233, 51);
INSERT INTO public.games VALUES (166, 332, 51);
INSERT INTO public.games VALUES (167, 13, 52);
INSERT INTO public.games VALUES (168, 829, 52);
INSERT INTO public.games VALUES (169, 553, 51);
INSERT INTO public.games VALUES (170, 257, 51);
INSERT INTO public.games VALUES (171, 378, 51);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Mipe');
INSERT INTO public.users VALUES (2, 'user_1711913350047');
INSERT INTO public.users VALUES (3, 'user_1711913350046');
INSERT INTO public.users VALUES (4, 'user_1711913400352');
INSERT INTO public.users VALUES (5, 'user_1711913400351');
INSERT INTO public.users VALUES (6, 'Fulanito');
INSERT INTO public.users VALUES (7, 'user_1711915495118');
INSERT INTO public.users VALUES (8, 'user_1711915495117');
INSERT INTO public.users VALUES (9, 'user_1711915628621');
INSERT INTO public.users VALUES (10, 'user_1711915628620');
INSERT INTO public.users VALUES (11, 'user_1711915657465');
INSERT INTO public.users VALUES (12, 'user_1711915657464');
INSERT INTO public.users VALUES (13, 'user_1711915954129');
INSERT INTO public.users VALUES (14, 'user_1711915954128');
INSERT INTO public.users VALUES (15, 'user_1711916076622');
INSERT INTO public.users VALUES (16, 'user_1711916076621');
INSERT INTO public.users VALUES (17, 'user_1711916407258');
INSERT INTO public.users VALUES (18, 'user_1711916407257');
INSERT INTO public.users VALUES (19, 'user_1711916411066');
INSERT INTO public.users VALUES (20, 'user_1711916411065');
INSERT INTO public.users VALUES (21, 'user_1711916413950');
INSERT INTO public.users VALUES (22, 'user_1711916413949');
INSERT INTO public.users VALUES (23, 'user_1711916415767');
INSERT INTO public.users VALUES (24, 'user_1711916415766');
INSERT INTO public.users VALUES (25, 'user_1711916417451');
INSERT INTO public.users VALUES (26, 'user_1711916417450');
INSERT INTO public.users VALUES (27, 'user_1711916419101');
INSERT INTO public.users VALUES (28, 'user_1711916419100');
INSERT INTO public.users VALUES (29, 'user_1711916420755');
INSERT INTO public.users VALUES (30, 'user_1711916420754');
INSERT INTO public.users VALUES (31, 'user_1711916422330');
INSERT INTO public.users VALUES (32, 'user_1711916422329');
INSERT INTO public.users VALUES (33, 'user_1711916424184');
INSERT INTO public.users VALUES (34, 'user_1711916424183');
INSERT INTO public.users VALUES (35, 'user_1711916426674');
INSERT INTO public.users VALUES (36, 'user_1711916426673');
INSERT INTO public.users VALUES (37, 'user_1711916723474');
INSERT INTO public.users VALUES (38, 'user_1711916723473');
INSERT INTO public.users VALUES (39, 'user_1711916804597');
INSERT INTO public.users VALUES (40, 'user_1711916804596');
INSERT INTO public.users VALUES (41, 'user_1711916806497');
INSERT INTO public.users VALUES (42, 'user_1711916806496');
INSERT INTO public.users VALUES (43, 'user_1711917640886');
INSERT INTO public.users VALUES (44, 'user_1711917640885');
INSERT INTO public.users VALUES (45, 'user_1711917642679');
INSERT INTO public.users VALUES (46, 'user_1711917642678');
INSERT INTO public.users VALUES (47, 'user_1711917824957');
INSERT INTO public.users VALUES (48, 'user_1711917824956');
INSERT INTO public.users VALUES (49, 'user_1711917897693');
INSERT INTO public.users VALUES (50, 'user_1711917897692');
INSERT INTO public.users VALUES (51, 'user_1711917961442');
INSERT INTO public.users VALUES (52, 'user_1711917961441');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 171, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 52, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

