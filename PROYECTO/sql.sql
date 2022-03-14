
create table USUARIO
    (  IdUsuario NUMBER(5,0) CONSTRAINT pkidusuario primary key,
       NombreUsuario VARCHAR2(15) CONSTRAINT unnomusuario unique,                   
       FechaNacimiento DATE CONSTRAINT nnfnacusuario not null,
       PaisOrigen VARCHAR2(30) CONSTRAINT nnpaisorigen not null,
       NumTlf VARCHAR2(15) CONSTRAINT utelfusuario unique,                          
       FotoUsuario BLOB                                                 );        
       
       
create table SUSCRIPCION
    (  IdSuscripcion NUMBER(5,0) CONSTRAINT pkidsuscripcion primary key,
       CorreoElectronico VARCHAR2(100) CONSTRAINT ucorreousuario unique,
       TipoSuscripcion VARCHAR2(10) CONSTRAINT nntiposuscripcion not null,
       EntidadBancaria VARCHAR2(30) CONSTRAINT nnentidadbancaria not null,
       CuentaBancaria CHAR(24) CONSTRAINT nncuentabancaria not null,
       PrecioSuscripcion NUMBER(4,2) CONSTRAINT nnpreciosuscrip not null,
       MesesSuscrito NUMBER(4,0) CONSTRAINT nnmesessuscrip not null                 );                  
       
       
create table BIBLIOTECA
    ( IdBiblioteca NUMBER(5,0) CONSTRAINT pkidbiblioteca primary key,
      CONSTRAINT fkbibliotecausuar foreign key (IdBiblioteca) REFERENCES USUARIO(IdUsuario),
      CreadorBiblioteca VARCHAR2(15) CONSTRAINT nncreadorbiblioteca not null,
      CONSTRAINT fkbibliotecausuario foreign key (CreadorBiblioteca) REFERENCES USUARIO(NombreUsuario)  );
          
                                                                                
create table HISTORIAL
    ( IdHistorial NUMBER(5,0) CONSTRAINT pkidhistorial primary key,
      CONSTRAINT fkidhistorial foreign key (IdHistorial) REFERENCES USUARIO(IdUsuario),
      CreadorHistorial VARCHAR2(15) CONSTRAINT nncreadorhistorial not null,
      CONSTRAINT fkhistorialusuar foreign key (CreadorHistorial) REFERENCES USUARIO(NombreUsuario)  );
      
      
create table DISCOS
    ( IdDisco NUMBER(20,0) CONSTRAINT pkiddisco primary key,
      NombreDisco VARCHAR2(50) CONSTRAINT nnnombdisco not null,
      GeneroDisco VARCHAR2(50) CONSTRAINT nngendisco not null,
      Artista VARCHAR2(30) CONSTRAINT nnartistadisco not null,
      FechaLanzamiento DATE CONSTRAINT nnflanzdisco not null,
      TipoDisco VARCHAR2(10) CONSTRAINT nntipodisco not null            );
      
    
create table PLAYLIST
    ( IdPlaylist NUMBER(10,0) CONSTRAINT pkidplaylist primary key,
      NombrePlaylist VARCHAR2(50) CONSTRAINT nnnombplaylist not null,
      CreadorPlaylist VARCHAR2(15) CONSTRAINT nncreadorplaylist not null,
      CONSTRAINT fkplaylistusuar foreign key (CreadorPlaylist) REFERENCES USUARIO(NombreUsuario),
      Disco1 NUMBER(20,0),
      Disco2 NUMBER(20,0),
      Disco3 NUMBER(20,0),
      Disco4 NUMBER(20,0),
      Disco5 NUMBER(20,0),
      CONSTRAINT fkdisco1playlist foreign key (Disco1) REFERENCES DISCOS(IdDisco),
      CONSTRAINT fkdisco2playlist foreign key (Disco2) REFERENCES DISCOS(IdDisco),
      CONSTRAINT fkdisco3playlist foreign key (Disco3) REFERENCES DISCOS(IdDisco),
      CONSTRAINT fkdisco4playlist foreign key (Disco4) REFERENCES DISCOS(IdDisco),
      CONSTRAINT fkdisco5playlist foreign key (Disco5) REFERENCES DISCOS(IdDisco)           );
      
      
create table CANCIONES 
    ( IdCancion NUMBER(38,0) CONSTRAINT nnidcancion not null,
      CONSTRAINT fkcanciondisco foreign key (IdCancion) REFERENCES DISCOS(IdDisco),
      NombreCancion VARCHAR2(50) CONSTRAINT nnnombcancion not null,
      GeneroCancion VARCHAR2(50) CONSTRAINT nngencancion not null,
      Artista VARCHAR2(25) CONSTRAINT nnartistacancion not null             );
      
    
