CREATE PROCEDURE [dbo].[Com_Contrato_Upd]
(
	@Pla_Doc_Id int,
	@Estado char(3),
	@Com_Procedimiento_Id int,
	@Porcentaje_Anticipo_Ref numeric(17, 4),
	@Plazo_Ref int,
	@Codigo_Sercop varchar(200),
	@Per_Personal_Resp_Exp varchar(17),
	@Fecha_Cierre_Rec_Ofertas smalldatetime,
	@Par_Razon_Social_Id_Contratista varchar(17),
	@Valor_Contrato numeric(17, 4),
	@Plazo_Contrato int,
	@Fecha_Inicio_Contrato smalldatetime,
	@Porcentaje_Anticipo_Contrato numeric(17, 4),
	@Per_Personal_Id_Admin varchar(17),
	@Desc_Contrata varchar(300),
	@Fecha_Crea smalldatetime,
	@Com_Procedimiento_Desc varchar(250),
	@Estado_Portal char(3),
	@Estado_Contratacion varchar(250),
	@Fecha_Inicio_Elabora_Pliegos smalldatetime,
	@Fecha_Publicacion_Portal smalldatetime,
	@Fecha_Calificaciones smalldatetime,
	@Fecha_Estimada_Adjudicacion smalldatetime,
	@Fecha_Adjudicacion smalldatetime,
	@Fecha_Juridico smalldatetime,
	@Original_Id int,
	@Original_Pla_Doc_Id int,
	@Original_Estado char(3),
	@Original_Com_Procedimiento_Id int,
	@Original_Porcentaje_Anticipo_Ref numeric(17, 4),
	@Original_Plazo_Ref int,
	@Original_Codigo_Sercop varchar(200),
	@IsNull_Per_Personal_Resp_Exp INT = 0,
	@Original_Per_Personal_Resp_Exp varchar(17),
	@Original_Fecha_Cierre_Rec_Ofertas smalldatetime,
	@IsNull_Par_Razon_Social_Id_Contratista INT = 0,
	@Original_Par_Razon_Social_Id_Contratista varchar(17),
	@Original_Valor_Contrato numeric(17, 4),
	@Original_Plazo_Contrato int,
	@Original_Fecha_Inicio_Contrato smalldatetime,
	@Original_Porcentaje_Anticipo_Contrato numeric(17, 4),
	@IsNull_Per_Personal_Id_Admin INT = 0,
	@Original_Per_Personal_Id_Admin varchar(17),
	@Original_Desc_Contrata varchar(300),
	@Original_Fecha_Crea smalldatetime,
	@IsNull_Com_Procedimiento_Desc INT = 0,
	@Original_Com_Procedimiento_Desc varchar(250),
	@Original_Estado_Portal char(3),
	@Original_Estado_Contratacion varchar(250),
	@Original_Fecha_Inicio_Elabora_Pliegos smalldatetime,
	@Original_Fecha_Publicacion_Portal smalldatetime,
	@Original_Fecha_Calificaciones smalldatetime,
	@Original_Fecha_Estimada_Adjudicacion smalldatetime,
	@Original_Fecha_Adjudicacion smalldatetime,
	@Original_Fecha_Juridico smalldatetime,
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Contrato] SET [Pla_Doc_Id] = @Pla_Doc_Id, [Estado] = @Estado, [Com_Procedimiento_Id] = @Com_Procedimiento_Id, [Porcentaje_Anticipo_Ref] = @Porcentaje_Anticipo_Ref, [Plazo_Ref] = @Plazo_Ref, [Codigo_Sercop] = @Codigo_Sercop, [Per_Personal_Resp_Exp] = @Per_Personal_Resp_Exp, [Fecha_Cierre_Rec_Ofertas] = @Fecha_Cierre_Rec_Ofertas, [Par_Razon_Social_Id_Contratista] = @Par_Razon_Social_Id_Contratista, [Valor_Contrato] = @Valor_Contrato, [Plazo_Contrato] = @Plazo_Contrato, [Fecha_Inicio_Contrato] = @Fecha_Inicio_Contrato, [Porcentaje_Anticipo_Contrato] = @Porcentaje_Anticipo_Contrato, [Per_Personal_Id_Admin] = @Per_Personal_Id_Admin, [Desc_Contrata] = @Desc_Contrata, [Fecha_Crea] = @Fecha_Crea, [Com_Procedimiento_Desc] = @Com_Procedimiento_Desc, [Estado_Portal] = @Estado_Portal, [Estado_Contratacion] = @Estado_Contratacion, [Fecha_Inicio_Elabora_Pliegos] = @Fecha_Inicio_Elabora_Pliegos, [Fecha_Publicacion_Portal] = @Fecha_Publicacion_Portal, [Fecha_Calificaciones] = @Fecha_Calificaciones, [Fecha_Estimada_Adjudicacion] = @Fecha_Estimada_Adjudicacion, [Fecha_Adjudicacion] = @Fecha_Adjudicacion, [Fecha_Juridico] = @Fecha_Juridico WHERE (([Id] = @Original_Id) AND ([Pla_Doc_Id] = @Original_Pla_Doc_Id) AND ([Estado] = @Original_Estado) AND ([Com_Procedimiento_Id] = @Original_Com_Procedimiento_Id) AND ([Porcentaje_Anticipo_Ref] = @Original_Porcentaje_Anticipo_Ref) AND ([Plazo_Ref] = @Original_Plazo_Ref) AND ([Codigo_Sercop] = @Original_Codigo_Sercop) 
  --AND ((@IsNull_Per_Personal_Resp_Exp = 1 AND [Per_Personal_Resp_Exp] IS NULL) OR ([Per_Personal_Resp_Exp] = @Original_Per_Personal_Resp_Exp)) 
  --AND ([Fecha_Cierre_Rec_Ofertas] = @Original_Fecha_Cierre_Rec_Ofertas) 
  --AND ((@IsNull_Par_Razon_Social_Id_Contratista = 1 AND [Par_Razon_Social_Id_Contratista] IS NULL) OR ([Par_Razon_Social_Id_Contratista] = @Original_Par_Razon_Social_Id_Contratista)) 
  AND ([Valor_Contrato] = @Original_Valor_Contrato) AND ([Plazo_Contrato] = @Original_Plazo_Contrato) AND ([Fecha_Inicio_Contrato] = @Original_Fecha_Inicio_Contrato) AND ([Porcentaje_Anticipo_Contrato] = @Original_Porcentaje_Anticipo_Contrato) 
  --AND ((@IsNull_Per_Personal_Id_Admin = 1 AND [Per_Personal_Id_Admin] IS NULL) OR ([Per_Personal_Id_Admin] = @Original_Per_Personal_Id_Admin)) 
  AND ([Desc_Contrata] = @Original_Desc_Contrata) AND ([Fecha_Crea] = @Original_Fecha_Crea) 
  --AND ((@IsNull_Com_Procedimiento_Desc = 1 AND [Com_Procedimiento_Desc] IS NULL) OR ([Com_Procedimiento_Desc] = @Original_Com_Procedimiento_Desc)) 
  AND ([Estado_Portal] = @Original_Estado_Portal) AND ([Estado_Contratacion] = @Original_Estado_Contratacion) AND ([Fecha_Inicio_Elabora_Pliegos] = @Original_Fecha_Inicio_Elabora_Pliegos) AND ([Fecha_Publicacion_Portal] = @Original_Fecha_Publicacion_Portal) AND ([Fecha_Calificaciones] = @Original_Fecha_Calificaciones) AND ([Fecha_Estimada_Adjudicacion] = @Original_Fecha_Estimada_Adjudicacion) AND ([Fecha_Adjudicacion] = @Original_Fecha_Adjudicacion) AND ([Fecha_Juridico] = @Original_Fecha_Juridico));
	
SELECT Id, Pla_Doc_Id, Estado, Com_Procedimiento_Id, Porcentaje_Anticipo_Ref, Plazo_Ref, Codigo_Sercop, Per_Personal_Resp_Exp, Fecha_Cierre_Rec_Ofertas, Par_Razon_Social_Id_Contratista, Valor_Contrato, Plazo_Contrato, Fecha_Inicio_Contrato, Porcentaje_Anticipo_Contrato, Per_Personal_Id_Admin, Desc_Contrata, Fecha_Crea, Com_Procedimiento_Desc, Estado_Portal, Estado_Contratacion, Fecha_Inicio_Elabora_Pliegos, Fecha_Publicacion_Portal, Fecha_Calificaciones, Fecha_Estimada_Adjudicacion, Fecha_Adjudicacion, Fecha_Juridico FROM Com_Contrato WHERE (Id = @Id)
