CREATE PROCEDURE dbo.Com_Contrato_SelById
(
  @p_Id int
)
AS
--	SET NOCOUNT ON;
SELECT        
	Id, 
	Pla_Doc_Id, 
	Estado, 
	Com_Procedimiento_Id, 
	Porcentaje_Anticipo_Ref, 
	Plazo_Ref, 
	Codigo_Sercop, 
	Per_Personal_Resp_Exp, 
	Fecha_Cierre_Rec_Ofertas, 
    Par_Razon_Social_Id_Contratista, 
    Valor_Contrato, 
    Plazo_Contrato, 
    Fecha_Inicio_Contrato, 
    Porcentaje_Anticipo_Contrato,
    Per_Personal_Id_Admin, 
	Desc_Contrata,
	-- Tarea
	(select doc.Pla_Tarea_Id from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Tarea_Id,
	(select tar.Codigo from Pla_Tarea tar where tar.Id =
		(select doc.Pla_Tarea_Id from Pla_Doc doc where doc.Id = Pla_Doc_Id)
	) Pla_Tarea_Codigo,
	(select tar.Nombre from Pla_Tarea tar where tar.Id =
		(select doc.Pla_Tarea_Id from Pla_Doc doc where doc.Id = Pla_Doc_Id)
	) Pla_Tarea_Nombre,
	-- Persona Administrador
	ISNULL((select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Id_Admin)
	), '') Per_Personal_Nombre_Admin,
	-- Presupuesto es la suma de los movimientos de ese doc
	 - [dbo].[Pla_Mov_SumaMovs_ByPla_Doc_Id](Pla_Doc_Id) Valor_Suma_Movs,
	-- Tipo del proceso
	(select pro.Tipo from Com_Procedimiento pro where pro.Id = Com_Procedimiento_Id) Com_Procedimiento_Tipo,
	(select pro.Nombre from Com_Procedimiento pro where pro.Id = Com_Procedimiento_Id) Com_Procedimiento_Nombre,
	-- Personal Responsable del Expediente
	ISNULL((select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Resp_Exp)
	), '') Per_Personal_Nombre_Resp_Exp,
	-- Personal que solicita 
	(select doc.Per_Personal_Id_Solicita from Pla_Doc doc where doc.Id = Pla_Doc_Id ) Per_Personal_Id_Solicita,
	ISNULL((select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = 
			(select doc.Per_Personal_Id_Solicita from Pla_Doc doc where doc.Id = Pla_Doc_Id )
		)
	), '') Per_Personal_Nombre_Solicita,
	-- Fecha Creación del Registro y que va al reporte
	Fecha_Crea,
	--
	-- Nombre y RUC o Cédula del contratista ganador
	ISNULL((select r.Nombre from Par_Razon_Social r where r.Id = Par_Razon_Social_Id_Contratista), '') Par_Razon_Social_Nombre_Contratista,
	ISNULL((select r.Numero from Par_Razon_Social r where r.Id = Par_Razon_Social_Id_Contratista), '') Par_Razon_Social_Numero_Contratista,
	--
	-- Pla_Doc
	(select doc.Cedula_Presup_Codigo from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_Cedula_Presup_Codigo,
	(select doc.CPC_Codigo from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_CPC_Codigo,
	(select doc.PAC_Linea from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_PAC_Linea,
	(select doc.Codigo from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_Codigo,
	(select doc.Valor_Solicita from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_Valor_Solicita,
	--
	-- Pla_Cta
	(select tar.Pla_Cta_Id from Pla_Tarea tar where tar.Id =
		(select doc.Pla_Tarea_Id from Pla_Doc doc where doc.Id = Pla_Doc_Id)) Pla_Cta_Id,
	(select cta.Codigo from Pla_Cta cta where cta.Id =
		(select tar.Pla_Cta_Id from Pla_Tarea tar where tar.Id =
			(select doc.Pla_Tarea_Id from Pla_Doc doc where doc.Id = Pla_Doc_Id))) Pla_Cta_Codigo,
	(select cta.Nombre from Pla_Cta cta where cta.Id =
		(select tar.Pla_Cta_Id from Pla_Tarea tar where tar.Id =
			(select doc.Pla_Tarea_Id from Pla_Doc doc where doc.Id = Pla_Doc_Id))) Pla_Cta_Nombre,
  Com_Procedimiento_Desc,
  -- Datos del seguimiento de procesos
  Estado_Portal, 
  Estado_Contratacion, 
  Fecha_Inicio_Elabora_Pliegos, 
  Fecha_Publicacion_Portal,
  Fecha_Calificaciones, 
  Fecha_Estimada_Adjudicacion, 
  Fecha_Adjudicacion, 
  Fecha_Juridico
FROM	Com_Contrato
where Id = @p_Id