create table PODCAST
    ( IdPodcast NUMBER(10,0) CONSTRAINT pkidpodcast primary key,
      NombrePodcast VARCHAR2(50) CONSTRAINT nnnombpodcast not null,
      Podcaster VARCHAR2(50) CONSTRAINT nnpodcaster not null,
      FechaEstreno DATE CONSTRAINT nnfecestreno not null,
      Tematica VARCHAR2(50) CONSTRAINT nntematica not null            );
      
      
      
      
       
       
       
/*
    MODIFICACIONES
                    */
                    
alter table USUARIO add CONSTRAINT cknumtlfusuario 
                        CHECK (REGEXP_LIKE(NumTlf, '^[[:digit:]]{1,3}[[:space:]]{1}[[:digit:]]+$'));
                        
alter table USUARIO add CONSTRAINT cknombusuario 
                        CHECK (REGEXP_LIKE(NombreUsuario, '^[[:upper:]]{1}[[:graph:]]+$'));
                        
alter table SUSCRIPCION add CONSTRAINT ckcorreoelectronico
                        CHECK (REGEXP_LIKE(CorreoElectronico, '^[[:alpha:]]{1}[[:graph:]]{4,25}@[[:alpha:]]{5,19}.[[:alpha:]]{2,3}'));
                        
alter table SUSCRIPCION add CONSTRAINT ckcuentabancaria
                        CHECK (REGEXP_LIKE(CuentaBancaria, '^[[:upper:]]{2}[[:digit:]]{22}'));
                        
                        





/*
    Añadido, modificación y borrado de datos
                                                */
                                                
-- Añadido de datos.


INSERT INTO USUARIO values ('1', 'Rrbnz' , '10/05/2001', 'España', '34 651652838', NULL);
INSERT INTO USUARIO values ('2', 'Carmenmsb' , '09/06/1987', 'España', '34 687744858', NULL);
INSERT INTO USUARIO values ('3', 'Rocioacebedo_19' , '19/08/1989', 'España', '34 673307080', NULL);
INSERT INTO USUARIO values ('4', 'GonzxKZ' , '15/03/2001', 'España', '34 695375355', NULL);
INSERT INTO USUARIO values ('5', 'Martabaena_27' , '27/03/2002', 'España', '34 675354512', NULL);


INSERT INTO SUSCRIPCION values ('1', 'rrbnz@hotmail.com', 'Normal', 'CaixaBank', 'ES1111111111111111111111', '4,99', '12');
INSERT INTO SUSCRIPCION values ('2', 'carmen1987@gmail.com', 'Normal', 'BBVA', 'ES2222222222222222222222', '4,99', '5');
INSERT INTO SUSCRIPCION values ('3', 'r0ci04acebed0@yahoo.es', 'Premium', 'Santander', 'ES3333333333333333333333', '12,99', '7');
INSERT INTO SUSCRIPCION values ('4', 'gonzxKZ@gmail.com', 'Premium', 'Unicaja', 'ES4444444444444444444444', '12,99', '2');
INSERT INTO SUSCRIPCION values ('5', 'mbaenarodriguez@gmail.com', 'Normal', 'BBVA', 'ES5555555555555555555555', '4,99', '1');


INSERT INTO BIBLIOTECA values ('1', 'Rrbnz');
INSERT INTO BIBLIOTECA values ('2', 'Carmenmsb');
INSERT INTO BIBLIOTECA values ('3', 'Rocioacebedo_19');
INSERT INTO BIBLIOTECA values ('4', 'GonzxKZ');
INSERT INTO BIBLIOTECA values ('5', 'Martabaena_27');


INSERT INTO PLAYLIST values ('1', 'AAA', 'Rrbnz', '9', '1', '6', '5', '2');
INSERT INTO PLAYLIST values ('2', 'BBB', 'Carmenmsb', '1', '2', '5', '6', '9');
INSERT INTO PLAYLIST values ('3', 'CCC', 'Rocioacebedo_19', '1', '2', '9', '4', '5');
INSERT INTO PLAYLIST values ('4', 'DDD', 'GonzxKZ', '6', '8', '7', '1', '2');
INSERT INTO PLAYLIST values ('5', 'EEE', 'Martabaena_27', '2', '4', '3', '5', '9');


INSERT INTO HISTORIAL values ('1', 'Rrbnz');
INSERT INTO HISTORIAL values ('2', 'Carmenmsb');
INSERT INTO HISTORIAL values ('3', 'Rocioacebedo_19');
INSERT INTO HISTORIAL values ('4', 'GonzxKZ');
INSERT INTO HISTORIAL values ('5', 'Martabaena_27');


