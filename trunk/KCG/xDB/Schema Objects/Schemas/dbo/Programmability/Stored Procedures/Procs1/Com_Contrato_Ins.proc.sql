CREATE PROCEDURE [dbo].Com_Contrato_Ins
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
	@Fecha_Juridico smalldatetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Contrato] ([Pla_Doc_Id], [Estado], [Com_Procedimiento_Id], [Porcentaje_Anticipo_Ref], [Plazo_Ref], [Codigo_Sercop], [Per_Personal_Resp_Exp], [Fecha_Cierre_Rec_Ofertas], [Par_Razon_Social_Id_Contratista], [Valor_Contrato], [Plazo_Contrato], [Fecha_Inicio_Contrato], [Porcentaje_Anticipo_Contrato], [Per_Personal_Id_Admin], [Desc_Contrata], [Fecha_Crea], [Com_Procedimiento_Desc], [Estado_Portal], [Estado_Contratacion], [Fecha_Inicio_Elabora_Pliegos], [Fecha_Publicacion_Portal], [Fecha_Calificaciones], [Fecha_Estimada_Adjudicacion], [Fecha_Adjudicacion], [Fecha_Juridico]) VALUES (@Pla_Doc_Id, @Estado, @Com_Procedimiento_Id, @Porcentaje_Anticipo_Ref, @Plazo_Ref, @Codigo_Sercop, @Per_Personal_Resp_Exp, @Fecha_Cierre_Rec_Ofertas, @Par_Razon_Social_Id_Contratista, @Valor_Contrato, @Plazo_Contrato, @Fecha_Inicio_Contrato, @Porcentaje_Anticipo_Contrato, @Per_Personal_Id_Admin, @Desc_Contrata, @Fecha_Crea, @Com_Procedimiento_Desc, @Estado_Portal, @Estado_Contratacion, @Fecha_Inicio_Elabora_Pliegos, @Fecha_Publicacion_Portal, @Fecha_Calificaciones, @Fecha_Estimada_Adjudicacion, @Fecha_Adjudicacion, @Fecha_Juridico);
	
SELECT Id, Pla_Doc_Id, Estado, Com_Procedimiento_Id, Porcentaje_Anticipo_Ref, Plazo_Ref, Codigo_Sercop, Per_Personal_Resp_Exp, Fecha_Cierre_Rec_Ofertas, Par_Razon_Social_Id_Contratista, Valor_Contrato, Plazo_Contrato, Fecha_Inicio_Contrato, Porcentaje_Anticipo_Contrato, Per_Personal_Id_Admin, Desc_Contrata, Fecha_Crea, Com_Procedimiento_Desc, Estado_Portal, Estado_Contratacion, Fecha_Inicio_Elabora_Pliegos, Fecha_Publicacion_Portal, Fecha_Calificaciones, Fecha_Estimada_Adjudicacion, Fecha_Adjudicacion, Fecha_Juridico FROM Com_Contrato WHERE (Id = SCOPE_IDENTITY())