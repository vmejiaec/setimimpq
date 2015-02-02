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
    public class DO_Pla_Lote_Tipo
    {
	// adapter
    public Pla_Lote_TipoTableAdapter Adapter = new Pla_Lote_TipoTableAdapter();
	//Select
	public List<Pla_Lote_Tipo> Get(Scope s)
    {
        List<Pla_Lote_Tipo> lista = new List<Pla_Lote_Tipo>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Lote_Tipo(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.Archivo_Tipo,
fila.Clase,
fila.Metodo
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Lote_Tipo n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Nombre,
n.Archivo_Tipo,
n.Clase,
n.Metodo
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Lote_Tipo o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Nombre,
o.Archivo_Tipo,
o.Clase,
o.Metodo
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Lote_Tipo o, Pla_Lote_Tipo n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Nombre,
n.Archivo_Tipo,
n.Clase,
n.Metodo,
o.Id,
o.Codigo,
o.Nombre,
o.Archivo_Tipo,
o.Clase,
o.Metodo,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_Lote_Tipo> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Lote_Tipo> lista = new List<Pla_Lote_Tipo>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Lote_Tipo(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.Archivo_Tipo,
fila.Clase,
fila.Metodo
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Lote_Tipo n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Codigo,
n.Nombre,
n.Archivo_Tipo,
n.Clase,
n.Metodo
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