INSERT INTO DISCOS values ('1', 'Whats Going On', 'Pop', 'Marvin Gaye', '21/05/1971', 'Álbum');
INSERT INTO DISCOS values ('2', 'Abbey Road' , 'Rock', 'The Beatles', '26/09/1969', 'Álbum');
INSERT INTO DISCOS values ('3', 'Songs in the Key of Life' , 'Pop', 'Stevie Wonder', '28/09/1976', 'Álbum');
INSERT INTO DISCOS values ('4', 'Nevermind' , 'Rock', 'Nirvana', '24/09/1991', 'Álbum');
INSERT INTO DISCOS values ('5', 'Creep' , 'Rock', 'Radiohead', '21/09/1992', 'Single');
INSERT INTO DISCOS values ('6', 'Wouldnt It Be Nice' , 'Pop', 'The Beach Boys', '22/01/1966', 'EP');
INSERT INTO DISCOS values ('7', 'The Blue Room' , 'Rock', 'Coldplay', '11/10/1999', 'EP');
INSERT INTO DISCOS values ('8', 'Exile On Main Street' , 'Rock', 'The Rolling Stones', '12/05/1971', 'Álbum');
INSERT INTO DISCOS values ('9', 'I Never Loved a Man the Way I Love You' , 'Soul', 'Aretha Franklin', '10/03/1967', 'Álbum');
INSERT INTO DISCOS values ('10', 'See Emily Play' , 'Rock', 'Pink Floyd', '21/05/1967', 'Single');


INSERT INTO CANCIONES values ('1', 'Whats Happening Brother', 'Soul', 'Marvin Gaye');
INSERT INTO CANCIONES values ('1', 'Flyn High (in the Friendly Sky)', 'Pop', 'Marvin Gaye');
INSERT INTO CANCIONES values ('1', 'Save the Children', 'Pop', 'Marvin Gaye');
INSERT INTO CANCIONES values ('1', 'Mercy Mercy Me (The Ecology)', 'Soul', 'Marvin Gaye');
INSERT INTO CANCIONES values ('1', 'God Is Love', 'Soul', 'Marvin Gaye');
INSERT INTO CANCIONES values ('2', 'Come Together', 'Rock', 'The Beatles');
INSERT INTO CANCIONES values ('2', 'Something', 'Rock', 'The Beatles');
INSERT INTO CANCIONES values ('2', 'Maxwells Silver Hammer', 'Rock', 'The Beatles');
INSERT INTO CANCIONES values ('2', 'Oh! Darling', 'Indie', 'The Beatles');
INSERT INTO CANCIONES values ('2', 'Something', 'Indie', 'The Beatles');
INSERT INTO CANCIONES values ('3', 'Sir Duke', 'RandB', 'Stevie Wonder');
INSERT INTO CANCIONES values ('3', 'Isnt She Lovely', 'RandB', 'Stevie Wonder');
INSERT INTO CANCIONES values ('3', 'Pastime Paradise', 'Soul', 'Stevie Wonder');
INSERT INTO CANCIONES values ('3', 'Another Star', 'RandB', 'Stevie Wonder');
INSERT INTO CANCIONES values ('3', 'Summer Soft', 'Soul', 'Stevie Wonder');
INSERT INTO CANCIONES values ('4', 'Smells Like Teen Spirit', 'Indie', 'Nirvana');
INSERT INTO CANCIONES values ('4', 'In Bloom', 'Indie', 'Nirvana');
INSERT INTO CANCIONES values ('4', 'Come As You Are', 'Indie', 'Nirvana');
INSERT INTO CANCIONES values ('4', 'Breed', 'Indie', 'Nirvana');
INSERT INTO CANCIONES values ('4', 'Lithium', 'Indie', 'Nirvana');
INSERT INTO CANCIONES values ('5', 'Creep', 'Rock', 'Radiohead');
INSERT INTO CANCIONES values ('6', 'Wouldnt It Be Nice', 'Pop', 'The Beach Boys');
INSERT INTO CANCIONES values ('6', 'Dont Talk (Put Your Head On My Shoulder)', 'Pop', 'The Beach Boys');
INSERT INTO CANCIONES values ('6', 'God Only Knows', 'Pop', 'The Beach Boys');
INSERT INTO CANCIONES values ('6', 'I Know Theres An Answer', 'Pop', 'The Beach Boys');
INSERT INTO CANCIONES values ('7', 'Bigger Stronger', 'Indie', 'Coldplay');
INSERT INTO CANCIONES values ('7', 'Dont Panic', 'Indie', 'Coldplay');
INSERT INTO CANCIONES values ('7', 'See You Soon', 'Indie', 'Coldplay');
INSERT INTO CANCIONES values ('7', 'High Speed', 'Indie', 'Coldplay');
INSERT INTO CANCIONES values ('7', 'Such A Rush', 'Indie', 'Coldplay');
INSERT INTO CANCIONES values ('8', 'Rocks Off', 'Rock', 'The Rolling Stones');
INSERT INTO CANCIONES values ('8', 'Rip This Joint', 'Rock', 'The Rolling Stones');
INSERT INTO CANCIONES values ('8', 'Shake Your Hips', 'Rock', 'The Rolling Stones');
INSERT INTO CANCIONES values ('8', 'Casino Boggie', 'Rock', 'The Rolling Stones');
INSERT INTO CANCIONES values ('8', 'Tumbling Dice', 'Rock', 'The Rolling Stones');
INSERT INTO CANCIONES values ('9', 'Respect', 'Soul', 'Aretha Franklin');
INSERT INTO CANCIONES values ('9', 'Drown in My Own Tears', 'Soul', 'Aretha Franklin');
INSERT INTO CANCIONES values ('9', 'I Never Loved A Man the Way You Loved Me', 'Soul', 'Aretha Franklin');
INSERT INTO CANCIONES values ('9', 'Soul Serenade', 'Soul', 'Aretha Franklin');
INSERT INTO CANCIONES values ('9', 'Save Me', 'Soul', 'Aretha Franklin');
INSERT INTO CANCIONES values ('10', 'See Emily Play', 'Rock', 'Pink Floyd');


