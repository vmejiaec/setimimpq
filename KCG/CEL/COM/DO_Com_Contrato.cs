using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.ComprasTableAdapters;
using AEL.COM;
using BEL;
using System.Data.SqlClient;

namespace CEL.COM
{
    public class DO_Com_Contrato
    {
	// adapter
    public Com_ContratoTableAdapter Adapter = new Com_ContratoTableAdapter();
	//Select
	public List<Com_Contrato> Get(Scope s)
    {
        List<Com_Contrato> lista = new List<Com_Contrato>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Contrato(
				fila.Id,
fila.Pla_Doc_Id,
fila.Estado,
fila.Com_Procedimiento_Id,
fila.Porcentaje_Anticipo_Ref,
fila.Plazo_Ref,
fila.Codigo_Sercop,
fila.Per_Personal_Resp_Exp,
fila.Fecha_Cierre_Rec_Ofertas,
fila.Par_Razon_Social_Id_Contratista,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Fecha_Inicio_Contrato,
fila.Porcentaje_Anticipo_Contrato,
fila.Per_Personal_Id_Admin,
fila.Desc_Contrata
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Contrato n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Pla_Doc_Id,
n.Estado,
n.Com_Procedimiento_Id,
n.Porcentaje_Anticipo_Ref,
n.Plazo_Ref,
n.Codigo_Sercop,
n.Per_Personal_Resp_Exp,
n.Fecha_Cierre_Rec_Ofertas,
n.Par_Razon_Social_Id_Contratista,
n.Valor_Contrato,
n.Plazo_Contrato,
n.Fecha_Inicio_Contrato,
n.Porcentaje_Anticipo_Contrato,
n.Per_Personal_Id_Admin,
n.Desc_Contrata
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Contrato o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Pla_Doc_Id,
o.Estado,
o.Com_Procedimiento_Id,
o.Porcentaje_Anticipo_Ref,
o.Plazo_Ref,
o.Codigo_Sercop,
o.Per_Personal_Resp_Exp,
o.Fecha_Cierre_Rec_Ofertas,
o.Par_Razon_Social_Id_Contratista,
o.Valor_Contrato,
o.Plazo_Contrato,
o.Fecha_Inicio_Contrato,
o.Porcentaje_Anticipo_Contrato,
o.Per_Personal_Id_Admin,
o.Desc_Contrata
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Contrato o, Com_Contrato n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Pla_Doc_Id,
n.Estado,
n.Com_Procedimiento_Id,
n.Porcentaje_Anticipo_Ref,
n.Plazo_Ref,
n.Codigo_Sercop,
n.Per_Personal_Resp_Exp,
n.Fecha_Cierre_Rec_Ofertas,
n.Par_Razon_Social_Id_Contratista,
n.Valor_Contrato,
n.Plazo_Contrato,
n.Fecha_Inicio_Contrato,
n.Porcentaje_Anticipo_Contrato,
n.Per_Personal_Id_Admin,
n.Desc_Contrata,
o.Id,
o.Pla_Doc_Id,
o.Estado,
o.Com_Procedimiento_Id,
o.Porcentaje_Anticipo_Ref,
o.Plazo_Ref,
o.Codigo_Sercop,
o.Per_Personal_Resp_Exp,
o.Fecha_Cierre_Rec_Ofertas,
o.Par_Razon_Social_Id_Contratista,
o.Valor_Contrato,
o.Plazo_Contrato,
o.Fecha_Inicio_Contrato,
o.Porcentaje_Anticipo_Contrato,
o.Per_Personal_Id_Admin,
o.Desc_Contrata,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// InsertINT
		public int InsertINT(Com_Contrato n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Pla_Doc_Id,
n.Estado,
n.Com_Procedimiento_Id,
n.Porcentaje_Anticipo_Ref,
n.Plazo_Ref,
n.Codigo_Sercop,
n.Per_Personal_Resp_Exp,
n.Fecha_Cierre_Rec_Ofertas,
n.Par_Razon_Social_Id_Contratista,
n.Valor_Contrato,
n.Plazo_Contrato,
n.Fecha_Inicio_Contrato,
n.Porcentaje_Anticipo_Contrato,
n.Per_Personal_Id_Admin,
n.Desc_Contrata
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
