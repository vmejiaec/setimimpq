CREATE PROCEDURE dbo.Int_Contrato_ByCodigo_Institucional
(
  @p_Codigo_Institucional varchar(200),
  @p_Contrato_Tipo varchar(3) = '1'
)
AS
	SET NOCOUNT ON;
BEGIN

	declare 
		@v_Contrato_Tipo int;

--	if (@p_Contrato_Tipo = 'PRI')
--		set @v_Contrato_Tipo = 1;
--	else if (@p_Contrato_Tipo = 'CO1')
--		set @v_Contrato_Tipo = 0;
		
	--exec Fonsal_Contratos.dbo.Fon_Con_ByCodigo_Institucional @p_Codigo_Institucional ;
	--SELECT  
	--		Codigo_Institucional Codigo_Institucional,
	--		Prog_Nombre Programa,  --bien
	--		Tipc_Nombre	Tipo_Contrato_Legal, --bien
	--		Ubi_Nombre Ubicacion, --bien
	--		Proy_Nombre Proyecto_Nombre,--bien
	--		SProy_Nombre SubProyecto_Nombre,--bien
	--		Frm_Idincop Categoria, --bien
	--		Con_CedRuc Contratista_Cedula, --bien
	--		Cto_Fecha_Adjudica Fecha_Contrato_Adjudicacion,-- bien
	--		Cto_Fecha Fecha_Contrato_Firma, -- bien
	--		-- SI ES UN CONTRATO PRINCIPAL, SE TOMA LA FECHA Cto_Fce_Oferta
	--		-- SI ES UN CONTRATO COMPLEMENTARIO SE TOMA LA FECHA Cto_Fce_Oferta
	--		--(CASE Ctot_Id WHEN 1 THEN Cto_Fce_Oferta ELSE Cto_Fce_Oferta END) Fecha_Oferta_Cierre, --bien
	--		Cto_Fce_Oferta Fecha_Oferta_Cierre,
	--		Cto_Apu_Fecha Fecha_APU_Aprobacion, --bien
	--		Cto_Plazo	Plazo, -- bien
	--		Cto_Anticipo	Anticipo_Porcentaje,-- bien
	--		Fun_Cedula	Coordinador1_Cedula,-- bien
	--		Fun_Cedula2	Coordinador2_Cedula  --bien
	--		convert(varchar,Ctot_Id) Contrato_Tipo -- Devuelve 1-->PRINCIPAL 0--> COMPLEMENTARIO
	--FROM SACP.dbo.ViewDatosProyectos sacpProy
  --  WHERE sacpProy.Codigo_Institucional = @p_Codigo_Institucional
	--And Frm_Estado in (0,1)
  --  AND Ctot_Id = @v_Contrato_Tipo

set @v_Contrato_Tipo = 1;

	SELECT  
				sacpProy.Pla_Tarea_Id Codigo_Institucional,
			sacpProy.Descripcion Programa,  --bien
			'PRINCIPAL'	Tipo_Contrato_Legal, --bien
			'ZONA METROPOLITANA CENTRO' Ubicacion, --bien
			'Proy_Nombre' Proyecto_Nombre,--bien
			'SProy_Nombre' SubProyecto_Nombre,--bien
			'Frm_Idincop' Categoria, --bien
			'1710120682001' Contratista_Cedula, --bien
			sacpProy.Fecha_Solicita Fecha_Contrato_Adjudicacion,-- bien
			sacpProy.Fecha_Solicita Fecha_Contrato_Firma, -- bien
			-- SI ES UN CONTRATO PRINCIPAL, SE TOMA LA FECHA Cto_Fce_Oferta
			-- SI ES UN CONTRATO COMPLEMENTARIO SE TOMA LA FECHA Cto_Fce_Oferta
			--(CASE Ctot_Id WHEN 1 THEN Cto_Fce_Oferta ELSE Cto_Fce_Oferta END) Fecha_Oferta_Cierre, --bien
			sacpProy.Fecha_Solicita Fecha_Oferta_Cierre,
			sacpProy.Fecha_Solicita Fecha_APU_Aprobacion, --bien
			120	Plazo, -- bien
			30.00	Anticipo_Porcentaje,-- bien
			'1716204134'	Coordinador1_Cedula,-- bien
			''	Coordinador2_Cedula,  --bien
			'1' Contrato_Tipo -- Devuelve 1-->PRINCIPAL 0--> COMPLEMENTARIO
	FROM Pla_Doc  sacpProy
    WHERE sacpProy.Id = 49
END