INSERT INTO PODCAST values ('1', 'The Wild Project', 'Jordi Wild', '03/03/2020', 'Cultura y sociedad');
INSERT INTO PODCAST values ('2', 'The Joe Rogan Experience', 'Joe Rogan', '24/12/2009', 'Cultura y sociedad');
INSERT INTO PODCAST values ('3', 'SmartLess', 'Will Arnett, Jason Bateman, Sean Hayes', '20/07/2020', 'Cultura y sociedad');
INSERT INTO PODCAST values ('4', 'Call Her Daddy', 'Alexandra Cooper, Sofia Franklyn', '09/08/2018', 'Comedia');
INSERT INTO PODCAST values ('5', 'Crime Junkie', 'Ashley Flowers, Britt Prawat', '27/01/2018', 'Crímenes');




-- Añadido de datos a partir de consultas.






-- Modificación masiva de datos realizando operaciones.

UPDATE SUSCRIPCION
    SET PrecioSuscripcion = PrecioSuscripcion*0.8;




-- Modificación de ciertos registros.

UPDATE USUARIO
    SET NumTlf = '34 666666666'
    WHERE NombreUsuario = 'Rrbnz';

UPDATE PODCAST
    SET Podcaster = 'Alexandra Cooper, Sofia Franklyn, Toñi Moreno'
    WHERE NombrePodcast = 'Call Her Daddy';
    
UPDATE SUSCRIPCION
    SET PrecioSuscripcion = PrecioSuscripcion*1.10
    WHERE TipoSuscripcion = 'Normal';
    
UPDATE SUSCRIPCION
    SET PrecioSuscripcion = PrecioSuscripcion*0.80
    WHERE TipoSuscripcion = 'Premium';    
    
    
    
    
-- Borrado masivo de datos.

DELETE FROM USUARIOS;

DELETE FROM SUSCRIPCION;

DELETE FROM BIBLIOTECA;

DELETE FROM HISTORIAL;

DELETE FROM DISCOS;

DELETE FROM CANCIONES;

DELETE FROM PODCAST;




-- Borrado de ciertos registros.

DELETE FROM DISCOS
    WHERE Artista = 'Marvin Gaye';
    
DELETE FROM PLAYLIST
    WHERE CreadorPlaylist = 'Rrbnz';







/*
    CONSULTAS
                */

