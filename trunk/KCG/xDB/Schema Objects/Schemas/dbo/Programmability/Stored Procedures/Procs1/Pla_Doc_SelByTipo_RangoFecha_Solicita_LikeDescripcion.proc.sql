CREATE PROCEDURE dbo.Pla_Doc_SelByTipo_RangoFecha_Solicita_LikeDescripcion
(
	@p_Tipo varchar(3),
	@p_Fecha_Solicita_Ini smalldatetime,
	@p_Fecha_Solicita_Fin smalldatetime,
	@p_Descripcion varchar(100)
)
AS
	SET NOCOUNT ON;
SELECT        
	Id, 
	Codigo, 
	Tipo, 
	Fecha_Solicita, 
	Per_Personal_Id_Solicita,
	(select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Id_Solicita)
	) Per_Personal_Nombre_Solicita,
	Area_Codigo_Solicita,
	ISNULL((select ISNULL(vfa.Area_Nombre, '') from V_INT_Funcionario_Area vfa where vfa.Persona_Codigo in
		(select r.Numero from Par_Razon_Social r where r.Id in 
			(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Id_Solicita)
		)
	 ), '') Area_Nombre_Solicita,
	Descripcion,
	Estado, 
	Per_Personal_Id_Crea,
	(select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Id_Crea)
	) Per_Personal_Nombre_Crea,
	Per_Personal_Id_Modifica, 
	(select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Id_Modifica)
	) Per_Personal_Nombre_Modifica,
    Valor_Solicita, 
    Per_Personal_Id_Planifica,
    ISNULL((select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Id_Planifica)
	), '') Per_Personal_Nombre_Planifica,
    Esta_Planificada, 
    Per_Personal_Id_Contrata, 
    ISNULL((select r.Nombre from Par_Razon_Social r where r.Id in 
		(select p.Par_Razon_Social_Id from Per_Personal p where p.Id = Per_Personal_Id_Contrata)
	), '') Per_Personal_Nombre_Contrata,
    Esta_Contratada, 
    PAC_Linea, 
    CPC_Codigo, 
    Fecha_Contrata, 
    Fecha_Planifica,
    [dbo].[Pla_Mov_SumaMovs_ByPla_Doc_Id](doc.Id) Valor_Suma_Movs,
    Cedula_Presup_Codigo,
    Contrata_Desc,
    ISNULL(Pla_Tarea_Id,0) Pla_Tarea_Id,
    ISNULL((select t.Nombre from Pla_Tarea t where t.Id = Pla_Tarea_Id), '') Pla_Tarea_Nombre,
    ISNULL((select t.Pla_Cta_Id from Pla_Tarea t where t.Id = Pla_Tarea_Id), 0) Pla_Cta_Id,
    isnull((select c.Codigo from Pla_Cta c where c.Id = 
		(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = Pla_Tarea_Id)
	), '') Pla_Cta_Codigo,
	isnull((select c.Nombre from Pla_Cta c where c.Id = 
		(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = Pla_Tarea_Id)
	), '') Pla_Cta_Nombre,
  CASE (SELECT COUNT(*) FROM Com_Contrato cc WHERE cc.Pla_Doc_Id = doc.Id)
  	WHEN 0 THEN 'Pendiente'
  	WHEN 1 THEN 'En Proceso'
  	ELSE 'Error'
  END  Estado_Proceso
FROM Pla_Doc doc
where  
	Tipo = @p_Tipo
and	Fecha_Solicita between @p_Fecha_Solicita_Ini and @p_Fecha_Solicita_Fin
and UPPER( Descripcion )like '%' + UPPER( @p_Descripcion ) + '%'
order by Area_Codigo_Solicita, Fecha_Solicita
