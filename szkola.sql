/* tworzenie bazy danych */

Create Database Szkola;

/* tworzenie tabel i uzupelnianie ich danymi */

USE [Szkola]
GO

Create Table uczniowie
(
 nr_ucznia int NOT NULL,
imie char(30),
nazwisko char(30),
klasa int,
klasa_znak char(1)
PRIMARY KEY(nr_ucznia)
)


INSERT INTO dbo.uczniowie
   ([nr_ucznia],[imie], [nazwisko], [klasa], [klasa_znak])
VALUES
   ( 1, N'Tomek', N'Kowalski', 2, N'a'),
   ( 2, N'Bartek', N'Nowacki', 5, N'b'),
   ( 3, N'Kasia', N'Nowakowska', 4, N'c'),
   ( 4, N'Ola', N'Lewandowska', 3, N'd'),
   ( 5, N'Anna', N'Lawendowa', 1, N'e'),
   ( 6, N'Michalina', N'Boczek', 6, N'a'),
   ( 7, N'Małgorzata', N'Teodorowicz', 7, N'b'),
   ( 8, N'Piotr', N'Nowakowski', 8, N'c'),
   ( 9, N'Michał', N'Brzoza', 3, N'c'),
   ( 10, N'Kamil', N'Drzemała', 7, N'e')
GO

Create Table nauczyciele
(
 nr_nauczyciela int NOT NULL,
imie char(30),
nazwisko char(30),
nr_tel int,
przedmiot_nauczany int
PRIMARY KEY(nr_nauczyciela)
)


INSERT INTO dbo.nauczyciele
   ([nr_nauczyciela],[imie], [nazwisko], [nr_tel], [przedmiot_nauczany])
VALUES
   ( 1, N'Roman', N'Tomecki', 123456123, 4),
   ( 2, N'Janusz', N'Kwiatkowski', 198876765, 3),
   ( 3, N'Monika', N'Skorupa',465465678, 2),
   ( 4, N'Michalina', N'Głaz', 465890678, 1),
   ( 5, N'Patrycja', N'Rozkoszna', 465878398, 9),
   ( 6, N'Konrad', N'Gabryś', 777890678, 10),
   ( 7, N'Michał', N'Głaz', 461234678, 5),
   ( 8, N'Kamil', N'Grom', 123490678, 6),
   ( 9, N'Maciej', N'Grobelny', 467891278, 7),
   ( 10, N'Marian', N'Nocicki', 783261678, 8)
GO



Create Table przedmioty
(
 nr_przedmiotu int NOT NULL,
nazwa char(30),
ilosc_godzin int,
sala int,
waga int
PRIMARY KEY(nr_przedmiotu)
)


INSERT INTO dbo.przedmioty
   ([nr_przedmiotu],[nazwa], [ilosc_godzin], [sala], [waga])
VALUES
   ( 1, N'biologia', 30, 2, 1),
   ( 2, N'fizyka', 15, 5, 2),
   ( 3, N'chemia', 45, 7, 1),
   ( 4, N'matematyka', 15, 10, 2),
   ( 5, N'angielski', 15, 11, 3),
   ( 6, N'polski', 30, 20, 2),
   ( 7, N'wf', 10, 1, 1),
   ( 8, N'religia', 10, 3, 1),
   ( 9, N'geografia', 15, 21, 2),
   ( 10, N'historia', 15, 10, 2)
GO

Create Table dziennik
(
 nr_oceny int NOT NULL,
wartosc_oceny int,
nr_ucznia int,
nr_nauczyciela int,
nr_przedmiotu int
PRIMARY KEY(nr_oceny)
)

INSERT INTO dbo.dziennik
   ([nr_oceny],[wartosc_oceny], [nr_ucznia], [nr_nauczyciela], [nr_przedmiotu])
VALUES
   ( 1, 5, 10, 1, 4),
   ( 2, 4, 9, 2, 3),
   ( 3, 3, 8, 3, 2),
   ( 4, 2, 7, 4, 1),
   ( 5, 1, 6, 5, 9),
   ( 6, 6, 5, 6, 10),
   ( 7, 5, 4, 7, 5),
   ( 8, 3, 3, 8, 6),
   ( 9, 4, 2, 9, 7),
   ( 10, 4, 1, 10, 8)
GO

/* tworzenie widokow */

create view biologiaInfo as
select * from dbo.przedmioty
where nazwa='biologia';

create view ileOcen as
select nr_ucznia, count(nr_oceny) as iloscOcen from dbo.dziennik
group by nr_ucznia;

create view Srednie_oceny_z_przedmiotow as
select P.nazwa as nazwa_przedmiotu, AVG(D.wartosc_oceny) as srednia_ocena  from dbo.dziennik D left join dbo.przedmioty P ON D.nr_przedmiotu = P.nr_przedmiotu
GROUP BY nazwa ;

create view Oceny_uczniow as
select U.imie as imie, U.nazwisko as nazwisko, D.wartosc_oceny as ocena  from dbo.dziennik D 
LEFT JOIN dbo.uczniowie U on D.nr_ucznia = U.nr_ucznia