-- Consultas con subconsultas. (Al menos dos distintas una con dos tablas y otra con tres)

    -- Canciones de todos los discos de Aretha Franklin en la aplicación.
    
        select NombreCancion, GeneroCancion, Artista
            from CANCIONES  
            where IdCancion IN ( select IdDisco
                                from DISCOS
                                where Artista = 'Aretha Franklin');
                            
    -- Canciones de discos de "Soul" o "Pop" en aplicación.
    
        select NombreCancion, GeneroCancion, Artista
            from CANCIONES  
            where IdCancion IN ( select IdDisco
                                from DISCOS
                                where GeneroDisco = 'Soul'
                                or GeneroDisco = 'Rock');
                            
    -- Playlists que tengan discos con canciones de Pop.
    
        select IdPlaylist, NombrePlaylist, CreadorPlaylist
            from PLAYLIST
            where Disco1 IN (select IdDisco
                             from DISCOS
                             where GeneroDisco = 'Pop')
            or Disco2 IN (select IdDisco
                             from DISCOS
                             where GeneroDisco = 'Pop')
            or Disco3 IN (select IdDisco
                             from DISCOS
                             where GeneroDisco = 'Pop')
            or Disco4 IN (select IdDisco
                             from DISCOS
                             where GeneroDisco = 'Pop')
            or Disco5 IN (select IdDisco
                             from DISCOS
                             where GeneroDisco = 'Pop');
        
                                                         
    -- Playlists que no tengan ninguna canción con el género "Indie".
    
    select IdPlaylist, NombrePlaylist, CreadorPlaylist
        from PLAYLIST
        where Disco1 IN (select IdDisco
                             from DISCOS
                             where IdDisco IN (select IdCancion
                                              from CANCIONES
                                              where GeneroCancion <> 'Indie'))
            and Disco2 IN (select IdDisco
                             from DISCOS
                             where IdDisco IN (select IdCancion
                                              from CANCIONES
                                              where GeneroCancion <> 'Indie'))
            and Disco3 IN (select IdDisco
                             from DISCOS
                             where IdDisco IN (select IdCancion
                                              from CANCIONES
                                              where GeneroCancion <> 'Indie'))
            and Disco4 IN (select IdDisco
                             from DISCOS
                             where IdDisco IN (select IdCancion
                                              from CANCIONES
                                              where GeneroCancion <> 'Indie'))
            and Disco5 IN (select IdDisco
                             from DISCOS
                             where IdDisco IN (select IdCancion
                                              from CANCIONES
                                              where GeneroCancion <> 'Indie'));
                                              
                                              
                                              
    
-- Consultas con los distintos tipos de join. (Al menos dos distintas una con dos tablas y otra con tres)

    -- Fusión tabla de discos y canciones.
    
    select d.IdDisco, d.NombreDisco, c.NombreCancion, d.Artista
        from DISCOS d
        full join CANCIONES c on d.IdDisco = c.IdCancion;

    -- Fusión tabla usuario, suscripción y playlist.
    
    select u.NombreUsuario, s.TipoSuscripcion, p.IdPlaylist, p.NombrePlaylist
        from USUARIO u
        right join SUSCRIPCION s on u.IdUsuario = s.IdSuscripcion
        left join PLAYLIST p on u.NombreUsuario = p.CreadorPlaylist;
    



-- Consultas con funciones de grupos. (Una con cada tipo avg, min, max, sum, count)

    -- Número de canciones y discos que están disponibles en nuestra aplicación.

    select count(IdCancion) as "Nº CANCIONES"
        from CANCIONES;
        
    select count(IdDisco) as "Nº DISCOS"
        from DISCOS;
        
    -- Número total de dinero ganado con las suscripciones.
        
    select sum(PrecioSuscripcion) as "DINERO TOTAL"
        from SUSCRIPCION;   

        

    
-- Consultas con funciones de grupos, agrupaciones y cláusula having. (Una con cada tipo avg, min, max, sum, count)

    -- Dinero que han dado los suscriptores normales en la aplicación.

    select IdSuscripcion, sum(PrecioSuscripcion*MesesSuscrito)
        from SUSCRIPCION
        where TipoSuscripcion = 'Normal'
        group by IdSuscripcion
        having avg(PrecioSuscripcion*MesesSuscrito) > 5;
        
        
    -- Ordenación del dinero que los usuarios han dado a la plataforma de mayor a menor.   
        
    select CorreoElectronico, sum(PrecioSuscripcion*MesesSuscrito) as DineroTotal
        from SUSCRIPCION
        group by CorreoElectronico
        order by DineroTotal desc;
        
        

-- Consultas con otro tipo de funciones.  (Al menos dos funciones distintas)

    -- Queremos mostrar que usuarios pueden disponer o no de una función de la aplicación respecto a los
    -- meses que lleven en la aplicación.
    
    select CorreoElectronico, MesesSuscrito, TipoSuscripcion,
    case
        WHEN MesesSuscrito > 2
        OR TipoSuscripcion = 'Premium' THEN 'Dispones de esta función'
        ELSE 'No dispones de esta función'
    end
    from SUSCRIPCION;

            
