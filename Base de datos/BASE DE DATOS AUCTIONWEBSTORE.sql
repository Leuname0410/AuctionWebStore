CREATE DATABASE DBAUCTIONWEBSTORE;
GO
USE DBAUCTIONWEBSTORE;
GO
--drop database DBAUCTIONWEBSTORE

CREATE TABLE tblUSUario_AWS
(intIdUsu INT IDENTITY PRIMARY KEY NOT NULL,
strUsuarioUsu VARCHAR(50) NOT NULL,
strContraUsu VARCHAR(50) NOT NULL,
strNombreUsu VARCHAR(50) NOT NULL,
strApellidoUsu VARCHAR(50) NOT NULL,
strDocUsu VARCHAR(50) NOT NULL,
intRolUsu int  NOT NULL,
intEstadoUsu  int  NOT NULL,
strTipoDoc_TIPO VARCHAR (2) NOT NULL,
strTelUsu VARCHAR(20),
intCiudadUsu INT NOT NULL
);
GO

CREATE TABLE tblTIpoUsu_AWS
(intIdRol INT IDENTITY PRIMARY KEY NOT NULL,
strDescripRol VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tblTIpoDOc_AWS
(strCodTipoDoc VARCHAR(2) PRIMARY KEY NOT NULL,
strDescripTipDoc VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tblREMate_AWS
(intIdRem INT IDENTITY PRIMARY KEY NOT NULL,
blEstadoRem BIT DEFAULT 1 NOT NULL,
strFechaIniRem VARCHAR(50) NOT NULL,
strFechaFinRem VARCHAR(50) NOT NULL,
strFechaPublRem VARCHAR(50) NOT NULL,
strNombreArticuloRem VARCHAR(50) NOT NULL,
strDescripcionRem VARCHAR(100) NOT NULL,
intIdCategoriaRem_CAT INT NOT NULL,
flPrecioRem FLOAT NOT NULL
);
GO

CREATE TABLE tblCATegoria_AWS
(intIdCat INT IDENTITY PRIMARY KEY NOT NULL,
strNombreCat VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tblOFErta_AWS
(intIdOfe INT IDENTITY PRIMARY KEY NOT NULL,
intIdRem_REM INT NOT NULL,
flPrecioOfe FLOAT NOT NULL,
intIdUsuPfe_USU INT NOT NULL
);
GO

CREATE TABLE tblPAGo_AWS
(intIdPag INT IDENTITY PRIMARY KEY NOT NULL,
blEstadoPag BIT DEFAULT 1 NOT NULL,
intIdFac_FAC INT NOT NULL,
flPrecioPag_FAC FLOAT NOT NULL,
flComisionPag FLOAT NOT NULL,
strFechaPag_FAC VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tblFACtura_AWS
(intIdFac INT IDENTITY PRIMARY KEY NOT NULL,
flPrecioFac FLOAT NOT NULL,
strFechaFac VARCHAR(50) NOT NULL,
inIdUsuFac_USU INT NOT NULL
);
GO

CREATE TABLE tblDEtalleFActura_AWS
(intIdFac_FAC INT NOT NULL,
intIdRem_REM INT NOT NULL,
flpPrecioUni FLOAT NOT NULL,
strDescripcionFac VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tblDEPartamento_AWS
(intIdDep INT IDENTITY PRIMARY KEY NOT NULL,
strDecripcionDep VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tblEstados_AWS
(intIdEstado INT IDENTITY PRIMARY KEY NOT NULL,
strDecripcionEstado VARCHAR(50) NOT NULL
);
GO

CREATE TABLE tblCIUdad_AWS
(intIdCiu INT IDENTITY PRIMARY KEY NOT NULL,
strDescripcionCiu VARCHAR(100) NOT NULL,
intIdDep_DEP INT NOT NULL
);
GO

CREATE TABLE tblDIrecUSuario_AWS
(intCodDireUsu INT IDENTITY PRIMARY KEY NOT NULL,
intIdUsu_USU INT NOT NULL,
intIdCiu_CIU INT NOT NULL,
strDescripDirecUsu VARCHAR(100) NOT NULL
);
GO

ALTER TABLE tblREMate_AWS ADD FOREIGN KEY (intIdCategoriaRem_CAT) REFERENCES tblCATegoria_AWS (intIdCat);
ALTER TABLE tblOFErta_AWS ADD FOREIGN KEY (intIdRem_REM) REFERENCES tblREMate_AWS (intIdRem);
ALTER TABLE tblOFErta_AWS ADD FOREIGN KEY (intIdUsuPfe_USU) REFERENCES tblUSUario_AWS (intIdUsu);
--ALTER TABLE tblUSUario_AWS ADD FOREIGN KEY (intIdDireUsu_DIUS) REFERENCES tblDIrecUSuario_AWS (intCodDireUsu);--referencia en ambos lados
ALTER TABLE tblPAGo_AWS ADD FOREIGN KEY (intIdFac_FAC) REFERENCES tblFACtura_AWS (intIdFac);
--ALTER TABLE tblPAGo_AWS ADD FOREIGN KEY (flPrecioPag_FAC) REFERENCES tblFACtura_AWS (flPrecioFac);
--ALTER TABLE tblPAGo_AWS ADD FOREIGN KEY (strFechaPag_FAC) REFERENCES tblFACtura_AWS (strFechaFac);
--ALTER TABLE tblFACtura_AWS ADD FOREIGN KEY (intIdUsuFac_USU) REFERENCES tblUSUario_AWS (intIdUsu);
ALTER TABLE tblDEtalleFActura_AWS ADD FOREIGN KEY (intIdFac_FAC) REFERENCES tblFACtura_AWS (intIdFac);
ALTER TABLE tblDEtalleFActura_AWS ADD FOREIGN KEY (intIdRem_REM) REFERENCES tblREMate_AWS (intIdRem);
ALTER TABLE tblCIUdad_AWS ADD FOREIGN KEY (intIdDep_DEP) REFERENCES tblDEPartamento_AWS (intIdDep);
ALTER TABLE tblDIrecUSuario_AWS ADD FOREIGN KEY (intIdUsu_USU) REFERENCES tblUSUario_AWS (intIdUsu);
ALTER TABLE tblDIrecUSuario_AWS ADD FOREIGN KEY (intIdCiu_CIU) REFERENCES tblCIUdad_AWS (intIdCiu);
ALTER TABLE tblUSUario_AWS ADD FOREIGN KEY (strTipoDoc_TIPO) REFERENCES tblTIpoDOc_AWS (strCodTipoDoc);
ALTER TABLE tblUSUario_AWS ADD FOREIGN KEY (intCiudadUsu) REFERENCES tblCIUdad_AWS (intIdCiu);
ALTER TABLE tblUSUario_AWS ADD FOREIGN KEY (intRolUsu) REFERENCES  tblTIpoUsu_AWS (intIdRol);
ALTER TABLE tblUSUario_AWS ADD FOREIGN KEY (intEstadoUsu) REFERENCES  tblEstados_AWS (intIdEstado);
GO

INSERT INTO tblTIpoDOc_AWS VALUES
('CC', 'Cédula de Ciudadanía'),
('NI', 'NIT'),
('NU', 'NUIP'),
('RU', 'RUT'),
('CE', 'Cédula de Extranjería'),
('PA', 'Pasaporte'),
('TI', 'Tarjeta de Identidad'),
('RC', 'Registro Civil')
GO


INSERT INTO  tblTIpoUsu_AWS VALUES
('Administrador'),
('Usuario'),
('Proveedor')
GO 

INSERT INTO tblEstados_AWS values
('Activo'),
('Icantivo'),
('Vetado')
GO

INSERT INTO tblDEPartamento_AWS values ('Antioquia'),('Cundinamarca'),('Valle') ;
Go
INSERT INTO tblCIUdad_AWS values ('Medellin',1),('Bello',1),('Bogota',2),('Suba',2),('Cali',3),('Andalucia',3) ;
Go
-- ========== Relacionada con: tblTIpoDOc_AWS ============= 

create procedure USP_CIUDAD_BuscarPorDepto
@intIdDepto int
as
begin
	SELECT intIdCiu Codigo,
	strDescripcionCiu Nombre
	FROM tblCIUdad_AWS
	where intIdDep_DEP = @intIdDepto
--EXEC USP_CIUDAD_BuscarPorDepto 2
END
GO

CREATE PROCEDURE USP_DEPARTAMENTOS
AS
 BEGIN
	SELECT intIdDep Codigo,
	strDecripcionDep Nombre
	FROM tblDEPartamento_AWS
	ORDER BY Nombre
 -- EXEC USP_DEPARTAMENTOS
--delete from tblDEPartamento_AWS where intIdDep in (6);
-- Select * from tblCIUdad_AWS
 END
 GO


CREATE PROCEDURE USP_TipoRol_BuscarGeneral  
AS  
  BEGIN 
    SELECT intIdRol AS Codigo, strDescripRol AS Nombre
      FROM tblTIpoUsu_AWS
	  ORDER BY Nombre
  END 
   -- Exec USP_TipoRol_BuscarGeneral; 
GO

CREATE PROCEDURE USP_Estado_BuscarGeneral  
AS  
  BEGIN 
    SELECT intIdEstado AS Codigo, strDecripcionEstado AS Nombre
      FROM tblEstados_AWS
	  ORDER BY Nombre
  END 
   -- Exec USP_Estado_BuscarGeneral; 
GO

CREATE PROCEDURE USP_TipoDoc_LlenarCombo
AS
	BEGIN
		SELECT strCodTipoDoc AS Codigo, strDescripTipDoc AS Nombre
			FROM tblTIpoDOc_AWS
		ORDER BY Codigo
-- EXEC USP_TipoDoc_LlenarCombo;
END
GO

/*RELACIONADO CON USUARIO*/


CREATE PROCEDURE USP_Usuario_BuscarXDocumento  
@strDoc VARCHAR(50)
AS  
  BEGIN 
    SELECT intIdUsu AS codigo,
			strTipoDoc_TIPO as TipoDoc,
			strDocUsu as Documento,
			strNombreUsu AS Nombre,
		   strApellidoUsu  AS Apellido,
		   strTelUsu as Telefono,
		   ci.intIdDep_DEP as Depto,
		   ci.intIdCiu AS Ciudad,
		   intRolUsu as Rol,
		   dr.strDescripDirecUsu as Direccion,
		   intEstadoUsu as Estado,
		   strUsuarioUsu as Email,
		   strContraUsu as Contrasenia
	FROM tblUSUario_AWS 
	INNER JOIN tblDIrecUSuario_AWS dr ON intIdUsu_USU = intIdUsu 
	INNER JOIN tblCIUdad_AWS ci ON intCiudadUsu =  intIdCiu
	WHERE strDocUsu = @strDoc 
  END 
GO


CREATE PROCEDURE USP_ClienteNatural_Grabar
@strUsuario VARCHAR (50),
@strContra VARCHAR (50),
@strNombre VARCHAR (50),
@strApellido VARCHAR (50),
@strDoc VARCHAR(50),
@intRol INT,
@intEstado bit,
@strTipodoc VARCHAR(2),
@strTel VARCHAR(20),
@intCiudad INT,
@strDirec VARCHAR(100)
AS
 BEGIN
	IF EXISTS( SELECT *
			FROM tblUSUario_AWS
			WHERE strDocUsu =@strDoc )
	Begin
		SELECT -1 AS Rpta
		Return
	end
	ELSE
	Begin
		BEGIN TRANSACTION tx
		INSERT INTO tblUSUario_AWS (strUsuarioUsu, strContraUsu, strNombreUsu, strApellidoUsu, strDocUsu,
			intRolUsu,intEstadoUsu,strTipoDoc_TIPO,strTelUsu,intCiudadUsu) values (@strUsuario,@strContra,@strNombre,@strApellido,@strDoc,
			@intRol,@intEstado,@strTipodoc,@strTel,@intCiudad);
		IF ( @@ERROR > 0 )
		BEGIN
			SELECT 0 AS Rpta
			Return
		END
		INSERT INTO tblDIrecUSuario_AWS
				VALUES (@@identity, @intCiudad,@strDirec);
		IF ( @@ERROR > 0 )
		BEGIN
			ROLLBACK TRANSACTION tx
			SELECT 0 AS Rpta
			Return
		END
		COMMIT TRANSACTION tx
		SELECT @@identity AS Rpta -- SELECT @@identity AS Rpta
		Return
	END
-- EXEC USP_ClienteNatural_Grabar 'carlos@gmail.com','123','Juan ','Díaz Mosquera','123456',1,0,'CC','2111886',1,'Calle 33'
-- select * from tblUSUario_AWS
--- Select * from tblCIUdad_AWS
---delete from tblCIUdad_AWS where intIdCiu between 7 and 7
select * from  tblDIrecUSuario_AWS
 END
GO


CREATE PROCEDURE USP_ClienteNatural_Modificar
@strUsuario VARCHAR (50),
@strContra VARCHAR (50),
@strNombre VARCHAR (50),
@strApellido VARCHAR (50),
@intRol INT,
@intEstado bit,
@strTel VARCHAR(20),
@intCiudad INT,
@strDirec VARCHAR (100),
@intCodUsu int
As
	BEGIN
		BEGIN TRANSACTION tx
			UPDATE tblUSUario_AWS
			exec USP_ClienteNatural_Modificar 'carlos@gmail.com','123','Juan ','Díaz Mosquera',1,3,'2111886',3,'Calle 33',1
			SET strUsuarioUsu  = @strUsuario,
				strContraUsu = @strContra,
				strNombreUsu  = @strNombre,
				strApellidoUsu = @strApellido,
				intRolUsu = @intRol,
				intEstadoUsu	= @intEstado,	
				strTelUsu = @strTel,
				intCiudadUsu = @intCiudad
			WHERE intIdUsu = @intCodUsu
			IF ( @@ERROR > 0 )
			BEGIN
				SELECT 0 AS Rpta
				Return
			END
			UPDATE tblDIrecUSuario_AWS
			SET	strDescripDirecUsu = @strDirec
			where intIdUsu_USU = @intCodUsu
			IF ( @@ERROR > 0 )
			BEGIN
				ROLLBACK TRANSACTION tx
				SELECT 0 AS Rpta
				Return
			END
			COMMIT TRANSACTION tx
			SELECT @intCodUsu AS RESPUESTA
				RETURN
	END
GO



CREATE PROCEDURE USP_ClienteNatural_Eliminar
@strDoc VARCHAR (50)
As
	BEGIN
		BEGIN TRANSACTION tx
			IF NOT EXISTS(SELECT * FROM tblUSUario_AWS WHERE strDocUsu = @strDoc)
					BEGIN
						ROLLBACK TRANSACTION tx
						SELECT -1 AS RESPUESTA
						RETURN
					END
				ELSE
					BEGIN
						DELETE FROM tblUSUario_AWS
							WHERE strDocUsu = @strDoc
						IF ( @@ERROR > 0 )
							BEGIN
								ROLLBACK TRANSACTION tx
								SELECT 0 AS RESPUESTA
								RETURN
							END
						COMMIT TRANSACTION tx
						SELECT @strDoc AS RESPUESTA
						RETURN
					END
	END
GO