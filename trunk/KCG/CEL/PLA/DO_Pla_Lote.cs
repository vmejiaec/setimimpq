using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.PlanificacionTableAdapters;
using AEL.PLA;
using BEL;
using System.Data.SqlClient;

namespace CEL.PLA
{
    public class DO_Pla_Lote
    {
	// adapter
    public Pla_LoteTableAdapter Adapter = new Pla_LoteTableAdapter();
	//Select
	public List<Pla_Lote> Get(Scope s)
    {
        List<Pla_Lote> lista = new List<Pla_Lote>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Lote(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.URL_Archivo_IN,
fila.Pla_Lote_Tipo_Id,
fila.Resultado,
fila.URL_Archivo_OUT,
fila.Estado,
fila.Lote_Fecha
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Lote n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Nombre,
n.URL_Archivo_IN,
n.Pla_Lote_Tipo_Id,
n.Resultado,
n.URL_Archivo_OUT,
n.Estado,
n.Lote_Fecha
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Lote o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Nombre,
o.URL_Archivo_IN,
o.Pla_Lote_Tipo_Id,
o.Resultado,
o.URL_Archivo_OUT,
o.Estado,
o.Lote_Fecha
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Lote o, Pla_Lote n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Nombre,
n.URL_Archivo_IN,
n.Pla_Lote_Tipo_Id,
n.Resultado,
n.URL_Archivo_OUT,
n.Estado,
n.Lote_Fecha,
o.Id,
o.Codigo,
o.Nombre,
o.URL_Archivo_IN,
o.Pla_Lote_Tipo_Id,
o.Resultado,
o.URL_Archivo_OUT,
o.Estado,
o.Lote_Fecha,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_Lote> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Lote> lista = new List<Pla_Lote>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Lote(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.URL_Archivo_IN,
fila.Pla_Lote_Tipo_Id,
fila.Resultado,
fila.URL_Archivo_OUT,
fila.Estado,
fila.Lote_Fecha
				));
			}
			return lista;
		}
		// GetByPla_Lote_Tipo_Id
		public List<Pla_Lote> GetByPla_Lote_Tipo_Id (Scope s , Int32 p_Pla_Lote_Tipo_Id)
		{
			List<Pla_Lote> lista = new List<Pla_Lote>();
			var tabla = Adapter.GetByPla_Lote_Tipo_Id( p_Pla_Lote_Tipo_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Lote(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.URL_Archivo_IN,
fila.Pla_Lote_Tipo_Id,
fila.Resultado,
fila.URL_Archivo_OUT,
fila.Estado,
fila.Lote_Fecha
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Lote n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Codigo,
n.Nombre,
n.URL_Archivo_IN,
n.Pla_Lote_Tipo_Id,
n.Resultado,
n.URL_Archivo_OUT,
n.Estado,
n.Lote_Fecha
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
