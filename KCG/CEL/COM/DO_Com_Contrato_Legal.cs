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
    public class DO_Com_Contrato_Legal
    {
	// adapter
    public Com_Contrato_LegalTableAdapter Adapter = new Com_Contrato_LegalTableAdapter();
	//Select
	public List<Com_Contrato_Legal> Get(Scope s)
    {
        List<Com_Contrato_Legal> lista = new List<Com_Contrato_Legal>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Contrato_Legal(
				fila.Id,
fila.Com_Contrato_Id,
fila.Com_Contrato_Tipo_Id,
fila.URL_Contrato_Word,
fila.URL_Contrato_Scan,
fila.Desc_Alerta_1,
fila.Desc_Alerta_2,
fila.Desc_Alerta_3,
fila.Fecha_Firma_Contrato,
fila.Fecha_Contrato,
fila.Pla_Doc_Id,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Par_Razon_Social_Id_Contratista,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Contrato_Legal n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Com_Contrato_Id,
n.Com_Contrato_Tipo_Id,
n.URL_Contrato_Word,
n.URL_Contrato_Scan,
n.Desc_Alerta_1,
n.Desc_Alerta_2,
n.Desc_Alerta_3,
n.Fecha_Firma_Contrato,
n.Fecha_Contrato
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Contrato_Legal o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Com_Contrato_Id,
o.Com_Contrato_Tipo_Id,
o.URL_Contrato_Word,
o.URL_Contrato_Scan,
o.Desc_Alerta_1,
o.Desc_Alerta_2,
o.Desc_Alerta_3,
o.Fecha_Firma_Contrato,
o.Fecha_Contrato
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Contrato_Legal o, Com_Contrato_Legal n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Com_Contrato_Id,
n.Com_Contrato_Tipo_Id,
n.URL_Contrato_Word,
n.URL_Contrato_Scan,
n.Desc_Alerta_1,
n.Desc_Alerta_2,
n.Desc_Alerta_3,
n.Fecha_Firma_Contrato,
n.Fecha_Contrato,
o.Id,
o.Com_Contrato_Id,
o.Com_Contrato_Tipo_Id,
o.URL_Contrato_Word,
o.URL_Contrato_Scan,
o.Desc_Alerta_1,
o.Desc_Alerta_2,
o.Desc_Alerta_3,
o.Fecha_Firma_Contrato,
o.Fecha_Contrato,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByCom_Contrato_Id
		public List<Com_Contrato_Legal> GetByCom_Contrato_Id (Scope s , Int32 p_Com_Contrato_Id)
		{
			List<Com_Contrato_Legal> lista = new List<Com_Contrato_Legal>();
			var tabla = Adapter.GetByCom_Contrato_Id( p_Com_Contrato_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Legal(
				fila.Id,
fila.Com_Contrato_Id,
fila.Com_Contrato_Tipo_Id,
fila.URL_Contrato_Word,
fila.URL_Contrato_Scan,
fila.Desc_Alerta_1,
fila.Desc_Alerta_2,
fila.Desc_Alerta_3,
fila.Fecha_Firma_Contrato,
fila.Fecha_Contrato,
fila.Pla_Doc_Id,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Par_Razon_Social_Id_Contratista,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista
				));
			}
			return lista;
		}
		// GetById
		public List<Com_Contrato_Legal> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Contrato_Legal> lista = new List<Com_Contrato_Legal>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Legal(
				fila.Id,
fila.Com_Contrato_Id,
fila.Com_Contrato_Tipo_Id,
fila.URL_Contrato_Word,
fila.URL_Contrato_Scan,
fila.Desc_Alerta_1,
fila.Desc_Alerta_2,
fila.Desc_Alerta_3,
fila.Fecha_Firma_Contrato,
fila.Fecha_Contrato,
fila.Pla_Doc_Id,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Par_Razon_Social_Id_Contratista,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_Contrato_Legal n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Com_Contrato_Id,
n.Com_Contrato_Tipo_Id,
n.URL_Contrato_Word,
n.URL_Contrato_Scan,
n.Desc_Alerta_1,
n.Desc_Alerta_2,
n.Desc_Alerta_3,
n.Fecha_Firma_Contrato,
n.Fecha_Contrato
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
